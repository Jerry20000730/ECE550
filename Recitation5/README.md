# Recitation 5
The aim of this recitation is to learn more about **behavioral** Verilog and re-create your ALU in behavioral Verilog.

## Tasks

- Task 1: Watch [YouTube video](https://www.youtube.com/watch?v=pOlxQnMw3Ss)
- Task 2: Recreate your ALU in **behavioral** Verilog. You can choose 2 or 3 operations among add, subtract, and, or, sll, and sra to implement. Use testbenches to test your code. 

## ADD/SUB_behaviour

The behavioral code for AND gate compared with structural verilog is much simpler, the `+` and`-`function will add however number of bit together, and we won't need to worry about to use RCA or CLA.

```verilog
module ADD_behaviour(a, b, out);
	input [31:0] a,b;
	output [31:0] out;
	
	assign out = a + b;
endmodule

module SUB_behaviour(a, b, out);
	input [31:0] a,b;
	output [31:0] out;
	
	assign out = a - b;
endmodule
```

## AND/OR_behaviour

Just like ADD/SUB, instead of doing N times of AND gate / OR gate, the AND gate and OR gate in verilog can be simply written as:

```verilog
module AND_behaviour(a, b, out);

	input [31:0] a;  // 32-bit input data
    input [31:0] b;  // 32-bit input data
    output [31:0] out;  // 32-bit output data
	 
	assign out = a & b;

endmodule

module OR_behaviour(a, b, out);

	input [31:0] a;  // 32-bit input data
    input [31:0] b;  // 32-bit input data
    output [31:0] out;  // 32-bit output data
	 
	assign out = a | b;

endmodule
```

## Shift Right Arithmetic (SRA) / Shift Left Logical (SLL)

In behavioral verilog, SRA can be achieved by  `>>>` and SLL can be simply achieved by `<<`

```verilog
module SLL_behaviour(a, shiftamt, out);

   input [31:0] a;
   input [4:0] shiftamt;
   output [31:0] out;

   assign out = a << shiftamt;

endmodule

module SRA_behaviour(a, shiftamt, out);

	input [31:0] a;
	input [4:0] shiftamt;
	output [31:0] out;
	
	assign out = a >>> shiftamt;

endmodule
```

## Conclusion

Behavioral verilog is way more convenient and intelligent and hardly need someone to understand the underlying logical design before implementing certain functionality.
