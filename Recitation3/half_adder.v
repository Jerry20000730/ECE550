module half_adder(a, b, sum, c_out);
	input a, b;
	output sum, c_out;
	xor xor_gate(sum, a, b);
	and and_gate(c_out, a, b);
endmodule