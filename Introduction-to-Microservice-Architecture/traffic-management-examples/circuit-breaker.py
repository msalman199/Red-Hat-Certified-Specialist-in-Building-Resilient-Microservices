#!/usr/bin/env python3
import random
import time


class CircuitBreakerSimulator:
    def __init__(self, failure_threshold=3, reset_timeout=5):
        self.state = 'CLOSED'
        self.failure_count = 0
        self.failure_threshold = failure_threshold
        self.reset_timeout = reset_timeout
        self.last_failure_time = None
        self.success_count_in_half_open = 0
        self.half_open_success_target = 2

    def generate_destination_rule(self):
        dr_config = """apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
  name: payment-service-circuit-breaker
  namespace: ecommerce
spec:
  host: payment-service
  trafficPolicy:
    connectionPool:
      tcp:
        maxConnections: 20
      http:
        http1MaxPendingRequests: 10
        maxRequestsPerConnection: 5
    outlierDetection:
      consecutive5xxErrors: 3
      interval: 10s
      baseEjectionTime: 30s
      maxEjectionPercent: 50
"""
        return dr_config

    def check_circuit(self):
        """Return True if a request is currently allowed through."""
        if self.state == 'CLOSED':
            return True

        if self.state == 'OPEN':
            elapsed = time.time() - self.last_failure_time
            if elapsed >= self.reset_timeout:
                self.state = 'HALF_OPEN'
                self.success_count_in_half_open = 0
                print(f"  [circuit] timeout elapsed ({elapsed:.1f}s) -> HALF_OPEN")
                return True
            return False

        # HALF_OPEN: allow a limited trial request through
        return True

    def record_success(self):
        if self.state == 'HALF_OPEN':
            self.success_count_in_half_open += 1
            if self.success_count_in_half_open >= self.half_open_success_target:
                self.state = 'CLOSED'
                self.failure_count = 0
                print("  [circuit] trial requests succeeded -> CLOSED")
        elif self.state == 'CLOSED':
            self.failure_count = 0

    def record_failure(self):
        self.last_failure_time = time.time()
        if self.state == 'HALF_OPEN':
            self.state = 'OPEN'
            print("  [circuit] trial request failed in HALF_OPEN -> OPEN")
            return

        self.failure_count += 1
        if self.failure_count >= self.failure_threshold:
            self.state = 'OPEN'
            print(f"  [circuit] failure threshold reached ({self.failure_count}) -> OPEN")


def simulate_request(breaker, force_failure=False):
    if not breaker.check_circuit():
        print("  Request BLOCKED (circuit OPEN)")
        return "blocked"

    # Simulate a call that fails ~40% of the time, or always fails if forced
    failed = force_failure or (random.random() < 0.4)

    if failed:
        breaker.record_failure()
        print(f"  Request FAILED (state now: {breaker.state})")
        return "failed"
    else:
        breaker.record_success()
        print(f"  Request SUCCEEDED (state now: {breaker.state})")
        return "succeeded"


def main():
    random.seed(42)
    breaker = CircuitBreakerSimulator(failure_threshold=3, reset_timeout=2)

    print("GENERATED DESTINATION RULE")
    print("=" * 50)
    print(breaker.generate_destination_rule())

    print("CIRCUIT BREAKER SIMULATION")
    print("=" * 50)

    print("\nPhase 1: Forcing consecutive failures to trip the circuit")
    for i in range(1, 5):
        print(f"Request {i} (state before: {breaker.state}):")
        simulate_request(breaker, force_failure=True)

    print("\nPhase 2: Requests while circuit is OPEN (should be blocked)")
    for i in range(1, 3):
        print(f"Request {i} (state before: {breaker.state}):")
        simulate_request(breaker)

    print(f"\nWaiting {breaker.reset_timeout} seconds for reset timeout...")
    time.sleep(breaker.reset_timeout + 0.5)

    print("\nPhase 3: Trial requests in HALF_OPEN (forcing success to close circuit)")
    for i in range(1, 4):
        print(f"Request {i} (state before: {breaker.state}):")
        simulate_request(breaker, force_failure=False)
        if breaker.state == 'CLOSED':
            break

    print(f"\nFinal circuit state: {breaker.state}")


if __name__ == "__main__":
    main()
