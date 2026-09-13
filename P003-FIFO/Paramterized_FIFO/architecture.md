# Parameterized FIFO — Architecture

## 1. Overview

This project implements a parameterized synchronous FIFO using Verilog RTL.

Unlike the Basic FIFO, the FIFO depth and data width are configurable through Verilog parameters.

### Specification

- FIFO Depth: Parameterized
- Data Width: Parameterized
- Clock: Single synchronous clock
- Reset: Synchronous
- Read Enable: `read_en`
- Write Enable: `write_en`

Default configuration:

- FIFO Depth: 4
- Data Width: 8 bits

---

## 2. Architecture

The FIFO consists of:

- Parameterized memory array
- Write pointer
- Read pointer
- Occupancy counter
- Full flag
- Empty flag
- Data output register

```text
                    data_in
                       |
                       v
              +----------------+
              |  Parameterized  |
              |     Memory      |
              +--------+---------+
                       |
             +---------+---------+
             |                   |
        write_ptr            read_ptr
             |                   |
             v                   v
       Write Control        Read Control
                                 |
                                 v
                              data_out


                 occupancy counter
                        |
                 +------+------+
                 |             |
               full          empty
