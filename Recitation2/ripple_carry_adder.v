module ripple_carry_adder(a, b, c_in, sum, c_out);

	input [3:0] a, b;
	input c_in;
	output [3:0] sum;
	output c_out;
	
	wire [2:0] carry;
	
	full_adder fa0(.sum(sum[0]), .c_out(carry[0]), .a(a[0]), .b(b[0]), .c_in(c_in));
	full_adder fa1(.sum(sum[1]), .c_out(carry[1]), .a(a[1]), .b(b[1]), .c_in(carry[0]));
	full_adder fa2(.sum(sum[2]), .c_out(carry[2]), .a(a[2]), .b(b[2]), .c_in(carry[1]));
	full_adder fa3(.sum(sum[3]), .c_out(c_out), .a(a[3]), .b(b[2]), .c_in(carry[2]));
	
endmodule