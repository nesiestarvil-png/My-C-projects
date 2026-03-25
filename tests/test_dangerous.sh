#!/bin/bash
# Parallel circuit: 10 || 10 = 5 ohms; I = 12/5 = 2.40 A -> DANGEROUS

output=$(printf "10\n10\n2\n12\n" | ./circuit_analyzer)

if ! echo "$output" | grep -q "Equivalent Resistance: 5.00 ohms"; then
    echo "Fail: dangerous equivalent resistance incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Current: 2.40 A"; then
    echo "Fail: dangerous current incorrect"
    echo "Got: $output"
    exit 1
fi

if ! echo "$output" | grep -q "Status: DANGEROUS"; then
    echo "Fail: dangerous status incorrect"
    echo "Got: $output"
    exit 1
fi

echo "Pass: DANGEROUS case"
exit 0
