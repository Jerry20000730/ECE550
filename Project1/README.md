# Project Checkpoint 1

- Name: Fangcheng Guo
- NetID: fg96

## Overview

The aim of this project checkpoint 1 is to design and simulate an ALU using Verilog that support for addition, subtraction and overflow detection

## Description of Design

In general, I use four 8-bit Carry Lookahead Adders (CLA) in series to construct a 32-bit adder to support the addition and subtraction. I use the first bit in `ctrl_ALUopcode` to judge whether the operation is addition or subtraction.

The subtraction is achieved by using a 32-bit not gate on `data_operandB` and then add 1 in the 32-bit CLA adder, which implementing A + (-B).

The overflow detection is achieved by checking the most significant bit (MSB) of `data_operandA`, `data_operandB` and the result calculated.

-  If both the MSB of  `data_operandA` and `data_operendB` is 1, but the MSB of the result is 0, then there is an overflow
- Similarly, if both MSB if `data_operendA` and `data_operendB` is 0, but the MSB of the result is 1, then there is an overflow.

The logical expression of this can be achieved by $A[31] \ddot B[31] \ddot S[31]' + A[31]' \ddot B[31]' \ddot S[31]$
