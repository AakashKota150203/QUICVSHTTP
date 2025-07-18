from flask import Flask, Response
import subprocess
import time

app = Flask(__name__)

@app.route('/metrics')
def metrics():
    urls = {
        "quic": "https://localhost:4433",
        "http2": "https://localhost:8443"
    }

    output = []
    for proto, url in urls.items():
        try:
            start = time.time()
            subprocess.run(
                ["curl", "-s", "--http3" if proto == "quic" else "--http2", url],
                timeout=5,
                check=True
            )
            elapsed = time.time() - start
            output.append(f'curl_response_time_seconds{{protocol="{proto}"}} {elapsed:.4f}')
        except subprocess.CalledProcessError:
            output.append(f'curl_response_time_seconds{{protocol="{proto}"}} -1')
    return Response("\n".join(output), mimetype='text/plain')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9100)

