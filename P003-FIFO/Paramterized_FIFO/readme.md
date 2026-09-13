# Parameterized FIFO

## Overview

This project implements a parameterized FIFO (First-In First-Out) memory in Verilog.

A FIFO stores data in the order in which it is written. The first data written into the FIFO is always the first data read from it.

The design is parameterized using DATA_WIDTH and DEPTH, making it reusable for different data sizes and storage capacities.

## Parameters

### DATA_WIDTH

DATA_WIDTH determines the number of bits stored in each FIFO entry.

For example:

DATA_WIDTH = 8

means each FIFO entry stores 8 bits.

### DEPTH

DEPTH determines the number of entries that can be stored.

For example:

DEPTH = 4

means the FIFO can store four entries.

## Architecture

The FIFO consists of the following main components:

- FIFO Memory
- Write Pointer
- Read Pointer
- Write Enable
- Read Enable
- Full Flag
- Empty Flag
- Data Input
- Data Output
- Clock
- Reset

The basic architecture is:

                    +-------------------+
data_in ----------->|                   |
                    |    FIFO Memory    |---------> data_out
                    |                   |
                    +---------+---------+
                              |
                    +---------+---------+
                    |                   |
              Write Pointer       Read Pointer
                    |                   |
                    +---------+---------+
                              |
                    +---------+---------+
                    |   Control Logic   |
                    +---------+---------+
                       |           |
                      full       empty

## Parameterized Memory

The FIFO memory is declared as:

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

DATA_WIDTH-1:0 defines the width of each memory location.

0:DEPTH-1 defines the number of memory locations.

For example, with:

DATA_WIDTH = 8
DEPTH = 4

the FIFO contains four memory locations:

mem[0] = 8 bits
mem[1] = 8 bits
mem[2] = 8 bits
mem[3] = 8 bits

Therefore, the total storage capacity is:

8 bits × 4 entries = 32 bits

## Write Operation

The write pointer indicates the memory location where the next incoming data will be stored.

When write_en is HIGH and the FIFO is not full:

1. data_in is written into the memory.
2. The write pointer increments.
3. The FIFO occupancy increases.

Example:

Initial:

write_ptr = 0

Write data A:

mem[0] = A

write_ptr = 1

Write data B:

mem[1] = B

write_ptr = 2

The write pointer moves forward after every successful write.

## Read Operation

The read pointer indicates the memory location from which the next data will be read.

When read_en is HIGH and the FIFO is not empty:

1. Data is read from the memory.
2. The read pointer increments.
3. The FIFO occupancy decreases.

Example:

Initial:

read_ptr = 0

Read operation:

data_out = mem[0]

read_ptr = 1

The next read operation accesses:

data_out = mem[1]

## FIFO Principle

The FIFO follows the First-In First-Out principle.

For example, if the following data is written:

10
20
30
40

The data will be read in exactly the same order:

10 → 20 → 30 → 40

The FIFO therefore preserves the order of stored data.

## Empty Condition

The FIFO is EMPTY when there is no data available to read.

When:

empty = 1

a read operation must not be performed.

The empty flag prevents the design from attempting to read invalid or unavailable data.

## Full Condition

The FIFO is FULL when all available memory locations contain unread data.

When:

full = 1

a write operation must not be performed.

The full flag prevents new data from overwriting existing unread data.

## FIFO Status

The FIFO can have three basic states:

EMPTY

No data is available for reading.

FULL

No additional data can be written.

PARTIALLY FILLED

The FIFO contains some data and can continue performing valid read and write operations.

## Clocked Operation

All FIFO operations are synchronized to the rising edge of the clock.

On every rising edge of clk:

- A valid write operation stores data into memory.
- A valid read operation retrieves data.
- The write pointer is updated after a successful write.
- The read pointer is updated after a successful read.
- FIFO status is updated.
- Reset initializes the FIFO.

## Reset

When reset is asserted:

write_ptr = 0
read_ptr = 0
FIFO = EMPTY

This initializes the FIFO into a known state.

After reset is released, the FIFO can begin accepting new data.

## Example

For:

DATA_WIDTH = 8
DEPTH = 4

The FIFO can store four 8-bit values.

Example write sequence:

Write 10
Write 20
Write 30
Write 40

FIFO contents:

+------+------+------+------+
|  10  |  20  |  30  |  40  |
+------+------+------+------+

Read sequence:

Read → 10
Read → 20
Read → 30
Read → 40

The data is returned in the same order in which it was written.

## Design Features

- Parameterized data width
- Parameterized FIFO depth
- Synchronous operation
- Read and write control
- Full flag
- Empty flag
- Reset support
- Reusable RTL architecture
- Synthesizable Verilog design

## Project Structure

The project can be organized as:

FIFO/
├── rtl/
│   └── fifo.v
├── tb/
│   └── fifo_tb.v
├── simulation/
│   └── waveform.vcd
└── README.md

## Verification

The FIFO should be verified using a testbench that checks:

- Reset behavior
- Normal write operation
- Normal read operation
- FIFO ordering
- Empty condition
- Full condition
- Simultaneous read and write
- Boundary conditions

Waveforms can be viewed using GTKWave.

## Tools Used

- Verilog
- Icarus Verilog
- GTKWave
- Yosys
- VS Code
- Git
- GitHub

## Future Improvements

Possible future improvements include:

- Parameterized pointer width
- Synchronous and asynchronous FIFO versions
- Almost-full flag
- Almost-empty flag
- FIFO occupancy counter
- Dual-clock asynchronous FIFO
- Formal verification
- FPGA implementation
- ASIC synthesis and physical design

## Conclusion

This project implements a reusable parameterized FIFO using Verilog RTL.

The use of DATA_WIDTH and DEPTH parameters allows the same FIFO architecture to be configured for different applications without changing the core RTL design.

The project demonstrates important RTL design concepts including memory modeling, pointers, control logic, status flags, parameterization, sequential logic, and verification.
