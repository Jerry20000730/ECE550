/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
    // Wire for control unit
    wire Rwe, Rdst, ALUinB, isRType, is_add_addi_sub, DMWe, Rwd;
    wire[31:0] overflowSignal;
    
    // Wire for ALU
    wire[4:0] shiftamt, aluop;
    wire[31:0] data_operandB, extended_immed;
    wire[31:0] data_result;
    wire overflow, isNotEqual, isLessThan;
	 wire real_overflow;
    
    // PC
	 wire pc_out;
	 wire[31: 0] pc, pc_1;
	 CLA_32bit cla(.a(pc), .b(32'd1), .cin(1'b0), .sum(pc_1), .cout(pc_out)); // pc_1 = pc + 1
	 pc pc_0(.q(pc), .d(pc_1), .clk(clock), .en(1'b1), .clr(reset)); // pc = pc_1
    
    // imem
	 assign address_imem = pc[11:0];
    
    // control unit
    control control_circuit(.opcode(q_imem[31:27]), .ALUop(q_imem[6:2]), .Rwe(Rwe), .Rdst(Rdst), .ALUinB(ALUinB), .isRType(isRType), .overflowSignal(overflowSignal), .is_add_addi_sub(is_add_addi_sub), .DMWe(DMWe), .Rwd(Rwd));
	 assign real_overflow = overflow & is_add_addi_sub;
    
    // regfile
    assign ctrl_readRegA = q_imem[21:17];
    assign ctrl_readRegB = Rdst ? q_imem[26:22] : q_imem[16:12];
    assign ctrl_writeReg = real_overflow ? 5'b11110 : q_imem[26:22];
    assign ctrl_writeEnable = Rwe;
    
    
    // ----- processor give regfile signal to skeleton, skeleton returns data in regfile -----
    
    // extend immediate 16
    signExtension sx(.in(q_imem[16:0]), .out(extended_immed));
    
    // alu
    assign shiftamt = isRType ? q_imem[11:7] : 5'b00000;
    assign aluop = isRType ? q_imem[6:2] : 5'b00000;
    assign data_operandB = ALUinB ? extended_immed : data_readRegB;
    alu myalu(.data_operandA(data_readRegA), .data_operandB(data_operandB), .ctrl_ALUopcode(aluop), .ctrl_shiftamt(shiftamt), .data_result(data_result), .isNotEqual(isNotEqual), .isLessThan(isLessThan), .overflow(overflow));
    
	 // dmem
    assign address_dmem = data_result[11:0];
    assign data = data_readRegB;
    assign wren = DMWe;
    assign data_writeReg = real_overflow ? overflowSignal : (Rwd ? q_dmem : data_result);

endmodule