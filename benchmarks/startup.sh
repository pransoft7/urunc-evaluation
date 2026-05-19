#!/bin/bash

# Repeated cold-start time for average
for i in $(seq 1 10); do
    start=$(date +%s%N)
    python3 -m http.server 8080 &>/dev/null &
    PID=$!
    until curl -s http://localhost:8080 > /dev/null 2>&1; do sleep 0.001; done
    end=$(date +%s%N)
    echo "Run $i: $(( (end - start) / 1000000 ))ms"
    kill $PID 2>/dev/null
    sleep 0.5
done