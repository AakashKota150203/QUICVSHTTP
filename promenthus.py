from prometheus_client import start_http_server, Summary
import time
import random

# Define a Summary metric for latency
http_latency = Summary('http_latency_seconds', 'Request latency in seconds', ['protocol'])

def simulate_requests():
    while True:
        # Simulate latency data
        quic_latency = random.uniform(0.05, 0.2)
        http2_latency = random.uniform(0.1, 0.3)

        http_latency.labels(protocol="quic").observe(quic_latency)
        http_latency.labels(protocol="http2").observe(http2_latency)

        time.sleep(2)

if __name__ == '__main__':
    start_http_server(8000)  # Exposes metrics at localhost:8000/metrics
    simulate_requests()

