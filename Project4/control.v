/*
	Create by: Fangcheng
	Date: 2023-10-23
*/
module control(opcode, ALUop, Rwe, Rdst, ALUinB, isRType, overflowSignal, is_add_addi_sub, DMWe, Rwd);
	input[4:0] opcode, ALUop;
	output Rwe, Rdst, ALUinB, isRType, is_add_addi_sub, DMWe, Rwd;
	output[31:0] overflowSignal;
	wire is_add, is_sub;
	
	// R type: 00000
	assign isRType = ~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
	
	// Rwe <= R type + addi + lw
	// addi: 00101
	// lw: 01000
	assign Rwe = isRType | (~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0]) | (~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]);
	
	// Rdst <= not R type + left shift + right shift
	// left shift ALUopcode: 00100
	// right shift ALUopcode: 00101
	assign Rdst = ~isRType | (isRType & ((~ALUop[4] & ~ALUop[3] & ALUop[2] & ~ALUop[1] & ~ALUop[0]) | (~ALUop[4] & ~ALUop[3] & ALUop[2] & ~ALUop[1] & ALUop[0])));
	
	// ALUinB <= addi + lw + sw
	// addi: 00101
	// lw: 01000
	// sw: 00111
	assign ALUinB = (~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0]) | (~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) | (~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0]);
	
	// overflow signal
	// add ALUop: 00000
	// sub ALUop: 00001
	// addi opcode: 00101
	assign is_add = ~ALUop[4] & ~ALUop[3] & ~ALUop[2] & ~ALUop[1] & ~ALUop[0];
	assign is_sub = ~ALUop[4] & ~ALUop[3] & ~ALUop[2] & ~ALUop[1] & ALUop[0];
	assign is_add_addi_sub = is_add | is_sub | (~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0]);
	assign overflowSignal = isRType ? ((is_add) ? 32'd1 : (is_sub ? 32'd3 : 32'd0)) : 32'd2;
	
	// DMwe
	// sw: 00111
	assign DMWe = ~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0];
	
	// Rwd
	// lw: 01000
	assign Rwd = ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
endmodule