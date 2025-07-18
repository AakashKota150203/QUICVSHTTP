#!/bin/bash

# Interface to capture traffic on (change if needed)
INTERFACE="eth0"

# Duration of capture in seconds
DURATION=15

# Output pcap file names
OUTPUT_HTTP2="http2_capture.pcapng"
OUTPUT_HTTP3="http3_capture.pcapng"

# Create folder to store captures
mkdir -p captures

echo "Starting HTTP/2 traffic capture for $DURATION seconds..."
tshark -i "$INTERFACE" -a duration:"$DURATION" -f "tcp port 443" -w "captures/$OUTPUT_HTTP2" &
PID_HTTP2=$!

# Wait for capture to finish
wait $PID_HTTP2
echo "HTTP/2 capture complete."

echo "Starting HTTP/3 (QUIC) traffic capture for $DURATION seconds..."
tshark -i "$INTERFACE" -a duration:"$DURATION" -f "udp port 443" -w "captures/$OUTPUT_HTTP3" &
PID_HTTP3=$!

# Wait for capture to finish
wait $PID_HTTP3
echo "HTTP/3 capture complete."

echo "All captures saved in ./captures/"

