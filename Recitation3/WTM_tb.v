// set the timescale
`timescale 1 ns / 100 ps
module WTM_tb();
	// set up inputs as registers so they can be manipulated at will
	reg [4:0]in1;
	reg [4:0]in2;
	
	// clocks are useful for testbeches because they allow you to check your
	// circuits at regular intervals large enough for signals to propogate
	reg clock;
	
	// set up output as wire
	wire cout;
	wire [9:0] out;
	
	// prepare any other variables you want - nothing is off-limits in a TB
	integer num_errors;
	
	// instantiate the WTM
	WTM test_WTM(.a(in1), .b(in2), .res(out), .cout(cout));
	
	// begin simulation
	initial begin
	$display($time, " simulation start");
	
	clock = 1'b0;
	
	@(negedge clock);
	in1 = 5'd0; //5'b00000
	in2 = 5'd20; //5'b10100
	
	@(negedge clock);
	in1 = 5'd25; //5'b11001
	in2 = 5'd16; //5'b00100
	
	@(negedge clock);
	in1 = 5'd31;
	in2 = 5'd1;
	
	@(negedge clock);
	$stop;
	end
	
	always
	#10 clock = ~clock; // toggle clock every 10 timescale units
	
endmodule