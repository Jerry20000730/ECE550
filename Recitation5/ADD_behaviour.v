module ADD_behaviour(a, b, out);
	input [31:0] a,b;
	output [31:0] out;
	
	assign out = a + b;
endmodule