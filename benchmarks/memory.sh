# Start your python server
python3 -m http.server 8080 &>/dev/null &
PID=$!
sleep 1

# Read memory stats
cat /proc/$PID/status | grep -E "VmRSS|VmSize"

kill $PID
