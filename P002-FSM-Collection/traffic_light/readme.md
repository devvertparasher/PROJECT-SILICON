### `readme.md`

```markdown
# Traffic Light Controller

A synchronous FSM-based Traffic Light Controller implemented in Verilog as part of **Project Silicon — P002: FSM Collection**.

## Features

- Four-state FSM
- Moore-style output logic
- Synchronous reset
- Parameterized timer
- Green and yellow timing
- RTL simulation
- Waveform verification
- RTL synthesis

## States

```text
A_GREEN
   ↓
A_YELLOW
   ↓
B_GREEN
   ↓
B_YELLOW
   ↓
A_GREEN
