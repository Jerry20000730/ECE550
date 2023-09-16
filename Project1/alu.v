module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] real_B;
	wire [31:0] notB;
	wire temp1, temp2, temp3, temp4;
	wire nottemp1, nottemp2, nottemp3;
	wire C32;
	
	// not B if the operation is subtration
	not_32bit not_32bit_1(.a(data_operandB), .nota(notB));
	
	// judge whether the operation is subtration or addition
	assign real_B = ctrl_ALUopcode[0] ? notB : data_operandB;
	
	cla cla0(.a(data_operandA), .b(real_B), .cin(ctrl_ALUopcode[0]), .sum(data_result), .cout(C32));
	
	// judge if there is overflow
	// overflow = A31B31S31' + A31'B31'S31
	and and1(temp1, data_operandA[31], real_B[31]);
	not not1(nottemp1, data_result[31]);
	and and2(temp2, temp1, nottemp1);
	not not2(nottemp2, real_B[31]);
	not not3(nottemp3, data_operandA[31]);
	and and3(temp3, nottemp3, nottemp2);
	and and4(temp4, temp3, data_result[31]);
	or or1(overflow, temp2, temp4);
	
endmodule