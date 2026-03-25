#!/bin/bash
# Invalid connection type must be rejected

output=$(printf "100\n200\n3\n12\n" | ./circuit_analyzer)

if echo "$output" | grep -q "Invalid connection type"; then
    echo "Pass: invalid connection handled"
else
    echo "Fail: expected invalid connection type message"
    echo "Got: $output"
    exit 1
fi

exit 0
