# 8-Bit Low-Power ALU using Verilog

## 📌 Project Overview

This project implements an **8-bit Low-Power Arithmetic Logic Unit (ALU)** using **Verilog HDL** and **Xilinx Vivado**.

The ALU performs arithmetic and logical operations on two 8-bit input operands. The project focuses on **power-aware RTL design** by reducing unnecessary switching activity and avoiding unnecessary hardware operations.

This project is suitable for learning **VLSI, RTL Design, Verilog HDL, FPGA Design, and Low-Power Digital Circuit Design**.

---

## 🎯 Objectives

* Design an 8-bit ALU using Verilog HDL.
* Perform arithmetic and logical operations.
* Reduce unnecessary switching activity.
* Implement basic low-power design concepts.
* Verify the design using a Verilog testbench.
* Simulate the design using Xilinx Vivado.
* Analyze the output using simulation waveforms.

---

## 🛠️ Tools and Technologies

* **HDL:** Verilog HDL
* **Design Tool:** Xilinx Vivado
* **Simulator:** Vivado Simulator
* **Architecture:** 8-bit ALU
* **Domain:** Digital VLSI / RTL Design
* **Concepts:** Low-Power VLSI, Combinational Logic, RTL Design, Functional Verification

---

## ⚙️ ALU Operations

The 8-bit ALU supports eight operations selected using a 3-bit opcode.

| Opcode | Operation | Description |
| :----: | --------- | ----------- |
|  `000` | ADD       | A + B       |
|  `001` | SUB       | A - B       |
|  `010` | AND       | A & B       |
|  `011` | OR        | A | B       |
|  `100` | XOR       | A ^ B       |
|  `101` | NOT       | ~A          |
|  `110` | INC       | A + 1       |
|  `111` | DEC       | A - 1       |

---

## 🔌 Inputs and Outputs

### Inputs

| Signal   | Width | Description               |
| -------- | ----- | ------------------------- |
| `A`      | 8-bit | First input operand       |
| `B`      | 8-bit | Second input operand      |
| `opcode` | 3-bit | Selects the ALU operation |

### Outputs

| Signal   | Width | Description                      |
| -------- | ----- | -------------------------------- |
| `result` | 8-bit | Result of the selected operation |
| `carry`  | 1-bit | Carry/borrow status              |
| `zero`   | 1-bit | Indicates whether result is zero |

---

## 🔋 Low-Power Design

The main focus of this project is to understand techniques that can reduce **dynamic power consumption** in digital circuits.

### 1. Reduced Switching Activity

Only the selected operation is used to generate the final result, reducing unnecessary logic activity at the output.

### 2. Efficient RTL Coding

The Verilog RTL is designed to avoid unnecessary hardware and switching.

### 3. Operand Isolation Concept

Inputs can be isolated from inactive operation blocks so that unnecessary changes in input signals do not propagate through every functional unit.

### 4. Combinational Architecture

The basic ALU does not require an internal clock, avoiding unnecessary clock-related switching.

### 5. Power Analysis

Vivado power analysis can be used to estimate:

* Dynamic power
* Static power
* Switching activity
* Total on-chip power

---

## 🧩 Block Diagram

```text
                 ┌──────────────────┐
                 │    Input A       │
                 │     8-bit        │
                 └────────┬─────────┘
                          │
                          ▼
                ┌────────────────────┐
                │                    │
                │   8-BIT LOW-POWER  │
                │        ALU         │
                │                    │
                │ ┌────────────────┐ │
                │ │ Arithmetic Unit│ │
                │ │ ADD / SUB      │ │
                │ │ INC / DEC      │ │
                │ └────────────────┘ │
                │                    │
                │ ┌────────────────┐ │
                │ │  Logic Unit    │ │
                │ │ AND / OR / XOR │ │
                │ │ NOT            │ │
                │ └────────────────┘ │
                │                    │
                └─────────┬──────────┘
                          │
                    ┌─────┴─────┐
                    │           │
                    ▼           ▼
                Result        Flags
                 8-bit     Carry / Zero

                          ▲
                          │
                 ┌────────┴────────┐
                 │     Input B     │
                 │      8-bit      │
                 └─────────────────┘

                   Opcode = 3-bit
```

