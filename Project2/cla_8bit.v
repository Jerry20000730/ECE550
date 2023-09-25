module cla_8bit(a, b, cin, sum, cout);
	input [7:0] a, b;
	input cin;
	output [7:0] sum;
	output cout;
	
	wire c1, c2, c3, c4, c5, c6, c7;
	
	
	// apply 8 1-bit cla in series
	
	cla_1bit cla1_1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
	cla_1bit cla1_2(.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
	cla_1bit cla1_3(.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
	cla_1bit cla1_4(.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(c4));
	cla_1bit cla1_5(.a(a[4]), .b(b[4]), .cin(c4), .sum(sum[4]), .cout(c5));
	cla_1bit cla1_6(.a(a[5]), .b(b[5]), .cin(c5), .sum(sum[5]), .cout(c6));
	cla_1bit cla1_7(.a(a[6]), .b(b[6]), .cin(c6), .sum(sum[6]), .cout(c7));
	cla_1bit cla1_8(.a(a[7]), .b(b[7]), .cin(c7), .sum(sum[7]), .cout(cout));
	
endmodule