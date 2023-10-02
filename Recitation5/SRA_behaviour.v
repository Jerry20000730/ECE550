module SRA_behaviour(a, shiftamt, out);

	input [31:0] a;
	input [4:0] shiftamt;
	output [31:0] out;
	
	assign out = a >>> shiftamt;

endmodule
			
	
	