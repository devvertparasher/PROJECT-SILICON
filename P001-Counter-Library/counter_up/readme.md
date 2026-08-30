# P001.1 — 4-bit Up Counter

## Description

A synchronous 4-bit up counter written in Verilog.

The counter updates on every positive edge of the clock. When reset is
asserted, the counter returns to `0`. Otherwise, the counter increments
by `1` on each clock cycle.

## Behavior

| Reset | Operation |
|-------|-----------|
| 1 | Count resets to 0 |
| 0 | Count increments by 1 |

The counter follows:

`0 → 1 → 2 → 3 → ... → 14 → 15 → 0 → ...`

Since the counter is 4 bits wide, incrementing `15` produces a
wrap-around to `0`.

## Interface

| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| `clk` | Input | 1 bit | Clock signal |
| `reset` | Input | 1 bit | Active-high synchronous reset |
| `count` | Output | 4 bits | Current counter value |

