module and_5input(in0, in1, in2, in3, in4, out);
	input in0, in1, in2, in3, in4;
	input out;
	wire temp1, temp2, temp3;
	
	// use four AND gate
	// to test the result
	// of in0 * in1 * in2 * in3 * in4
	and and1(temp1, in0, in1);
	and and2(temp2, temp1, in2);
	and and3(temp3, temp2, in3);
	and and4(out, temp3, in4);
endmodule