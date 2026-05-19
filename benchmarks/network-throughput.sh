# Do not run this script as it is
# Terminal 1 - server
iperf3 -s -p 5201

# Terminal 2 - client
iperf3 -c 127.0.0.1 -p 5201 -t 10 -i 1

# 64 byte messages - stresses per-packet cost, not bulk throughput
iperf3 -c 127.0.0.1 -p 5201 -t 10 -l 64