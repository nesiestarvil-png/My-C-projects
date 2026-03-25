#!/bin/bash
# Series circuit: 10 + 6 = 16 ohms; I = 12/16 = 0.75 A -> WARNING

output=$(printf "10\n6\n1\n12\n" | ./circuit_analyzer)

if ! echo "$output" | grep -q "Equivalent Resistance: 16.00 ohms"; then
    echo "Fail: warning equivalent resistance incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Current: 0.75 A"; then
    echo "Fail: warning current incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Status: WARNING"; then
    echo "Fail: warning status incorrect"
    echo "Got: $output"
    exit 1
fi

echo "Pass: WARNING case"
exit 0
