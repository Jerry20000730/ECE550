/*
	Create by: Junpei
	Date: 2023-10-25
*/
module CLA_32bit(a, b, cin, sum, cout);
	input [31: 0] a, b;
	input cin;
	output [31:0] sum;
	output cout;
	
	wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;
	
	
	// apply 32 1-bit cla in series
	cla_1bit cla1_1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
	cla_1bit cla1_2(.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
	cla_1bit cla1_3(.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
	cla_1bit cla1_4(.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(c4));
	cla_1bit cla1_5(.a(a[4]), .b(b[4]), .cin(c4), .sum(sum[4]), .cout(c5));
	cla_1bit cla1_6(.a(a[5]), .b(b[5]), .cin(c5), .sum(sum[5]), .cout(c6));
	cla_1bit cla1_7(.a(a[6]), .b(b[6]), .cin(c6), .sum(sum[6]), .cout(c7));
	cla_1bit cla1_8(.a(a[7]), .b(b[7]), .cin(c7), .sum(sum[7]), .cout(c8));
	cla_1bit cla1_9(.a(a[8]), .b(b[8]), .cin(c8), .sum(sum[8]), .cout(c9));
	cla_1bit cla1_10(.a(a[9]), .b(b[9]), .cin(c9), .sum(sum[9]), .cout(c10));
	cla_1bit cla1_11(.a(a[10]), .b(b[10]), .cin(c10), .sum(sum[10]), .cout(c11));
	cla_1bit cla1_12(.a(a[11]), .b(b[11]), .cin(c11), .sum(sum[11]), .cout(c12));
	cla_1bit cla1_13(.a(a[12]), .b(b[12]), .cin(c12), .sum(sum[12]), .cout(c13));
	cla_1bit cla1_14(.a(a[13]), .b(b[13]), .cin(c13), .sum(sum[13]), .cout(c14));
	cla_1bit cla1_15(.a(a[14]), .b(b[14]), .cin(c14), .sum(sum[14]), .cout(c15));
	cla_1bit cla1_16(.a(a[15]), .b(b[15]), .cin(c15), .sum(sum[15]), .cout(c16));
	cla_1bit cla1_17(.a(a[16]), .b(b[16]), .cin(c16), .sum(sum[16]), .cout(c17));
	cla_1bit cla1_18(.a(a[17]), .b(b[17]), .cin(c17), .sum(sum[17]), .cout(c18));
	cla_1bit cla1_19(.a(a[18]), .b(b[18]), .cin(c18), .sum(sum[18]), .cout(c19));
	cla_1bit cla1_20(.a(a[19]), .b(b[19]), .cin(c19), .sum(sum[19]), .cout(c20));
	cla_1bit cla1_21(.a(a[20]), .b(b[20]), .cin(c20), .sum(sum[20]), .cout(c21));
	cla_1bit cla1_22(.a(a[21]), .b(b[21]), .cin(c21), .sum(sum[21]), .cout(c22));
	cla_1bit cla1_23(.a(a[22]), .b(b[22]), .cin(c22), .sum(sum[22]), .cout(c23));
	cla_1bit cla1_24(.a(a[23]), .b(b[23]), .cin(c23), .sum(sum[23]), .cout(c24));
	cla_1bit cla1_25(.a(a[24]), .b(b[24]), .cin(c24), .sum(sum[24]), .cout(c25));
	cla_1bit cla1_26(.a(a[25]), .b(b[25]), .cin(c25), .sum(sum[25]), .cout(c26));
	cla_1bit cla1_27(.a(a[26]), .b(b[26]), .cin(c26), .sum(sum[26]), .cout(c27));
	cla_1bit cla1_28(.a(a[27]), .b(b[27]), .cin(c27), .sum(sum[27]), .cout(c28));
	cla_1bit cla1_29(.a(a[28]), .b(b[28]), .cin(c28), .sum(sum[28]), .cout(c29));
	cla_1bit cla1_30(.a(a[29]), .b(b[29]), .cin(c29), .sum(sum[29]), .cout(c30));
	cla_1bit cla1_31(.a(a[30]), .b(b[30]), .cin(c30), .sum(sum[30]), .cout(c31));
	cla_1bit cla1_32(.a(a[31]), .b(b[31]), .cin(c31), .sum(sum[31]), .cout(cout));
	
endmodule