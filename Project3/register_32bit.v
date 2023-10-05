module register_32bit(q, d, clk, en, clr);
	input[31:0] d;
	input clk, en, clr;
	output[31:0] q;
	
	// instantiate 32 dffe and connect them sequentially
	// to generate a 32-bit register
	genvar i;
	generate
		for (i=0; i<32; i=i+1) begin: dffe_loop
			my_dffe dffe_32bit(.q(q[i]), .d(d[i]), .clk(clk), .en(en), .clr(clr));
		end
	endgenerate
endmodule
		