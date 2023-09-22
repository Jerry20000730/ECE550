module counter(
	input wire clk,
	input wire reset,
	input wire input1,
	output reg [2:0] count,
	output reg [2:0] state
);

	localparam [2:0]
		A = 3'b000,
		B = 3'b001,
		C = 3'b010,
		D = 3'b011,
		E = 3'b100,
		F = 3'b101,
		G = 3'b110,
		H = 3'b111;

	reg[2:0] state_reg, state_next;
	
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			state_reg <= A;
		end
		else begin
			state_reg <= state_next;
		end
	end
	
	// next state : state_next
	// this is combinational of the sequential design,
	// which contains the logic for next-state
	always @(input1, state_reg) begin
		state_next = state_reg;
		case (state_reg)
			A : begin
				if (input1 == 1'b1) begin
					state_next = B;
				end
				else begin
					state_next = A;
				end
			end
			B: begin
				if (input1 == 1'b1) begin
					state_next = C;
				end
				else begin
					state_next = B;
				end
			end
			C: begin
				if (input1 == 1'b1) begin
					state_next = D;
				end
				else begin
					state_next = C;
				end
			end
			D: begin
				if (input1 == 1'b1) begin
					state_next = E;
				end
				else begin
					state_next = D;
				end
			end
			E: begin
				if (input1 == 1'b1) begin
					state_next = A;
				end
				else begin
					state_next = E;
				end
			end
			default: begin
				state_next = A;
			end
		endcase
	end
	
	// combination output logic
	// This part contains the output of the design
	// no if-else statement is used in this part
	always @(input1, state_reg) begin
		case (state_reg)
			A: begin 
				count = 3'b000;
				state = A;
			end
			B: begin 
				count = 3'b001;
				state = B;
			end
			C: begin
				count = 3'b010;
				state = C;
			end
			D: begin
				count = 3'b011;
				state = D;
			end
			E: begin
				count = 3'b100;
				state = E;
			end
			default: begin
				count = 3'b000;
				state = A;
			end
		endcase
	end
	
//	// optional DFF to remove glitch
//	always @(posedge clk, posedge reset) begin
//		if (reset) begin
//		 count <= 3'b000;
//		 state <= A;
//		end
//	end
endmodule
	
	
			
