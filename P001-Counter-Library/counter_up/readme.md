# P001.1 — 4-bit Up Counter

## Description

A parameterized synchronous up counter written in Verilog, with a default width of 4 bits.

The counter updates on every positive edge of the clock. When rst is
asserted, the counter returns to `0`. Otherwise, the counter increments
by `1` on each clock cycle.

## Behavior

| Reset | Operation |
|-------|-----------|
| 1 | Count resets to 0 |
| 0 | Count increments by 1 |

The counter follows:

`0 → 1 → 2 → 3 → ... → 14 → 15 → 0 → ...`

Since the default counter width is 4 bits, incrementing `15` produces a
wrap-around to `0`.

## Interface

| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| `clk` | Input | 1 bit | Clock signal |
| `rst` | Input | 1 bit | Active-high synchronous reset |
| `count` | Output | `WIDTH` bits | Current counter value |

