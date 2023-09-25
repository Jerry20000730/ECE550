module OR_bitwise_32bit(a, b, out);
	input[31:0] a;
	input[31:0] b;
	output[31:0] out;
	
	// perform bit-wise or
	genvar i;
	generate
		for(i=0; i<32; i=i+1) begin: or_bitwise_loop
			or bitwise_or(out[i], a[i], b[i]);
		end
	endgenerate
endmodule