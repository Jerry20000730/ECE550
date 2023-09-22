// set the timescale
`timescale 1 ns / 100 ps
module counter_tb(); // testbenches take no arguments
	reg w;
	reg clock;
	reg reset;
	wire [2:0] count;
	wire [2:0] state;
	// prepare any other variables you want
	counter test_counter(.clk(clock), .reset(reset), .input1(w), .count(count), .state(state));
	
	// begin simulation
	initial begin
		$display($time, " simulation start");
		clock = 1'b0;
		@(negedge clock);
		w = 1'b0;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		#100 w = 1'b0;
		#40 w = 1'b1;
		@(negedge clock);
		$stop;
	end
	always
		#10 clock = ~clock; // toggle clock every 10 timescale units
endmodule