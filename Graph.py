import pandas as pd
import matplotlib.pyplot as plt

# Load the data
df = pd.read_csv("curl_metrics.csv")

# Separate data by protocol
http2 = df[df['protocol'] == 'http2'].reset_index(drop=True)
http3 = df[df['protocol'] == 'http3'].reset_index(drop=True)

# Plot
plt.figure(figsize=(10, 6))
plt.plot(http2.index + 1, http2['time_total'], marker='o', label='HTTP/2')
plt.plot(http3.index + 1, http3['time_total'], marker='o', label='HTTP/3')

# Labels and title
plt.xlabel("Run")
plt.ylabel("Total Time (s)")
plt.title("HTTP/2 vs HTTP/3 Total Time per Run")
plt.legend()
plt.grid(True)

# Save the plot
plt.savefig("http2_vs_http3_comparison.png")
plt.show()

