[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/1zNoHsXq)
# Assignment 5: Two-Resistor Circuit Analyzer

> **Warning:** Only edit `circuit_analyzer.c`. Do not touch `Makefile`, `tests/`, or any other file already in the repository. Unauthorised changes to these files will cause your submission to fail automatically.

## Why This Assignment (Progression)

This task combines key skills from previous assignments:

- Assignment 2: arithmetic, data types, formatting
- Assignment 3: user input with `scanf`
- Assignment 4: function-based decomposition

Now you must combine **functions + switch + if/else** in one complete program.

## Objective

Design a C program that analyzes a circuit with exactly two resistors.

### Inputs

1. Resistance `R1` (ohms)
2. Resistance `R2` (ohms)
3. Connection type:
 - `1` -> Series
 - `2` -> Parallel
4. Supply voltage (V)

### Step 1: Equivalent Resistance

For series:

$$R_{eq} = R_1 + R_2$$

For parallel:

$$R_{eq} = \frac{R_1R_2}{R_1 + R_2}$$

### Step 2: Current

$$I = \frac{V}{R_{eq}}$$

### Step 3: Safety Status (if/else)

- If `current <= 0.5` -> `SAFE`
- If `0.5 < current <= 1.0` -> `WARNING`
- If `current > 1.0` -> `DANGEROUS`

## Requirements

- Use at least three functions:
 	- `calculate_equivalent_resistance(...)`
 	- `calculate_current(...)`
 	- `get_status(...)`
- Use a `switch` statement for circuit type (series vs parallel).
- Use `if/else` for safety classification.
- Declare function prototypes before `main()`.
- Place full function definitions below `main()`.
- Use `double` for electrical calculations.
- Do not use arrays.
- Do not use loops (`for`, `while`, `do-while`).

## Output Format

For valid input, print exactly these lines (same labels/capitalisation):

```
Equivalent Resistance: XX.XX ohms
Current: XX.XX A
Status: SAFE|WARNING|DANGEROUS
```

For invalid connection type, print:

```
Invalid connection type
```

## Submission

Push your code to GitHub and verify all tests pass in Actions.
