module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	wire [31:0] write_decoder_output, read_A_decoder_output, read_B_decoder_output;
	wire [31:0] Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16;
	wire [31:0] Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;
	wire en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12, en13, en14, en15, en16;
	wire en17, en18, en19, en20, en21, en22, en23, en24, en25, en26, en27, en28, en29, en30, en31;
	
	/* write part */
	
	// 1. decode 5-bit control binary to 32bit one-hot
	decoder_5to32 write_decoder(.in(ctrl_writeReg), .out(write_decoder_output));
	
	// 2. The `ctrl_writeReg` is converted into 32bit one-hot, and connects AND gate with `ctrl_writeEnable`
	and and1(en1, write_decoder_output[1], ctrl_writeEnable);
	and and2(en2, write_decoder_output[2], ctrl_writeEnable);
	and and3(en3, write_decoder_output[3], ctrl_writeEnable);
	and and4(en4, write_decoder_output[4], ctrl_writeEnable);
	and and5(en5, write_decoder_output[5], ctrl_writeEnable);
	and and6(en6, write_decoder_output[6], ctrl_writeEnable);
	and and7(en7, write_decoder_output[7], ctrl_writeEnable);
	and and8(en8, write_decoder_output[8], ctrl_writeEnable);
	and and9(en9, write_decoder_output[9], ctrl_writeEnable);
	and and10(en10, write_decoder_output[10], ctrl_writeEnable);
	and and11(en11, write_decoder_output[11], ctrl_writeEnable);
	and and12(en12, write_decoder_output[12], ctrl_writeEnable);
	and and13(en13, write_decoder_output[13], ctrl_writeEnable);
	and and14(en14, write_decoder_output[14], ctrl_writeEnable);
	and and15(en15, write_decoder_output[15], ctrl_writeEnable);
	and and16(en16, write_decoder_output[16], ctrl_writeEnable);
	and and17(en17, write_decoder_output[17], ctrl_writeEnable);
	and and18(en18, write_decoder_output[18], ctrl_writeEnable);
	and and19(en19, write_decoder_output[19], ctrl_writeEnable);
	and and20(en20, write_decoder_output[20], ctrl_writeEnable);
	and and21(en21, write_decoder_output[21], ctrl_writeEnable);
	and and22(en22, write_decoder_output[22], ctrl_writeEnable);
	and and23(en23, write_decoder_output[23], ctrl_writeEnable);
	and and24(en24, write_decoder_output[24], ctrl_writeEnable);
	and and25(en25, write_decoder_output[25], ctrl_writeEnable);
	and and26(en26, write_decoder_output[26], ctrl_writeEnable);
	and and27(en27, write_decoder_output[27], ctrl_writeEnable);
	and and28(en28, write_decoder_output[28], ctrl_writeEnable);
	and and29(en29, write_decoder_output[29], ctrl_writeEnable);
	and and30(en30, write_decoder_output[30], ctrl_writeEnable);
	and and31(en31, write_decoder_output[31], ctrl_writeEnable);
	
	// 3. assemble 32 32-bit register
	register_32bit R1(.q(Q1), .d(data_writeReg), .clk(clock), .en(en1), .clr(ctrl_reset));
	register_32bit R2(.q(Q2), .d(data_writeReg), .clk(clock), .en(en2), .clr(ctrl_reset));
	register_32bit R3(.q(Q3), .d(data_writeReg), .clk(clock), .en(en3), .clr(ctrl_reset));
	register_32bit R4(.q(Q4), .d(data_writeReg), .clk(clock), .en(en4), .clr(ctrl_reset));
	register_32bit R5(.q(Q5), .d(data_writeReg), .clk(clock), .en(en5), .clr(ctrl_reset));
	register_32bit R6(.q(Q6), .d(data_writeReg), .clk(clock), .en(en6), .clr(ctrl_reset));
	register_32bit R7(.q(Q7), .d(data_writeReg), .clk(clock), .en(en7), .clr(ctrl_reset));
	register_32bit R8(.q(Q8), .d(data_writeReg), .clk(clock), .en(en8), .clr(ctrl_reset));
	register_32bit R9(.q(Q9), .d(data_writeReg), .clk(clock), .en(en9), .clr(ctrl_reset));
	register_32bit R10(.q(Q10), .d(data_writeReg), .clk(clock), .en(en10), .clr(ctrl_reset));
	register_32bit R11(.q(Q11), .d(data_writeReg), .clk(clock), .en(en11), .clr(ctrl_reset));
	register_32bit R12(.q(Q12), .d(data_writeReg), .clk(clock), .en(en12), .clr(ctrl_reset));
	register_32bit R13(.q(Q13), .d(data_writeReg), .clk(clock), .en(en13), .clr(ctrl_reset));
	register_32bit R14(.q(Q14), .d(data_writeReg), .clk(clock), .en(en14), .clr(ctrl_reset));
	register_32bit R15(.q(Q15), .d(data_writeReg), .clk(clock), .en(en15), .clr(ctrl_reset));
	register_32bit R16(.q(Q16), .d(data_writeReg), .clk(clock), .en(en16), .clr(ctrl_reset));
	register_32bit R17(.q(Q17), .d(data_writeReg), .clk(clock), .en(en17), .clr(ctrl_reset));
	register_32bit R18(.q(Q18), .d(data_writeReg), .clk(clock), .en(en18), .clr(ctrl_reset));
	register_32bit R19(.q(Q19), .d(data_writeReg), .clk(clock), .en(en19), .clr(ctrl_reset));
	register_32bit R20(.q(Q20), .d(data_writeReg), .clk(clock), .en(en20), .clr(ctrl_reset));
	register_32bit R21(.q(Q21), .d(data_writeReg), .clk(clock), .en(en21), .clr(ctrl_reset));
	register_32bit R22(.q(Q22), .d(data_writeReg), .clk(clock), .en(en22), .clr(ctrl_reset));
	register_32bit R23(.q(Q23), .d(data_writeReg), .clk(clock), .en(en23), .clr(ctrl_reset));
	register_32bit R24(.q(Q24), .d(data_writeReg), .clk(clock), .en(en24), .clr(ctrl_reset));
	register_32bit R25(.q(Q25), .d(data_writeReg), .clk(clock), .en(en25), .clr(ctrl_reset));
	register_32bit R26(.q(Q26), .d(data_writeReg), .clk(clock), .en(en26), .clr(ctrl_reset));
	register_32bit R27(.q(Q27), .d(data_writeReg), .clk(clock), .en(en27), .clr(ctrl_reset));
	register_32bit R28(.q(Q28), .d(data_writeReg), .clk(clock), .en(en28), .clr(ctrl_reset));
	register_32bit R29(.q(Q29), .d(data_writeReg), .clk(clock), .en(en29), .clr(ctrl_reset));
	register_32bit R30(.q(Q30), .d(data_writeReg), .clk(clock), .en(en30), .clr(ctrl_reset));
	register_32bit R31(.q(Q31), .d(data_writeReg), .clk(clock), .en(en31), .clr(ctrl_reset));

	/* read part */
	
	// 1. decode 2 5-bit control binary to 2 32bit one-hot
	decoder_5to32 read_A_decoder(.in(ctrl_readRegA), .out(read_A_decoder_output));
	decoder_5to32 read_B_decoder(.in(ctrl_readRegB), .out(read_B_decoder_output));
	
	// 2. connect one-hot to enabled port of 32-bit tristate buffer and output data_readRegA
	// special case: when read R0, always output 0
	tristate_buffer_32bit tA0(.in(32'h00000000), .en(read_A_decoder_output[0]), .out(data_readRegA));
	tristate_buffer_32bit tA1(.in(Q1), .en(read_A_decoder_output[1]), .out(data_readRegA));
	tristate_buffer_32bit tA2(.in(Q2), .en(read_A_decoder_output[2]), .out(data_readRegA));
	tristate_buffer_32bit tA3(.in(Q3), .en(read_A_decoder_output[3]), .out(data_readRegA));
	tristate_buffer_32bit tA4(.in(Q4), .en(read_A_decoder_output[4]), .out(data_readRegA));
	tristate_buffer_32bit tA5(.in(Q5), .en(read_A_decoder_output[5]), .out(data_readRegA));
	tristate_buffer_32bit tA6(.in(Q6), .en(read_A_decoder_output[6]), .out(data_readRegA));
	tristate_buffer_32bit tA7(.in(Q7), .en(read_A_decoder_output[7]), .out(data_readRegA));
	tristate_buffer_32bit tA8(.in(Q8), .en(read_A_decoder_output[8]), .out(data_readRegA));
	tristate_buffer_32bit tA9(.in(Q9), .en(read_A_decoder_output[9]), .out(data_readRegA));
	tristate_buffer_32bit tA10(.in(Q10), .en(read_A_decoder_output[10]), .out(data_readRegA));
	tristate_buffer_32bit tA11(.in(Q11), .en(read_A_decoder_output[11]), .out(data_readRegA));
	tristate_buffer_32bit tA12(.in(Q12), .en(read_A_decoder_output[12]), .out(data_readRegA));
	tristate_buffer_32bit tA13(.in(Q13), .en(read_A_decoder_output[13]), .out(data_readRegA));
	tristate_buffer_32bit tA14(.in(Q14), .en(read_A_decoder_output[14]), .out(data_readRegA));
	tristate_buffer_32bit tA15(.in(Q15), .en(read_A_decoder_output[15]), .out(data_readRegA));
	tristate_buffer_32bit tA16(.in(Q16), .en(read_A_decoder_output[16]), .out(data_readRegA));
	tristate_buffer_32bit tA17(.in(Q17), .en(read_A_decoder_output[17]), .out(data_readRegA));
	tristate_buffer_32bit tA18(.in(Q18), .en(read_A_decoder_output[18]), .out(data_readRegA));
	tristate_buffer_32bit tA19(.in(Q19), .en(read_A_decoder_output[19]), .out(data_readRegA));
	tristate_buffer_32bit tA20(.in(Q20), .en(read_A_decoder_output[20]), .out(data_readRegA));
	tristate_buffer_32bit tA21(.in(Q21), .en(read_A_decoder_output[21]), .out(data_readRegA));
	tristate_buffer_32bit tA22(.in(Q22), .en(read_A_decoder_output[22]), .out(data_readRegA));
	tristate_buffer_32bit tA23(.in(Q23), .en(read_A_decoder_output[23]), .out(data_readRegA));
	tristate_buffer_32bit tA24(.in(Q24), .en(read_A_decoder_output[24]), .out(data_readRegA));
	tristate_buffer_32bit tA25(.in(Q25), .en(read_A_decoder_output[25]), .out(data_readRegA));
	tristate_buffer_32bit tA26(.in(Q26), .en(read_A_decoder_output[26]), .out(data_readRegA));
	tristate_buffer_32bit tA27(.in(Q27), .en(read_A_decoder_output[27]), .out(data_readRegA));
	tristate_buffer_32bit tA28(.in(Q28), .en(read_A_decoder_output[28]), .out(data_readRegA));
	tristate_buffer_32bit tA29(.in(Q29), .en(read_A_decoder_output[29]), .out(data_readRegA));
	tristate_buffer_32bit tA30(.in(Q30), .en(read_A_decoder_output[30]), .out(data_readRegA));
	tristate_buffer_32bit tA31(.in(Q31), .en(read_A_decoder_output[31]), .out(data_readRegA));
	
	// 3. connect one-hot to enabled port of 32-bit tristate buffer and output data_readRegB
	tristate_buffer_32bit tB0(.in(32'h00000000), .en(read_B_decoder_output[0]), .out(data_readRegB));
	tristate_buffer_32bit tB1(.in(Q1), .en(read_B_decoder_output[1]), .out(data_readRegB));
	tristate_buffer_32bit tB2(.in(Q2), .en(read_B_decoder_output[2]), .out(data_readRegB));
	tristate_buffer_32bit tB3(.in(Q3), .en(read_B_decoder_output[3]), .out(data_readRegB));
	tristate_buffer_32bit tB4(.in(Q4), .en(read_B_decoder_output[4]), .out(data_readRegB));
	tristate_buffer_32bit tB5(.in(Q5), .en(read_B_decoder_output[5]), .out(data_readRegB));
	tristate_buffer_32bit tB6(.in(Q6), .en(read_B_decoder_output[6]), .out(data_readRegB));
	tristate_buffer_32bit tB7(.in(Q7), .en(read_B_decoder_output[7]), .out(data_readRegB));
	tristate_buffer_32bit tB8(.in(Q8), .en(read_B_decoder_output[8]), .out(data_readRegB));
	tristate_buffer_32bit tB9(.in(Q9), .en(read_B_decoder_output[9]), .out(data_readRegB));
	tristate_buffer_32bit tB10(.in(Q10), .en(read_B_decoder_output[10]), .out(data_readRegB));
	tristate_buffer_32bit tB11(.in(Q11), .en(read_B_decoder_output[11]), .out(data_readRegB));
	tristate_buffer_32bit tB12(.in(Q12), .en(read_B_decoder_output[12]), .out(data_readRegB));
	tristate_buffer_32bit tB13(.in(Q13), .en(read_B_decoder_output[13]), .out(data_readRegB));
	tristate_buffer_32bit tB14(.in(Q14), .en(read_B_decoder_output[14]), .out(data_readRegB));
	tristate_buffer_32bit tB15(.in(Q15), .en(read_B_decoder_output[15]), .out(data_readRegB));
	tristate_buffer_32bit tB16(.in(Q16), .en(read_B_decoder_output[16]), .out(data_readRegB));
	tristate_buffer_32bit tB17(.in(Q17), .en(read_B_decoder_output[17]), .out(data_readRegB));
	tristate_buffer_32bit tB18(.in(Q18), .en(read_B_decoder_output[18]), .out(data_readRegB));
	tristate_buffer_32bit tB19(.in(Q19), .en(read_B_decoder_output[19]), .out(data_readRegB));
	tristate_buffer_32bit tB20(.in(Q20), .en(read_B_decoder_output[20]), .out(data_readRegB));
	tristate_buffer_32bit tB21(.in(Q21), .en(read_B_decoder_output[21]), .out(data_readRegB));
	tristate_buffer_32bit tB22(.in(Q22), .en(read_B_decoder_output[22]), .out(data_readRegB));
	tristate_buffer_32bit tB23(.in(Q23), .en(read_B_decoder_output[23]), .out(data_readRegB));
	tristate_buffer_32bit tB24(.in(Q24), .en(read_B_decoder_output[24]), .out(data_readRegB));
	tristate_buffer_32bit tB25(.in(Q25), .en(read_B_decoder_output[25]), .out(data_readRegB));
	tristate_buffer_32bit tB26(.in(Q26), .en(read_B_decoder_output[26]), .out(data_readRegB));
	tristate_buffer_32bit tB27(.in(Q27), .en(read_B_decoder_output[27]), .out(data_readRegB));
	tristate_buffer_32bit tB28(.in(Q28), .en(read_B_decoder_output[28]), .out(data_readRegB));
	tristate_buffer_32bit tB29(.in(Q29), .en(read_B_decoder_output[29]), .out(data_readRegB));
	tristate_buffer_32bit tB30(.in(Q30), .en(read_B_decoder_output[30]), .out(data_readRegB));
	tristate_buffer_32bit tB31(.in(Q31), .en(read_B_decoder_output[31]), .out(data_readRegB));

endmodule
