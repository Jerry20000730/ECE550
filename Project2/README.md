# Project Checkpoint 2

- Name: Fangcheng Guo
- NetID: fg96

## Overview

The aim of this project checkpoint 2 is to further improve the ALU designed in the checkpoint 1using Verilog. The updated design of ALU should support:

- bitwise AND, OR without the built-in &, &&, |, and || operators
- 32-bit barrel shifter with SLL (Logical Left Shift) and SRA (Arithmetic Right Shift)
  without the <<, <<<, >>, and >>> operators

## Description of Design (Bitwise AND and OR)

The design for the bitwise AND and OR is pretty straightforward. Both are realized using generate for. The principle under this is to do a bit-by-bit and/or comparison and store each result at the same bit location in the output.

## Description of Design (Logical Left Shift & Arithmetic Right Shift)

The design for logical left shift uses four layer, each with 32 mux 2to1 to choose. The structure of the logical left shift is shown below. On the first layer, the aim is to decide which input to choose (one input of the original 32 bit, and the other re-concatenate one 0 at the front of first 31 bit of the original input). On the second layer, the principle is the same, to decide which input to choose (one input from the former output (32 bit) and another input re-concatenate two 0 at the front of the first 30 bit of the former output) and so on. Each mux's select is connected to the `shiftamt` so that we know how many bits to shift.

![structure of SLL](../Resources/SLL_implementation_32bit.jpg)

The design for Arithmetic Right Shift is similar, with the only difference is that the addition of bits to replace the positions at higher bits when shifting to the right needs to be the same as the original MSB (Most Significant Bit). If the original number's MSB is 1, then when it shifts to the right for n bits, we need to add n 1s at the higher bits after the shift.

## Description on how to adapt more control code

During the first project checkpoint, what I did not realize is that there will be more control code later, which results in a situation that I have to rewrite parts of the original code to adapt more control code. The solution for adapt more control code and output only one `data_result` according to the control code is to first temporary store the answers for all operations, and output only the result user wants by checking the ALUopcode.

The way to judge which operation is intended, the sequence for checking the bit is from highest to the lowest. (e.g. If I check the higher bit to 1, I would know the result is between SLL and SRA, without the need to further elaborate using Ternary assign)

## Additional self-designed module

1. `mux-32bit`: it is a basically a 32 bit 2:1 mux. The design of the module is actually introduced in the summer workshop. In this checkpoint, the 32-bit 2:1 mux is actually used for deciding whether to shift or stay the same.
