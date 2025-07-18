# QUIC vs HTTP/2 Benchmarking over 5G Edge with CDN Caching

This project evaluates the **end-to-end performance of QUIC vs HTTP/2** protocols in a realistic environment simulating **5G edge latency**, **CDN caching**, and **live observability** using Prometheus and Grafana.

---

🚀 Project Overview

- **QUIC Server:** Caddy with HTTP/3 (QUIC) support
- **HTTP/2 Server:** NGINX configured with SSL and HTTP/2
- **Edge CDN:** Simulated using an intermediate Caddy reverse proxy
- **5G Simulation:** NetEm traffic control (`tc`) to simulate latency, jitter, and loss
- **Observability:** Prometheus (scraping cAdvisor and Python exporter)
- **Visualization:** Grafana with custom dashboards

---

📁 Folder Structure

quic-vs-http2-cdn/
├── caddy/ # QUIC server setup (Caddy)
│ ├── Caddyfile
│ ├── video/ # DASH video file(s)
├── nginx/ # HTTP/2 server (NGINX)
│ ├── conf/
│ ├── certs/
├── edge/ # Edge CDN reverse proxy (Caddy)
│ ├── Caddyfile
├── promenthus.py # Python exporter for curl latency
├── prometheus.yml # Prometheus scrape config
├── docker-compose.yml # All services
└── .gitignore


---

## ⚙️ How to Run

1. **Clone the Repo**
```bash
git clone https://github.com/your-username/quic-vs-http2-cdn.git
cd quic-vs-http2-cdn

    Build and Launch

docker-compose up --build

    Access Services
    | Service | URL |
    |-------------|------------------------------|
    | QUIC Video | https://localhost:4433/video.mpd |
    | HTTP/2 Video| https://localhost:8443/video.mpd |
    | Edge CDN | http://localhost:8081/quic/video.mpd |
    | Prometheus | http://localhost:9090 |
    | Grafana | http://localhost:3000 |

🔐 Grafana Login

    Username: admin

    Password: admin

📊 Metrics Collected
1. Python Exporter (promenthus.py):

    http_latency_seconds{protocol="quic"}

    http_latency_seconds{protocol="http2"}

2. cAdvisor:

    CPU / Memory usage per container

    Network I/O

    Disk usage

📈 Suggested Grafana Panels

Here are PromQL queries you can use:
Metric	PromQL Query Example
Avg Latency - QUIC	rate(http_latency_seconds_sum{protocol="quic"}[1m]) / rate(http_latency_seconds_count{protocol="quic"}[1m])
Avg Latency - HTTP/2	rate(http_latency_seconds_sum{protocol="http2"}[1m]) / rate(http_latency_seconds_count{protocol="http2"}[1m])
Requests per Protocol	rate(http_latency_seconds_count[1m])
CPU Usage by Container	rate(container_cpu_usage_seconds_total[1m])
Memory Usage by Container	container_memory_usage_bytes
📡 Simulating 5G Edge Network

Inside the edge-cdn container:

docker exec -it edge-cdn sh
apk add iproute2  # Alpine Linux package manager
tc qdisc add dev eth0 root netem delay 20ms 5ms distribution normal loss 0.1% rate 100mbit

This adds latency, jitter, packet loss, and bandwidth limits to emulate a real 5G edge network.
🧪 Performance Testing Method

    Use promenthus.py to send curl requests to:

        http2: https://localhost:8443/video.mpd

        quic: https://localhost:4433/video.mpd

    Collect latency data and expose metrics on port 8000

    Scraped by Prometheus for visualization in Grafana

📜 License

MIT License © 2025 Aakash Kota
🙌 Credits

    Caddy Server

    NGINX

    Prometheus

    Grafana

    cAdvisor

