module decoder_5to32(in, out);
	input[4:0] in;
	output[31:0] out;
	
	// derive the truth table 
	// and implement 5-to-32 decoder one by one
	and_5input and0(.out(out[0]), .in0(~in[0]), .in1(~in[1]), .in2(~in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and1(.out(out[1]), .in0(in[0]), .in1(~in[1]), .in2(~in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and2(.out(out[2]), .in0(~in[0]), .in1(in[1]), .in2(~in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and3(.out(out[3]), .in0(in[0]), .in1(in[1]), .in2(~in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and4(.out(out[4]), .in0(~in[0]), .in1(~in[1]), .in2(in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and5(.out(out[5]), .in0(in[0]), .in1(~in[1]), .in2(in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and6(.out(out[6]), .in0(~in[0]), .in1(in[1]), .in2(in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and7(.out(out[7]), .in0(in[0]), .in1(in[1]), .in2(in[2]), .in3(~in[3]), .in4(~in[4]));
	and_5input and8(.out(out[8]), .in0(~in[0]), .in1(~in[1]), .in2(~in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and9(.out(out[9]), .in0(in[0]), .in1(~in[1]), .in2(~in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and10(.out(out[10]), .in0(~in[0]), .in1(in[1]), .in2(~in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and11(.out(out[11]), .in0(in[0]), .in1(in[1]), .in2(~in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and12(.out(out[12]), .in0(~in[0]), .in1(~in[1]), .in2(in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and13(.out(out[13]), .in0(in[0]), .in1(~in[1]), .in2(in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and14(.out(out[14]), .in0(~in[0]), .in1(in[1]), .in2(in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and15(.out(out[15]), .in0(in[0]), .in1(in[1]), .in2(in[2]), .in3(in[3]), .in4(~in[4]));
	and_5input and16(.out(out[16]), .in0(~in[0]), .in1(~in[1]), .in2(~in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and17(.out(out[17]), .in0(in[0]), .in1(~in[1]), .in2(~in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and18(.out(out[18]), .in0(~in[0]), .in1(in[1]), .in2(~in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and19(.out(out[19]), .in0(in[0]), .in1(in[1]), .in2(~in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and20(.out(out[20]), .in0(~in[0]), .in1(~in[1]), .in2(in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and21(.out(out[21]), .in0(in[0]), .in1(~in[1]), .in2(in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and22(.out(out[22]), .in0(~in[0]), .in1(in[1]), .in2(in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and23(.out(out[23]), .in0(in[0]), .in1(in[1]), .in2(in[2]), .in3(~in[3]), .in4(in[4]));
	and_5input and24(.out(out[24]), .in0(~in[0]), .in1(~in[1]), .in2(~in[2]), .in3(in[3]), .in4(in[4]));
	and_5input and25(.out(out[25]), .in0(in[0]), .in1(~in[1]), .in2(~in[2]), .in3(in[3]), .in4(in[4]));
	and_5input and26(.out(out[26]), .in0(~in[0]), .in1(in[1]), .in2(~in[2]), .in3(in[3]), .in4(in[4]));
	and_5input and27(.out(out[27]), .in0(in[0]), .in1(in[1]), .in2(~in[2]), .in3(in[3]), .in4(in[4]));
	and_5input and28(.out(out[28]), .in0(~in[0]), .in1(~in[1]), .in2(in[2]), .in3(in[3]), .in4(in[4]));
	and_5input and29(.out(out[29]), .in0(in[0]), .in1(~in[1]), .in2(in[2]), .in3(in[3]), .in4(in[4]));
	and_5input and30(.out(out[30]), .in0(~in[0]), .in1(in[1]), .in2(in[2]), .in3(in[3]), .in4(in[4]));
	and_5input and31(.out(out[31]), .in0(in[0]), .in1(in[1]), .in2(in[2]), .in3(in[3]), .in4(in[4]));

endmodule