# Traffic Light Controller — Architecture

## Overview

The Traffic Light Controller is a synchronous FSM-based RTL design for controlling two roads.

The controller uses four states:

- A_GREEN
- A_YELLOW
- B_GREEN
- B_YELLOW

A parameterized timer controls how long the controller stays in each state.

## State Diagram

A_GREEN → A_YELLOW → B_GREEN → B_YELLOW → A_GREEN

## State Encoding

| State | Encoding |
|---|---|
| A_GREEN | 2'b00 |
| A_YELLOW | 2'b01 |
| B_GREEN | 2'b10 |
| B_YELLOW | 2'b11 |

## State Outputs

| State | Road A | Road B |
|---|---|---|
| A_GREEN | Green | Red |
| A_YELLOW | Yellow | Red |
| B_GREEN | Red | Green |
| B_YELLOW | Red | Yellow |

## Architecture

The design consists of:

1. State Register
2. Timer Counter
3. Next-State Logic
4. Output Logic

The state register stores the current FSM state.

The timer counts clock cycles spent in the current state.

When the timer expires, `timer_done` causes the FSM to move to the next state.

The output logic generates the traffic-light signals according to the current state.

## Timing

The design uses two parameters:

```verilog
GREEN_TIME  = 5
YELLOW_TIME = 2
