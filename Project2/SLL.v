module SLL(a, shiftamt, out);
	input[31:0] a;
	input[4:0] shiftamt;
	output[31:0] out;
	
	wire [31:0] intermediate1, intermediate2, intermediate3, intermediate4;
	wire [31:0] temp1, temp2, temp3, temp4, temp5;
			
	assign temp1 = {a[30:0], 1'b0};
	
	// for the first bit in shiftamt, if it is 1, then shift to left by 1, otherwise 0
	mux_32bit mux_32bit_0(.select(shiftamt[0]), .in0(a), .in1(temp1), .out(intermediate1));
	
	assign temp2 = {intermediate1[29:0], 2'b00};
	
	// for the second bit in shiftamt, if it is 1, then shift to left by 2, otherwise 0
	mux_32bit mux_32bit_1(.select(shiftamt[1]), .in0(intermediate1), .in1(temp2), .out(intermediate2));
	
	assign temp3 = {intermediate2[27:0], 4'b0000};
	
	// for the third bit in shiftamt, if it is 1, then shift to left by 4, otherwise 0
	mux_32bit mux_32bit_2(.select(shiftamt[2]), .in0(intermediate2), .in1(temp3), .out(intermediate3));
	
	assign temp4 = {intermediate3[23:0], 8'b00000000};
	
	// for the fourth bit in shiftamt, if it is 1, then shift to left by 8, otherwise 0
	mux_32bit mux_32bit_3(.select(shiftamt[3]), .in0(intermediate3), .in1(temp4), .out(intermediate4));
	
	assign temp5 = {intermediate4[15:0], 16'b0000000000000000};
	
	// for the last bit in shiftamt, if it is 1, then shift to left by 16, otherwise 0
	mux_32bit mux_32bit_4(.select(shiftamt[4]), .in0(intermediate4), .in1(temp5), .out(out));
	
endmodule