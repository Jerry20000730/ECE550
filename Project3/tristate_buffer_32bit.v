module tristate_buffer_32bit(in, en, out);
	input[31:0] in;
	input en;
	output[31:0] out;
	
	assign out[0] = en ? in[0] : 1'bz;
	assign out[1] = en ? in[1] : 1'bz;
	assign out[2] = en ? in[2] : 1'bz;
	assign out[3] = en ? in[3] : 1'bz;
	assign out[4] = en ? in[4] : 1'bz;
	assign out[5] = en ? in[5] : 1'bz;
	assign out[6] = en ? in[6] : 1'bz;
	assign out[7] = en ? in[7] : 1'bz;
	assign out[8] = en ? in[8] : 1'bz;
	assign out[9] = en ? in[9] : 1'bz;
	assign out[10] = en ? in[10] : 1'bz;
	assign out[11] = en ? in[11] : 1'bz;
	assign out[12] = en ? in[12] : 1'bz;
	assign out[13] = en ? in[13] : 1'bz;
	assign out[14] = en ? in[14] : 1'bz;
	assign out[15] = en ? in[15] : 1'bz;
	assign out[16] = en ? in[16] : 1'bz;
	assign out[17] = en ? in[17] : 1'bz;
	assign out[18] = en ? in[18] : 1'bz;
	assign out[19] = en ? in[19] : 1'bz;
	assign out[20] = en ? in[20] : 1'bz;
	assign out[21] = en ? in[21] : 1'bz;
	assign out[22] = en ? in[22] : 1'bz;
	assign out[23] = en ? in[23] : 1'bz;
	assign out[24] = en ? in[24] : 1'bz;
	assign out[25] = en ? in[25] : 1'bz;
	assign out[26] = en ? in[26] : 1'bz;
	assign out[27] = en ? in[27] : 1'bz;
	assign out[28] = en ? in[28] : 1'bz;
	assign out[29] = en ? in[29] : 1'bz;
	assign out[30] = en ? in[30] : 1'bz;
	assign out[31] = en ? in[31] : 1'bz;

endmodule
