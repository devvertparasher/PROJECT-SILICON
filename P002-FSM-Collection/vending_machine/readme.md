# `readme.md`

```markdown
# Vending Machine

A synchronous FSM-based Vending Machine implemented in Verilog as part of **Project Silicon — P002: FSM Collection**.

## Features

- Four-state FSM
- ₹15 product
- ₹5 and ₹10 coin inputs
- Automatic product dispensing
- ₹5 change handling
- Synchronous reset
- Invalid-input handling
- RTL simulation
- GTKWave verification
- Yosys synthesis

## States

```text
IDLE
 ↓
HAVE_5
 ↓
HAVE_10
 ↓
DISPENSE
 ↓
IDLE
