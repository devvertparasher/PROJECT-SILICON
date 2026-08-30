# Counter Down Architecture

## Objective

Design a synchronous 4-bit down counter.

---

## Inputs

- clk
- reset
- enable

---

## Output

- count[3:0]

---

## Working

On every positive edge of the clock:

- reset = 1 → count = 15
- enable = 1 → count decrements
- enable = 0 → holds value

---

## Hardware Generated

- 4 D Flip-Flops
- 4-bit decrementer
- Control logic

---

## Applications

- Timers
- Countdown systems
- Delay generators
- Digital clocks
