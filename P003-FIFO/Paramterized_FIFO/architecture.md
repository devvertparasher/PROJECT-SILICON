## FIFO Architecture

The FIFO (First-In First-Out) is designed to store and transfer data in the order in which it is written.

The first data written into the FIFO is always the first data read from it.

### 1. Basic Architecture

The FIFO consists of the following main components:

- Memory Array
- Write Pointer
- Read Pointer
- Write Enable
- Read Enable
- Full Flag
- Empty Flag
- Data Input
- Data Output

The basic data flow is:

Data Input
    |
    v
+-------------------+
|   FIFO Memory     |
|                   |
|  [0] [1] [2] [3]  |
|                   |
+-------------------+
    ^           ^
    |           |
Write Pointer  Read Pointer
    |           |
    v           v
 Write        Read
 Enable       Enable

### 2. Parameterized FIFO

The FIFO is parameterized so that its data width and storage depth can be changed without modifying the core RTL design.

The two main parameters are:

DATA_WIDTH

DATA_WIDTH determines the number of bits stored in each FIFO entry.

For example:

DATA_WIDTH = 8

means each FIFO entry stores 8 bits.

DEPTH

DEPTH determines the number of entries that can be stored.

For example:

DEPTH = 4

means the FIFO can store four entries.

### 3. Parameterized Memory

The FIFO memory is declared as a parameterized array:

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

Here:

DATA_WIDTH-1:0

defines the width of each memory location.

0:DEPTH-1

defines the number of memory locations.

For example, with:

DATA_WIDTH = 8
DEPTH = 4

the memory contains four 8-bit entries:

mem[0] = 8 bits
mem[1] = 8 bits
mem[2] = 8 bits
mem[3] = 8 bits

Therefore, the total storage capacity is:

8 bits × 4 entries = 32 bits

### 4. Write Pointer

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

The write pointer therefore moves forward after every successful write.

### 5. Read Pointer

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

### 6. FIFO Operation

The FIFO follows the First-In First-Out principle.

Example:

Write:

10
20
30
40

The FIFO contains:

+----+----+----+----+
| 10 | 20 | 30 | 40 |
+----+----+----+----+
  ^
  |
Read Pointer

                         ^
                         |
                    Write Pointer

The data will be read in the same order:

10 → 20 → 30 → 40

The FIFO never intentionally changes the order of stored data.

### 7. Empty Condition

The FIFO is EMPTY when there is no data available to read.

The empty flag is asserted when the read pointer and write pointer indicate that no unread entries remain.

When:

empty = 1

a read operation must not be performed.

### 8. Full Condition

The FIFO is FULL when all available memory locations contain unread data.

When:

full = 1

a write operation must not be performed.

This prevents new data from overwriting existing unread data.

### 9. FIFO Status

The FIFO maintains its status using the relationship between the read pointer and write pointer.

The main status conditions are:

EMPTY
No data is available for reading.

FULL
No additional data can be written.

PARTIALLY FILLED
The FIFO contains some data and can perform both read and write operations.

### 10. Clocked Operation

All FIFO operations are synchronized to the clock.

On every rising edge of clk:

- A valid write operation stores data into memory.
- A valid read operation updates the read position.
- FIFO status flags are updated.
- Reset initializes the FIFO into an empty state.

### 11. Reset

When reset is asserted:

write_ptr = 0
read_ptr = 0
FIFO = EMPTY

This ensures that the FIFO starts from a known state.

After reset is released, the FIFO can begin accepting new data.

### 12. Overall Architecture

The complete FIFO architecture can therefore be summarized as:

                 +----------------+
data_in -------->|                |
                 | FIFO Memory    |--------> data_out
                 |                |
                 +----------------+
                     ^        ^
                     |        |
                write_ptr  read_ptr
                     ^        ^
                     |        |
                 +---+--------+---+
                 |                |
                 | Control Logic  |
                 |                |
                 +---+--------+---+
                     |        |
                   full     empty
                     |
                  clk/reset

The write pointer controls where new data is stored, while the read pointer controls where existing data is read.

The control logic prevents writing when the FIFO is full and prevents reading when the FIFO is empty.

This architecture makes the FIFO reusable for different applications by allowing DATA_WIDTH and DEPTH to be changed through parameters.
