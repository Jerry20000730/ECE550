module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
	// all temporary stored result calculated
	wire [31:0] add_or_sub_result, AND_bitwise_result, OR_bitwise_result, SRA_result, SLL_result;
	
	// variable for checkpoint 1
	wire [31:0] real_B;
	wire [31:0] notB;
	wire temp1, temp2, temp3, temp4;
	wire nottemp1, nottemp2, nottemp3;
	wire C32;
	
	// no variable for checkpoint 2
	
	
	// ------------ **ALU checkpoint 1** BEGIN ----------------------
	// ---------------- ADD & SUBTRACTION ---------------------------
	// not B if the operation is subtration
	not_32bit not_32bit_1(.a(data_operandB), .nota(notB));
	
	// judge whether the operation is subtration or addition
	assign real_B = ctrl_ALUopcode[0] ? notB : data_operandB;
	
	cla cla0(.a(data_operandA), .b(real_B), .cin(ctrl_ALUopcode[0]), .sum(add_or_sub_result), .cout(C32));
	
	// ---------------- overflow check ------------------------------
	// judge if there is overflow
	// overflow = A31B31S31' + A31'B31'S31
	and and1(temp1, data_operandA[31], real_B[31]);
	not not1(nottemp1, add_or_sub_result[31]);
	and and2(temp2, temp1, nottemp1);
	not not2(nottemp2, real_B[31]);
	not not3(nottemp3, data_operandA[31]);
	and and3(temp3, nottemp3, nottemp2);
	and and4(temp4, temp3, add_or_sub_result[31]);
	or or1(overflow, temp2, temp4);
	// ---------------- **ALU checkpoint 1** END --------------------
	
	
	
	// ------------ **ALU checkpoint 2** BEGIN ----------------------
	// ------------------ bitwise AND & OR -------------------------- 
	AND_bitwise_32bit AND_bitwise_32bit1(.a(data_operandA), .b(data_operandB), .out(AND_bitwise_result));
	OR_bitwise_32bit OR_bitwise_32bit1(.a(data_operandA), .b(data_operandB), .out(OR_bitwise_result));
	
	// ----------------- Logical Left Shift -------------------------
	SLL SLL1(.a(data_operandA), .shiftamt(ctrl_shiftamt), .out(SLL_result));
	// --------------- Arithmetic Right Shift -----------------------
	SRA SRA1(.a(data_operandA), .shiftamt(ctrl_shiftamt), .out(SRA_result));
	// ------------ **ALU checkpoint 2** END ------------------------
	
	// assign data_result according to the ALUopcode
	//  -------------------
	// |00000 ==> ADD		  |	
	// |00001 ==> SUBTRACT |
	// |00010 ==> AND      |
	// |00011 ==> OR       |
	// |00100 ==> SLL      |
	// |00101 ==> SRA      |
	//  -------------------
	// ---------------- **ALU checkpoint 2** END --------------------
	
	assign data_result = ctrl_ALUopcode[2] ? (ctrl_ALUopcode[0] ? SRA_result : SLL_result) : (ctrl_ALUopcode[1] ? (ctrl_ALUopcode[0] ? OR_bitwise_result : AND_bitwise_result) : add_or_sub_result);
	

endmodule