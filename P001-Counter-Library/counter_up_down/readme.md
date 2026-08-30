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

---

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
