module full_adder(a, b, c_in, sum, c_out);

	input a, b, c_in;
	output sum, c_out;
	wire temp1, temp2, temp3;

	// XOR gate
	xor first_xor_gate(temp1, a, b);
	xor second_xor_gate(sum, temp1, c_in);
	
	// AND gate
	and upper_and_gate(temp2, temp1, c_in);
	and lower_and_gate(temp3, a, b);
	
	// OR gate
	or or_gate(c_out, temp2, temp3);
	
endmodule