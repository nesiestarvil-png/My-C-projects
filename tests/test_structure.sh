#!/bin/bash
# Structural checks: prototypes before main, function definitions below main,
# switch for circuit type, if/else for safety status, no loops/arrays.

file="circuit_analyzer.c"

if [ ! -f "$file" ]; then
    echo "Fail: $file not found"
    exit 1
fi

if ! grep -Eq "double[[:space:]]+calculate_equivalent_resistance[[:space:]]*\(" "$file"; then
    echo "Fail: missing calculate_equivalent_resistance declaration/definition"
    exit 1
fi

if ! grep -Eq "double[[:space:]]+calculate_current[[:space:]]*\(" "$file"; then
    echo "Fail: missing calculate_current declaration/definition"
    exit 1
fi

if ! grep -Eq "(char[[:space:]]*\*|const[[:space:]]+char[[:space:]]*\*)[[:space:]]+get_status[[:space:]]*\(" "$file"; then
    echo "Fail: missing get_status declaration/definition"
    exit 1
fi

main_line=$(grep -n "int[[:space:]]\+main[[:space:]]*(" "$file" | head -1 | cut -d: -f1)
if [ -z "$main_line" ]; then
    echo "Fail: main function not found"
    exit 1
fi

proto_line=$(grep -n "calculate_equivalent_resistance[[:space:]]*(" "$file" | head -1 | cut -d: -f1)
if [ "$proto_line" -ge "$main_line" ]; then
    echo "Fail: function prototypes must be above main"
    exit 1
fi

def_line=$(grep -n "double[[:space:]]\+calculate_equivalent_resistance[[:space:]]*(" "$file" | tail -1 | cut -d: -f1)
if [ "$def_line" -le "$main_line" ]; then
    echo "Fail: function definitions must be below main"
    exit 1
fi

if ! grep -Eq "switch[[:space:]]*\(" "$file"; then
    echo "Fail: switch statement not found"
    exit 1
fi

if ! grep -Eq "if[[:space:]]*\(" "$file"; then
    echo "Fail: if statement not found"
    exit 1
fi

if ! grep -q "else" "$file"; then
    echo "Fail: else block not found"
    exit 1
fi

if grep -Eq "(^|[^[:alnum:]_])for[[:space:]]*\(" "$file"; then
    echo "Fail: loops are not allowed (found for-loop)"
    exit 1
fi

if grep -Eq "(^|[^[:alnum:]_])while[[:space:]]*\(" "$file"; then
    echo "Fail: loops are not allowed (found while-loop)"
    exit 1
fi

if grep -Eq "(^|[^[:alnum:]_])do[[:space:]]*\{" "$file"; then
    echo "Fail: loops are not allowed (found do-while)"
    exit 1
fi

if grep -Eq "\[[[:space:]]*[0-9]*[[:space:]]*\]" "$file"; then
    echo "Fail: arrays are not allowed"
    exit 1
fi

echo "Pass: structure requirements satisfied"
exit 0
