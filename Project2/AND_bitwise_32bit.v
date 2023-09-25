module AND_bitwise_32bit(a, b, out);
	input [31:0] a;
	input [31:0] b;
	output [31:0] out;
	
	// perform bit-wise and
	genvar i;
	generate
		for (i=0;i<32;i=i+1) begin: and_bitwise_loop
			and bitwise_and(out[i], a[i], b[i]);
		end
	endgenerate
endmodule