module cla(a, b, cin, sum, cout);

	input [31:0] a, b;
	input cin;
	output [31:0] sum;
	output cout;
	
	wire c8, c16, c24;
	
	cla_8bit cla8_1(.a(a[7:0]), .b(b[7:0]), .cin(cin), .sum(sum[7:0]), .cout(c8));
	cla_8bit cla8_2(.a(a[15:8]), .b(b[15:8]), .cin(c8), .sum(sum[15:8]), .cout(c16));
	cla_8bit cla8_3(.a(a[23:16]), .b(b[23:16]), .cin(c16), .sum(sum[23:16]), .cout(c24));
	cla_8bit cla8_4(.a(a[31:24]), .b(b[31:24]), .cin(c24), .sum(sum[31:24]), .cout(cout));
	
endmodule
	
	