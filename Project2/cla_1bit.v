module cla_1bit(a, b, cin, sum, cout);
	input a, b;
	// c0, c
	input cin;
	output sum;
	output cout;
	
	wire temp1, temp2, temp3, temp4;
	
	// calculate sum for a, b, cin
	// sum = a + b + cin
	xor xor1(temp1, a, b);
	xor xor2(sum, temp1, cin);
	
	// calculate cout for a, b, cin
	// cout = a * b + (a + b) * cin
	and and1(temp2, a, b);
	or or1(temp3, a, b);
	and and2(temp4, temp3, cin);
	or or2(cout, temp2, temp4);
	
endmodule
	
	