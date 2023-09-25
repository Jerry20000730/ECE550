module not_32bit(a, nota);
	input [31:0] a;
	output [31:0] nota;
	
	// 32-bit not gate is to
	// combine 32 not gate
	// on each bit
	
	not not1(nota[0], a[0]);
	not not2(nota[1], a[1]);
	not not3(nota[2], a[2]);
	not not4(nota[3], a[3]);
	not not5(nota[4], a[4]);
	not not6(nota[5], a[5]);
	not not7(nota[6], a[6]);
	not not8(nota[7], a[7]);
	not not9(nota[8], a[8]);
	not not10(nota[9], a[9]);
	not not11(nota[10], a[10]);
	not not12(nota[11], a[11]);
	not not13(nota[12], a[12]);
	not not14(nota[13], a[13]);
	not not15(nota[14], a[14]);
	not not16(nota[15], a[15]);
	
	not not17(nota[16], a[16]);
	not not18(nota[17], a[17]);
	not not19(nota[18], a[18]);
	not not20(nota[19], a[19]);
	not not21(nota[20], a[20]);
	not not22(nota[21], a[21]);
	not not23(nota[22], a[22]);
	not not24(nota[23], a[23]);
	not not25(nota[24], a[24]);
	not not26(nota[25], a[25]);
	not not27(nota[26], a[26]);
	not not28(nota[27], a[27]);
	not not29(nota[28], a[28]);
	not not30(nota[29], a[29]);
	not not31(nota[30], a[30]);
	not not32(nota[31], a[31]);

endmodule
	