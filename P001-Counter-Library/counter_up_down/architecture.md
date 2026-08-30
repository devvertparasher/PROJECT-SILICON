# Counter Up/Down Architecture

## 🎯 Objective

Design a synchronous 4-bit Up/Down Counter capable of incrementing or decrementing its value based on a control signal.

---

## 📖 Introduction

An Up/Down Counter is a sequential digital circuit that can count in both increasing and decreasing order. The counting direction is selected using the **up_down** control signal.

---

## ⚙ Inputs

| Signal | Width | Description |
|---------|------:|-------------|
| clk | 1 | System Clock |
| reset | 1 | Active-high synchronous reset |
| enable | 1 | Enables counting |
| up_down | 1 | Direction control |

---

## 📤 Output

| Signal | Width | Description |
|---------|------:|-------------|
| count | 4 | Current counter value |

---

## 🧠 Working

On every positive edge of the clock:

- If reset = 1 → Counter resets to 0.
- Else if enable = 1:
  - up_down = 1 → Counter increments.
  - up_down = 0 → Counter decrements.
- Else → Counter holds its previous value.

---

## 🏗 Hardware Generated

- Four D Flip-Flops
- 4-bit Adder
- 4-bit Subtractor
- 2:1 Multiplexer
- Control Logic

---

## 📌 Applications

- Timers
- Digital Clocks
- Position Counters
- Frequency Division
- Motor Controllers
- Address Generation
