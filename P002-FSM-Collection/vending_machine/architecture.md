# Vending Machine — Architecture

## Overview

The Vending Machine is a synchronous FSM-based RTL design developed as part of Project Silicon P002.

The machine sells one product costing ₹15.

Accepted coins:

- ₹5
- ₹10

## States

| State | Meaning |
|---|---|
| IDLE | ₹0 received |
| HAVE_5 | ₹5 received |
| HAVE_10 | ₹10 received |
| DISPENSE | Product is dispensed |

## State Flow

```text
IDLE
 ↓ ₹5
HAVE_5
 ↓ ₹5
HAVE_10
 ↓ ₹5 / ₹10
DISPENSE
 ↓
IDLE
