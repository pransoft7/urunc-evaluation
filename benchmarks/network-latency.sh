# Start a simple echo server
python3 -c "
import socket
s = socket.socket()
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(('127.0.0.1', 9999))
s.listen(1)
conn, _ = s.accept()
while True:
    data = conn.recv(1024)
    if not data: break
    conn.sendall(data)
" &
SERVER_PID=$!
sleep 0.5

# Measure round trip latency 1000 times
python3 -c "
import socket, time
s = socket.socket()
s.connect(('127.0.0.1', 9999))
times = []
for i in range(1000):
    msg = b'ping'
    t0 = time.perf_counter_ns()
    s.sendall(msg)
    s.recv(1024)
    t1 = time.perf_counter_ns()
    times.append((t1 - t0) / 1000)  # microseconds
times.sort()
print(f'p50:  {times[499]:.1f} us')
print(f'p95:  {times[949]:.1f} us')
print(f'p99:  {times[989]:.1f} us')
print(f'mean: {sum(times)/len(times):.1f} us')
"

kill $SERVER_PID 2>/dev/null