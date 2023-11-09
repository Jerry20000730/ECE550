/*
	Create by: Fangcheng
	Date: 2023-10-23
*/
module signExtension(in, out);
	input[16:0] in;
	output[31:0] out;
	
	assign out = in[16] ? {15'b111111111111111, in} : {15'b0000000000000000, in};
endmodule