---

## 🧪 Example Simulation

### Example 1 – Addition

```text
A      = 00001101
B      = 00000101
Opcode = 000
```

Calculation:

```text
13 + 5 = 18
```

Binary result:

```text
Result = 00010010
```

### Example 2 – AND

```text
A      = 11001100
B      = 10101010
Opcode = 010
```

Result:

```text
11001100
AND
10101010
--------
10001000
```

Therefore:

```text
Result = 10001000
```

---

## 📊 Expected Results

| A          | B          | Opcode | Operation | Result     |
| ---------- | ---------- | :----: | --------- | ---------- |
| `00001101` | `00000101` |  `000` | ADD       | `00010010` |
| `00001101` | `00000101` |  `001` | SUB       | `00001000` |
| `11001100` | `10101010` |  `010` | AND       | `10001000` |
| `11001100` | `10101010` |  `011` | OR        | `11101110` |
| `11001100` | `10101010` |  `100` | XOR       | `01100110` |
| `01010101` | `00000000` |  `101` | NOT       | `10101010` |
| `00001111` | `00000000` |  `110` | INC       | `00010000` |
| `00001111` | `00000000` |  `111` | DEC       | `00001110` |

---

## 📁 Project Structure

```text
8-Bit-Low-Power-ALU/
│
├── alu_8bit.v
├── alu_8bit_tb.v
├── README.md
│
└── Simulation/
    └── waveform.png
```

---

## 🚀 How to Run in Vivado

1. Open **Xilinx Vivado**.
2. Create a new **RTL Project**.
3. Add `alu_8bit.v` under **Design Sources**.
4. Add `alu_8bit_tb.v` under **Simulation Sources**.
5. Select the required FPGA part if creating an FPGA project.
6. Run **Behavioral Simulation**.
7. Add `A`, `B`, `opcode`, `result`, `carry`, and `zero` to the waveform.
8. Run the simulation.
9. Verify the output for different operations.
10. Capture the waveform screenshot.
11. Run **Synthesis** if you want to analyze hardware resources.
12. Use **Report Power** in Vivado for power estimation.

---

## 📈 Power Analysis

The design can be analyzed using Vivado's power estimation tools.

Important parameters include:

| Parameter          | Description                                           |
| ------------------ | ----------------------------------------------------- |
| Dynamic Power      | Power caused by signal switching                      |
| Static Power       | Power consumed even when the circuit is not switching |
| Total Power        | Dynamic + Static power                                |
| Switching Activity | Frequency of signal transitions                       |

The goal of the low-power design is to minimize unnecessary switching and therefore reduce dynamic power consumption.

---

## 🔬 Future Improvements

The project can be extended by:

* Implementing advanced **operand isolation**.
* Using **clock gating** in sequential ALU architectures.
* Comparing conventional and low-power ALU architectures.
* Performing detailed Vivado power analysis.
* Comparing **power, area, and timing**.
* Extending the design to 16-bit or 32-bit.
* Implementing the ALU using different architectures.
* Exploring **power-delay-area (PDA) optimization**.
* Implementing the ALU on an FPGA board.

---

## 🎓 Learning Outcomes

Through this project, I learned:

* Verilog HDL programming.
* 8-bit ALU architecture.
* Arithmetic and logical circuit design.
* RTL design methodology.
* Testbench development.
* Functional verification.
* Vivado simulation and waveform analysis.
* FPGA synthesis concepts.
* Basic low-power VLSI techniques.
* Power analysis concepts.
* GitHub project documentation.

---

## 👩‍💻 Author

**ECE Student | VLSI Enthusiast**

### 🔗 Project Summary

This project demonstrates an **8-bit Low-Power ALU designed using Verilog HDL and Xilinx Vivado**. It performs arithmetic and logical operations while focusing on reducing unnecessary switching activity and understanding power-aware RTL design techniques.

