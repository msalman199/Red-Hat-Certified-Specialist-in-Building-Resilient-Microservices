const express = require('express');
const client = require('prom-client');

const app = express();
const PORT = process.env.PORT || 3002;

// Prometheus metrics
const register = new client.Registry();
client.collectDefaultMetrics({ register });

const requestCounter = new client.Counter({
  name: 'order_service_requests_total',
  help: 'Total number of requests to order service',
  labelNames: ['status'],
  registers: [register]
});

app.use(express.json());

// Service state management
let serviceState = {
  healthy: true,
  failureRate: 0, // 0-100 percentage
  responseDelay: 0 // milliseconds
};

// Simulate orders data
const ordersData = {
  '1': [
    { id: 'order-1', item: 'Laptop', amount: 999.99, status: 'completed' },
    { id: 'order-2', item: 'Mouse', amount: 29.99, status: 'pending' }
  ],
  '2': [
    { id: 'order-3', item: 'Keyboard', amount: 79.99, status: 'completed' }
  ],
  '3': []
};

// Helper function to simulate failures
function shouldFail() {
  return Math.random() * 100 < serviceState.failureRate;
}

// Routes
app.get('/health', (req, res) => {
  if (serviceState.healthy && !shouldFail()) {
    requestCounter.labels('success').inc();
    res.json({ status: 'healthy', service: 'order-service' });
  } else {
    requestCounter.labels('error').inc();
    res.status(503).json({ status: 'unhealthy', service: 'order-service' });
  }
});

app.get('/orders/:userId', async (req, res) => {
  const userId = req.params.userId;
  
  // Simulate response delay
  if (serviceState.responseDelay > 0) {
    await new Promise(resolve => setTimeout(resolve, serviceState.responseDelay));
  }
  
  // Simulate failures based on failure rate
  if (!serviceState.healthy || shouldFail()) {
    requestCounter.labels('error').inc();
    return res.status(500).json({
      error: 'Internal server error',
      message: 'Order service is experiencing issues'
    });
  }
  
  requestCounter.labels('success').inc();
  res.json({
    userId: userId,
    orders: ordersData[userId] || [],
    timestamp: new Date().toISOString()
  });
});

// Admin endpoints to control service behavior
app.post('/admin/set-health', (req, res) => {
  const { healthy } = req.body;
  serviceState.healthy = healthy;
  console.log(`Service health set to: ${healthy}`);
  res.json({ message: `Service health set to ${healthy}`, state: serviceState });
});

app.post('/admin/set-failure-rate', (req, res) => {
  const { rate } = req.body;
  serviceState.failureRate = Math.max(0, Math.min(100, rate));
  console.log(`Failure rate set to: ${serviceState.failureRate}%`);
  res.json({ message: `Failure rate set to ${serviceState.failureRate}%`, state: serviceState });
});

app.post('/admin/set-delay', (req, res) => {
  const { delay } = req.body;
  serviceState.responseDelay = Math.max(0, delay);
  console.log(`Response delay set to: ${serviceState.responseDelay}ms`);
  res.json({ message: `Response delay set to ${serviceState.responseDelay}ms`, state: serviceState });
});

app.get('/admin/state', (req, res) => {
  res.json(serviceState);
});

// Metrics endpoint
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

app.listen(PORT, () => {
  console.log(`Order service running on port ${PORT}`);
  console.log('Admin endpoints available:');
  console.log('  POST /admin/set-health - Set service health (true/false)');
  console.log('  POST /admin/set-failure-rate - Set failure rate (0-100)');
  console.log('  POST /admin/set-delay - Set response delay (milliseconds)');
  console.log('  GET /admin/state - Get current service state');
});
