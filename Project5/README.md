# Project Checkpoint 5

## Overview
The aim of this project is to finish the unfinished functionalities of last time. Checkpoint4, together with Checkpoint 5, is to design and simulate a single-cycle 32-bit processor using Verilog. In this checkpoint specifically, we aim to implement `j`, `bne`, `jal`, `jr` , `blt`, `bex`, `setx`  instructions.

## Overall design for (FULL) single cycle processor
The image shown below illustrates our overall design in this checkpoint for the full single cycle processor. The control unit for last checkpoint will output control bit:

1. **Rwe**: write enable for register file
2. **Rdst**: determine the write destination register
3. **ALUinB**: determine whether the command is addi or add
4. **is_addi_add_sub**: determine whether the command is addi, add or sub, not anything else.
5. **IsRType**: output 1 if the command is R type, output 0 if the command is I type.
6. **OFSignal**: Overflow signal, if add overflow, it outputs 1. If addi overflows, it outputs 2. If sub overflows, it outputs 3. The overflow signal is 32-bit.
7. **DMwe**: write enable for Data Memory
8. **Rwd**: determine whether the command is for `lw` or `sw`

In this checkpoint, we add more control bit to accommodate new functionalities, mostly for choosing specific `j` type instruction.

1. **isBne**: whether the command is `bne`  or not
2. **isBlt**: whether the command is `blt` or not
3. **isSetX**: whether the command is `isSetX` or not
4. **isBex**: whether the command is `bex`  or not
5. **isJal**: whether the command is `jal` or not
6. **isJ_Jal**: whether the command is `j`  or `jal`
7. **isJr**: whether the command is `jr` or not


![full overall design](../Resources/full_processor.png)

## The updated design of the control unit

To accommodate new design and add more functionalities, we have a little adjustment to the logic compared with the last time, and add specific logic to control bit that are added this time.
For details of the logic, please also see the specification last time [here](../Project4/README.md)

- **Rwe**: output 1 for all R-type instruction and `addi (00101)`, `lw (01000)`, **`jal(*new)(00011)`**, **`setx(*new)(10101)`**
$$
Rwe = isRType \ || \ opcode[addi] \ || \ opcode[lw] || \ opcode[jal] || \ opcode[setx]
$$
- **is_j_jal**: output 1 if the command is `j` or `jal`

## Other self-designed modules

1. `CLA_12bit.v` used for doing addition for PC register
2. `register_32bit.v` used for the basic storage module (32-bit register)
3. `signExtension.v` used for adding 0’s or 1’s accordingly at the
beginning of the immediate value to make it 32 bits.
