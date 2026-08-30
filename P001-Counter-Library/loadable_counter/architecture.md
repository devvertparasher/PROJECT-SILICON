# Loadable Counter Architecture

## 🎯 Objective

Design a synchronous 4-bit Loadable Counter capable of loading a user-defined value or incrementing based on control signals.

---

## 📖 Introduction

A Loadable Counter extends a standard counter by allowing an external value to be loaded directly into the register before normal counting resumes.

---

## ⚙ Inputs

| Signal | Width | Description |
|---------|------:|-------------|
| clk | 1 | System Clock |
| reset | 1 | Active-high synchronous reset |
| enable | 1 | Enables counting |
| load | 1 | Loads external data |
| data | 4 | Parallel input value |

---

## 📤 Output

| Signal | Width | Description |
|---------|------:|-------------|
| count | 4 | Counter output |

---

## 🧠 Working

Priority Order

1. Reset
2. Load
3. Count
4. Hold

---

## Hardware Generated

- Four D Flip-Flops
- 4-bit Adder
- Multiplexer
- Load Control Logic

---

## Applications

- Program Counter
- Register File
- Timers
- Configuration Registers
- Digital Systems
