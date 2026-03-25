#!/bin/bash
# Parallel circuit: 100 || 100 = 50 ohms; I = 12/50 = 0.24 A -> SAFE

output=$(printf "100\n100\n2\n12\n" | ./circuit_analyzer)

if ! echo "$output" | grep -q "Equivalent Resistance: 50.00 ohms"; then
    echo "Fail: parallel equivalent resistance incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Current: 0.24 A"; then
    echo "Fail: parallel current incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Status: SAFE"; then
    echo "Fail: parallel status incorrect"
    echo "Got: $output"
    exit 1
fi

echo "Pass: parallel SAFE case"
exit 0
