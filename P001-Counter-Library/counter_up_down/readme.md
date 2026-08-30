# P001.3 - Up/Down Counter

## Overview

This project implements a 4-bit synchronous Up/Down Counter in Verilog HDL.

The counter increments or decrements based on the `up_down` control signal while supporting synchronous reset and enable functionality.

---

## Features

- 4-bit Counter
- Positive Edge Triggered
- Synchronous Reset
- Enable Control
- Up Counting
- Down Counting
- Counter Hold Mode

# Interface & Behavior

| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| `clk` | Input | 1 bit | Clock signal |
| `reset` | Input | 1 bit | Active-high synchronous reset |
| `enable` | Input | 1 bit | Enables counting |
| `up_down` | Input | 1 bit | `1` = count up, `0` = count down |
| `count` | Output | 4 bits | Current counter value |

### Operation

- `reset = 1` → `count = 0`
- `reset = 0`, `enable = 0` → counter holds its value
- `reset = 0`, `enable = 1`, `up_down = 1` → counter increments
- `reset = 0`, `enable = 1`, `up_down = 0` → counter decrements

The counter wraps around because it is 4 bits wide:

`15 → 0` when counting up

`0 → 15` when counting down**

## Files

- `rtl.v` — RTL implementation
- `tb.v` — Verification testbench
- `netlist.v` — Yosys-generated synthesized netlist
- `architecture.md` — Design architecture
- `gtkwave.png` — Simulation waveform
- `yosys.png` — Synthesis evidence
---

## Tools Used

- VS Code
- Ubuntu 24.04 (WSL2)
- Icarus Verilog
- GTKWave
- Yosys

---

## Verification

✔ Functional Simulation

✔ GTKWave Verification

✔ Yosys Synthesis

✔ Netlist Generation

---

## Learning Outcomes

- Sequential Logic
- Control Logic
- Multiplexer-Based Datapath
- Up/Down Counting
- RTL Design
- Hardware Synthesis
