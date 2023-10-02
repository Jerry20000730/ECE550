module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] add_result, sub_result, and_result, or_result, sll_result, sra_result;
	reg [31:0] result;
	
	ADD_behaviour ADD1(.a(data_operandA), .b(data_operandB), .out(add_result));
	SUB_behaviour SUB1(.a(data_operandA), .b(data_operandB), .out(sub_result));
	AND_behaviour AND1(.a(data_operandA), .b(data_operandB), .out(and_result));
	OR_behaviour OR1(.a(data_operandA), .b(data_operandB), .out(or_result));
	SLL_behaviour SLL1(.a(data_operandA), .shiftamt(ctrl_shiftamt), .out(sll_result));
	SRA_behaviour SRA1(.a(data_operandA), .shiftamt(ctrl_shiftamt), .out(sra_result));
	
	always @(*) begin
    case (ctrl_ALUopcode)
        5'b00000: result = add_result;   
        5'b00001: result = sub_result;
        5'b00010: result = and_result;
        5'b00011: result = or_result;
		  5'b00100: result = sll_result;
		  5'b00101: result = sra_result;
        // Add more cases for other operations if needed
        default: result = 32'h00000000;
    endcase
	end
	
	assign data_result = result;
	assign overflow = 
    ((ctrl_ALUopcode == 5'b00000) &&
    ((data_operandA[31] == 1'b0 && data_operandB[31] == 1'b0 && add_result[31] == 1'b1) || 
    (data_operandA[31] == 1'b1 && data_operandB[31] == 1'b1 && add_result[31] == 1'b0))) ||

    ((ctrl_ALUopcode == 5'b00001) &&
    ((data_operandA[31] == 1'b0 && data_operandB[31] == 1'b1 && sub_result[31] == 1'b1) || 
    (data_operandA[31] == 1'b1 && data_operandB[31] == 1'b0 && sub_result[31] == 1'b0)));

endmodule