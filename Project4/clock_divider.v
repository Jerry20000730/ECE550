/*
	Create by: Junpei
	Date: 2023-10-23
*/
module clock_divider(clk_in, reset, clk_out);
	input clk_in, reset;
	output clk_out;
	
	wire clk_tmp;
	wire[1: 0] data;
	
	dffe_reg dffe_0(clk_tmp, data[0], clk_in, 1'b1, reset);
	dffe_reg dffe_1(clk_out, data[1], clk_tmp, 1'b1, reset);
	
	not not_0(data[0], clk_tmp);
	not not_1(data[1], clk_out);
	

endmodule