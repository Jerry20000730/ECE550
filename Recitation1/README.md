# Recitation 1
The aim of this recitation is to learn to use Quartus Prime. With Quartus, you can code in the Verilog Hardware Description Language (HDL) in order to create different logic blocks and subsystems.

## Important Notes

During the initial project setup, some settings should be remember and I write it down for my own reference:

- Device family: Cyclone IV E
- Device name: EP4CE115F29C7
-  Simulation "Tool Name": Modelsim-Altera
- Formats: Verilog HDL

## Tasks

- Task 1: Learn about Verilog including the difference between Structural and Behavioral
- Task 2: Create a simple NAND gate in Quartus using structural verilog
- Task 3: Using a waveform to verify the operation of your circuit
- Task 4: Writing a testbench to verify the operation of your circuit

## Source Files

- [nand_gate.v](nand_gate.v): the source code for implementing a NAND gate using the native `nand` module provided.
- [nand_gate_tb.v](nand_gate_tb.v): the testbench file for implementing the testbench

- Waveform.vwf: the waveform for testing the NAND gate we design.
