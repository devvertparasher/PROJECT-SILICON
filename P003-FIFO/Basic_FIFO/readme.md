# P003.1 — Basic FIFO

A simple synchronous FIFO implemented in Verilog RTL.

## Overview

This project implements a 4-entry × 8-bit FIFO using:

- Memory array for data storage
- Write pointer
- Read pointer
- Occupancy counter
- Full flag
- Empty flag

The FIFO follows the First-In, First-Out principle.

## Specification

| Parameter | Value |
|---|---:|
| FIFO Depth | 4 |
| Data Width | 8 bits |
| Clock | Single synchronous clock |
| Reset | Synchronous |
| Read Operation | `read_en` |
| Write Operation | `write_en` |

## Operation

### Write

A write occurs when:

```text
write_en = 1
AND
FIFO is not full
