const express = require('express');
const axios = require('axios');
const CircuitBreaker = require('opossum');
const client = require('prom-client');

const app = express();
const PORT = process.env.PORT || 3001;

// Prometheus metrics
const register = new client.Registry();
client.collectDefaultMetrics({ register });

// Circuit breaker metrics
const circuitBreakerCounter = new client.Counter({
  name: 'circuit_breaker_events_total',
  help: 'Total number of circuit breaker events',
  labelNames: ['service', 'event'],
  registers: [register]
});

const requestDuration = new client.Histogram({
  name: 'request_duration_seconds',
  help: 'Duration of requests in seconds',
  labelNames: ['service', 'status'],
  registers: [register]
});

app.use(express.json());

// Circuit breaker options
const circuitBreakerOptions = {
  timeout: 3000, // If function takes longer than 3 seconds, trigger failure
  errorThresholdPercentage: 50, // When 50% of requests fail, trip circuit
  resetTimeout: 10000, // After 10 seconds, try again
  rollingCountTimeout: 10000, // Number of milliseconds to keep metrics
  rollingCountBuckets: 10, // Number of buckets to keep metrics in
  name: 'orderServiceBreaker',
  group: 'orderService'
};

// Function to call order service
async function callOrderService(userId) {
  const start = Date.now();
  try {
    const response = await axios.get(`http://order-service:3002/orders/${userId}`, {
      timeout: 2500
    });
    
    const duration = (Date.now() - start) / 1000;
    requestDuration.labels('order-service', 'success').observe(duration);
    
    return response.data;
  } catch (error) {
    const duration = (Date.now() - start) / 1000;
    requestDuration.labels('order-service', 'error').observe(duration);
    
    throw error;
  }
}

// Create circuit breaker for order service
const orderServiceBreaker = new CircuitBreaker(callOrderService, circuitBreakerOptions);

// Circuit breaker event handlers
orderServiceBreaker.on('open', () => {
  console.log('Circuit breaker opened for order service');
  circuitBreakerCounter.labels('order-service', 'open').inc();
});

orderServiceBreaker.on('halfOpen', () => {
  console.log('Circuit breaker half-opened for order service');
  circuitBreakerCounter.labels('order-service', 'half-open').inc();
});

orderServiceBreaker.on('close', () => {
  console.log('Circuit breaker closed for order service');
  circuitBreakerCounter.labels('order-service', 'close').inc();
});

orderServiceBreaker.on('failure', (error) => {
  console.log('Circuit breaker failure:', error.message);
  circuitBreakerCounter.labels('order-service', 'failure').inc();
});

orderServiceBreaker.on('success', () => {
  circuitBreakerCounter.labels('order-service', 'success').inc();
});

orderServiceBreaker.on('reject', () => {
  console.log('Circuit breaker rejected request');
  circuitBreakerCounter.labels('order-service', 'reject').inc();
});

// Fallback function for when circuit breaker is open
orderServiceBreaker.fallback(() => {
  return {
    orders: [],
    message: 'Order service is currently unavailable. Please try again later.',
    fallback: true
  };
});

// Routes
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', service: 'user-service' });
});

app.get('/users/:id/orders', async (req, res) => {
  const userId = req.params.id;
  
  try {
    const orders = await orderServiceBreaker.fire(userId);
    res.json({
      userId: userId,
      orders: orders,
      circuitBreakerState: orderServiceBreaker.stats
    });
  } catch (error) {
    res.status(503).json({
      error: 'Service temporarily unavailable',
      message: error.message,
      circuitBreakerState: orderServiceBreaker.stats
    });
  }
});

app.get('/circuit-breaker/stats', (req, res) => {
  res.json({
    orderService: {
      state: orderServiceBreaker.opened ? 'OPEN' : orderServiceBreaker.halfOpen ? 'HALF_OPEN' : 'CLOSED',
      stats: orderServiceBreaker.stats
    }
  });
});

// Metrics endpoint for Prometheus
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

app.listen(PORT, () => {
  console.log(`User service running on port ${PORT}`);
});
