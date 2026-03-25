#!/bin/bash
# Series circuit: 100 + 200 = 300 ohms; I = 12/300 = 0.04 A -> SAFE

output=$(printf "100\n200\n1\n12\n" | ./circuit_analyzer)

if ! echo "$output" | grep -q "Equivalent Resistance: 300.00 ohms"; then
    echo "Fail: series equivalent resistance incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Current: 0.04 A"; then
    echo "Fail: series current incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Status: SAFE"; then
    echo "Fail: series status incorrect"
    echo "Got: $output"
    exit 1
fi

echo "Pass: series SAFE case"
exit 0
