# NU CE459 VLSI Algorithm

[![Catapult HLS](https://img.shields.io/badge/Tool-Catapult%20HLS-blue.svg)](https://www.siemens.com/en-us/products/ic/catapult-high-level-synthesis/)

This repository contains coursework, labs, and projects for **CE459 VLSI Algorithm**. The focus is on the design and optimization of hardware accelerators using High-Level Synthesis (HLS).

## 🛠️ Environment Setup

To run the tools required for this project (including [Mentor Catapult HLS](https://www.siemens.com/en-us/products/ic/catapult-high-level-synthesis/), Synopsys Design Compiler, and QuestaSim), you need to initialize the environment using the provided setup script. 

Source the script to export the necessary tool paths, library variables, and licensing servers:

```bash
source envsetup-catapult.sh
```

*(Note: The environment requires a valid Mentor Graphics license at `1717@mentorlm.eecs.northwestern.edu`.)*

## 🚀 Lab Project: Catapult HLS Optimizations

**Project Details:** [Catapult HLS Project.pdf](Lab_project/Catapult%20HLS%20Project.pdf)

Located in `Lab_project`, this project uses Mentor Catapult HLS to synthesize and optimize C++ algorithmic implementations into hardware. It focuses on varying architectural parameters to target specific frequencies (e.g., 400 MHz).

### Overview

- **Part I: 3x3 Convolution Filter (Integer)**
  - Baseline 3x3 convolution using `int16_t`.
  - Analyzes the effects of pipelining and loop unrolling on latency, throughput, and area.
  
- **Part II: Floating-Point Convolution**
  - Overhauls the filter to use Catapult's arbitrary precision library (`ac_fixed`).
  - Evaluates the hardware overhead and performance of fixed-point approximations.
  
- **Part III: Matrix Multiplication Accelerator**
  - Designs a 32x32 matrix multiplication accelerator with `ac_fixed`.
  - Explores advanced synthesis optimizations, including memory/array partitioning, loop scheduling, and achieving an Initiation Interval (II) of 1.
