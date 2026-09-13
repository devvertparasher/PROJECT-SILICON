# Basic FIFO — Architecture

## 1. Overview

This project implements a simple synchronous FIFO (First-In, First-Out) using Verilog RTL.

The FIFO stores 4 entries, with each entry containing 8 bits of data.

### Specification

- FIFO Depth: 4
- Data Width: 8 bits
- Clock: Single synchronous clock
- Reset: Synchronous
- Read Enable: `read_en`
- Write Enable: `write_en`

---

## 2. Architecture

The FIFO consists of:

- 4 × 8-bit memory
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
             +-------------+
             |   4 x 8     |
             |   Memory    |
             +------+------+
                    |
          +---------+---------+
          |                   |
     write_ptr             read_ptr
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
````

---

## 3. Write Operation

A write occurs when:

```
```

```
write_en = 1
and FIFO is not full
```

The input data is written into the memory location selected by `write_ptr`.

After a successful write, the write pointer advances.

```
```

```
data_in
   |
   v
memory[write_ptr]
   |
   v
write_ptr advances
   |
   v
occupancy increases
```

---

## 4. Read Operation

A read occurs when:

```
```

```
read_en = 1
and FIFO is not empty
```

The data stored at the location selected by `read_ptr` is transferred to `data_out`.

After a successful read, the read pointer advances.

```
```

```
memory[read_ptr]
   |
   v
data_out
   |
   v
read_ptr advances
   |
   v
occupancy decreases
```

---

## 5. Write Pointer

The FIFO has four memory locations, so a 2-bit write pointer is sufficient.

```
```

```
00 → 0
01 → 1
10 → 2
11 → 3
```

After reaching address 3, the pointer wraps back to 0.

```
```

```
0 → 1 → 2 → 3 → 0
```

This allows the FIFO memory locations to be reused.

---

## 6. Read Pointer

The read pointer is also 2 bits wide.

It selects the oldest data stored in the FIFO.

The pointer follows the same circular sequence:

```
```

```
0 → 1 → 2 → 3 → 0
```

---

## 7. Occupancy Counter

The occupancy counter stores the number of valid entries currently present in the FIFO.

It must represent values from 0 to 4, so a 3-bit counter is used.

```
```

```
000 → 0 entries
001 → 1 entry
010 → 2 entries
011 → 3 entries
100 → 4 entries
```

### Occupancy behavior

```
```

```
Write only       → occupancy + 1
Read only        → occupancy - 1
Read + Write     → occupancy unchanged
No operation     → occupancy unchanged
```

---

## 8. Full and Empty Conditions

### Empty

The FIFO is empty when:

```
```

```
occupancy = 0
```

Therefore:

```
```

```
empty = 1
```

A read operation is blocked while the FIFO is empty.

### Full

The FIFO is full when:

```
```

```
occupancy = 4
```

Therefore:

```
```

```
full = 1
```

A write operation is blocked while the FIFO is full.

---

## 9. Reset

When reset is asserted:

```
```

```
write_ptr = 0
read_ptr  = 0
occupancy = 0
data_out  = 0
```

The FIFO therefore starts in the empty state.

```
```

```
empty = 1
full  = 0
```

---

## 10. FIFO Example

Writing:

```
```

```
A1 → B2 → C3
```

produces:

```
```

```
FIFO:

+----+----+----+----+
| A1 | B2 | C3 |    |
+----+----+----+----+
  ^
 read_ptr
```

Reading from the FIFO produces:

```
```

```
A1 → B2 → C3
```

This demonstrates the First-In, First-Out behavior.

---

## 11. Verification

The testbench checks basic FIFO functionality including:

-  Reset 
-  Data writes 
-  Data reads 
-  FIFO ordering 
-  Full condition 
-  Empty condition 
-  Pointer movement 
-  Pointer wrap-around 

The design was simulated using Icarus Verilog and the waveform was inspected using GTKWave.

Important signals observed during simulation include:

```
```

```
clk
reset
write_en
read_en
data_in
data_out
empty
full
write_ptr
read_ptr
occupancy
```

---

## 12. Synthesis

The FIFO RTL was synthesized using Yosys.

The synthesized design was inspected to understand the hardware representation of:

-  Memory 
-  Read/write pointers 
-  Occupancy counter 
-  Full/empty logic 
-  Read/write control 
-  Output register  
