# Architecture

## Overview

The Counter Up is a synchronous sequential circuit that increments its output by one on every positive edge of the clock. The design uses edge-triggered flip-flops to store the current count value and combinational logic to compute the next count.

---

## Inputs

| Signal | Width | Description |
|--------|------:|-------------|
| clk | 1 | System clock |
| rst | 1 | Active-high synchronous reset |

---

## Outputs

| Signal | Width | Description |
|--------|------:|-------------|
| count | WIDTH | Current counter value |

---

## Internal Architecture

```
                +-----------------------+
                |                       |
 clk ---------->|                       |
 rst ---------->|    Counter Register   |
                |                       |
                +-----------+-----------+
                            |
                            v
                     +--------------+
                     | Incrementer  |
                     |  count + 1   |
                     +--------------+
                            |
                            |
                            +------------------+
                                               |
                                               |
                                               v
                                           count
```

---

## Data Flow

```
Clock Edge

↓

Check Reset

↓

Reset = 1 ?

↓

YES → count = 0

↓

NO

↓

count = count + 1

↓

Store into Register

↓

Wait for next clock
```

---

## Hardware Generated

The RTL synthesizes into:

- Flip-Flops (equal to parameter WIDTH)
- Binary Incrementer
- Reset Logic

For WIDTH = 4

Hardware consists of:

- 4 D Flip-Flops
- 4-bit Adder
- Reset Multiplexer

---

## Design Characteristics

Type : Sequential Logic

Clock : Positive Edge

Reset : Active High


