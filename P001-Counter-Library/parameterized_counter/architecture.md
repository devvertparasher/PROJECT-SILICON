# Parameterized Counter Architecture

## 🎯 Objective

Design a reusable synchronous counter whose width can be changed using a Verilog parameter without modifying the RTL source code.

---

## 📖 Introduction

A Parameterized Counter is a generic counter that allows designers to select the counter width during module instantiation.

Instead of creating separate 4-bit, 8-bit, or 16-bit counters, a single reusable RTL module is used.

---

## ⚙ Inputs

| Signal | Width | Description |
|---------|------:|-------------|
| clk | 1 | System Clock |
| reset | 1 | Active-high synchronous reset |
| enable | 1 | Enables counting |

---

## 📤 Output

| Signal | Width | Description |
|---------|------:|-------------|
| count | WIDTH | Counter Output |

---

## 🧠 Working

On every positive edge of the clock:

1. If reset = 1 → Counter resets to zero.
2. Else if enable = 1 → Counter increments by one.
3. Else → Counter retains its previous value.

The width of the counter is determined by the parameter:

parameter WIDTH = 4;

---

## 🏗 Hardware Generated

Depending on WIDTH:

- WIDTH Flip-Flops
- WIDTH-bit Adder
- Enable Logic

Examples:

WIDTH = 4 → 4-bit Counter

WIDTH = 8 → 8-bit Counter

WIDTH = 16 → 16-bit Counter



## 📌 Applications

- Timers
- Address Counters
- Program Counters
- Performance Counters
- DMA Controllers
- Generic RTL IP
