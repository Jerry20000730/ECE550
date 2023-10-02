module OR_behaviour(a, b, out);

	 input [31:0] a;  // 32-bit input data
    input [31:0] b;  // 32-bit input data
    output [31:0] out;  // 32-bit output data
	 
	 assign out = a | b;

endmodule