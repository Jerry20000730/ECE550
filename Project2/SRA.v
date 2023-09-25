module SRA(a, shiftamt, out);
	input[31:0] a;
	input[4:0] shiftamt;
	output[31:0] out;
	
	wire highest_bit;
	wire[31:0] intermediate1, intermediate2, intermediate3, intermediate4;
	
	wire[31:0] temp;
	
	// judge to append 1 or append 0
	// according to the highest bit
	assign temp1 = a[31] ? {1'b1, a[31:1]} : {1'b0, a[31:1]};
	
	
	// for the first bit in shiftamt, if it is 1, then shift to right by 1, otherwise 0
	mux_32bit mux_32bit_0(.select(shiftamt[0]), .in0(a), .in1(temp1), .out(intermediate1));
	
	assign temp2 = a[31] ? {2'b11, a[31:2]} : {2'b00, a[31:2]};
	
	// for the second bit in shiftamt, if it is 1, then shift to right by 2, otherwise 0
	mux_32bit mux_32bit_1(.select(shiftamt[1]), .in0(intermediate1), .in1(temp2), .out(intermediate2));
	
	assign temp3 = a[31] ? {4'b1111, a[31:4]} : {4'b0000, a[31:4]};
	
	// for the third bit in shiftamt, if it is 1, then shift to right by 4, otherwise 0
	mux_32bit mux_32bit_2(.select(shiftamt[2]), .in0(intermediate2), .in1(temp3), .out(intermediate3));
	
	assign temp4 = a[31] ? {8'b11111111, a[31:8]} : {8'b00000000, a[31:8]};
	
	// for the fourth bit in shiftamt, if it is 1, then shift to right by 8, otherwise 0
	mux_32bit mux_32bit_3(.select(shiftamt[3]), .in0(intermediate3), .in1(temp4), .out(intermediate4));
	
	assign temp5 = a[31] ? {16'b1111111111111111, a[31:16]} : {16'b0000000000000000, a[31:16]};
	
	// for the last bit in shiftamt, if it is 1, then shift to right by 16, otherwise 0
	mux_32bit mux_32bit_4(.select(shiftamt[4]), .in0(intermediate4), .in1(temp5), .out(out));
	
endmodule
	
	