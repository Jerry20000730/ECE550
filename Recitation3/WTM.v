module WTM(a, b, res, cout);
	input [4:0] a, b;
	output [9:0] res;
	output cout;
	
	// array declaration
	wire [4:0] multi[4:0];
	// generate 25 multiplication result
	genvar i, j;
	
	generate
		for (i=0; i<5; i=i+1) begin: a_multi
			for (j=0; j<5; j=j+1) begin: b_multi
				// compute a[i] * b[j]
				and multi_1bit(multi[i][j], a[i], b[j]);
			end
		end
	endgenerate
	
	// there are 26 cout
	wire [25: 0]C;
	// there are 26 sum
	wire [25: 0]S;

	// stage 1
	// from right to left
	half_adder ha_0(.c_out(C[0]), .sum(S[0]), .a(multi[1][0]), .b(multi[0][1]));
	
	full_adder fa_0(.c_out(C[1]), .sum(S[1]), .c_in(multi[0][2]), .a(multi[1][1]), .b(multi[2][0]));
	full_adder fa_1(.c_out(C[2]), .sum(S[2]), .c_in(multi[1][2]), .a(multi[2][1]), .b(multi[3][0]));
	full_adder fa_2(.c_out(C[3]), .sum(S[3]), .c_in(multi[2][2]), .a(multi[3][1]), .b(multi[4][0]));
	full_adder fa_3(.c_out(C[4]), .sum(S[4]), .c_in(multi[2][3]), .a(multi[3][2]), .b(multi[4][1]));
	full_adder fa_4(.c_out(C[5]), .sum(S[5]), .c_in(multi[2][4]), .a(multi[3][3]), .b(multi[4][2]));
	
	half_adder ha_1(.c_out(C[6]), .sum(S[6]), .a(multi[4][3]), .b(multi[3][4]));
	
	// stage 
	// from right to left
	half_adder ha_2(.c_out(C[7]), .sum(S[7]), .a(C[0]), .b(S[1]));
	
	full_adder fa_5(.c_out(C[8]), .sum(S[8]), .c_in(C[1]), .a(S[2]), .b(multi[0][3]));
	full_adder fa_6(.c_out(C[9]), .sum(S[9]), .c_in(C[2]), .a(S[3]), .b(multi[1][3]));
	full_adder fa_7(.c_out(C[10]), .sum(S[10]), .c_in(C[3]), .a(S[4]), .b(multi[1][4]));
	
	half_adder ha_3(.c_out(C[11]), .sum(S[11]), .a(C[4]), .b(S[5]));
	half_adder ha_4(.c_out(C[12]), .sum(S[12]), .a(C[5]), .b(S[6]));
	half_adder ha_5(.c_out(C[13]), .sum(S[13]), .a(C[6]), .b(multi[4][4]));
	
	// stage 3
	// from left to right
	half_adder ha_6(.c_out(C[14]), .sum(S[14]), .a(C[7]), .b(S[8]));
	
	full_adder fa_8(.c_out(C[15]), .sum(S[15]), .c_in(C[8]), .a(S[9]), .b(multi[0][4]));
	
	half_adder ha_7(.c_out(C[16]), .sum(S[16]), .a(C[9]), .b(S[10]));
	half_adder ha_8(.c_out(C[17]), .sum(S[17]), .a(C[10]), .b(S[11]));
	half_adder ha_9(.c_out(C[18]), .sum(S[18]), .a(C[11]), .b(S[12]));
	half_adder ha_10(.c_out(C[19]), .sum(S[19]), .a(C[12]), .b(S[13]));
	
	// stage 4
	half_adder ha_11(.c_out(C[20]), .sum(S[20]), .a(C[14]), .b(S[15]));
	
	full_adder fa_9(.c_out(C[21]), .sum(S[21]), .c_in(C[15]), .a(S[16]), .b(C[20]));
	full_adder fa_10(.c_out(C[22]), .sum(S[22]), .c_in(C[16]), .a(S[17]), .b(C[21]));
	full_adder fa_11(.c_out(C[23]), .sum(S[23]), .c_in(C[17]), .a(S[18]), .b(C[22]));
	full_adder fa_12(.c_out(C[24]), .sum(S[24]), .c_in(C[18]), .a(S[19]), .b(C[23]));
	full_adder fa_13(.c_out(C[25]), .sum(S[25]), .c_in(C[19]), .a(C[13]), .b(C[24]));
	
	assign res[0] = multi[0][0];
	assign res[1] = S[0];
	assign res[2] = S[7];
	assign res[3] = S[14];
	assign res[4] = S[20];
	assign res[5] = S[21];
	assign res[6] = S[22];
	assign res[7] = S[23];
	assign res[8] = S[24];
	assign res[9] = S[25];
	assign cout = C[25];

endmodule
	
	
	