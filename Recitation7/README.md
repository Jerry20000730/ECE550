# Recitation 7

Over the coming two recitations, students will be introduced to interfacing with different input/output (I/O) devices. The aim of this recitation is to learn PS2 interfaces and controllers. We will study the provided PS2 controller, and then alter the code so that pressing a key on a PS2 keyboard causes the FPGA board to display the corresponding character on the built-in LCD screen.

## Equipment

- Computer with Quartus Prime software
- DE2 FPGA board
- PS2 Keyboard

## Tasks

- Task1: Integrate the PS2 input and display results on the FPGA LCD

## PS2_Controller.v Specification

| Port Declarations                         | This section contains the port declarations and definitions used for the module. |
| ----------------------------------------- | ------------------------------------------------------------ |
| Constant Declarations                     | This section contains a list of local parameters whose scope is that of the module they are contained in. These ‘localparam’ values are protected from being altered by any module that calls an instance of the PS2_Controller.v. Leave this section as is determined. |
| Internal Wires and Registers Declarations | This section has the internal wire and register declarations used throughout the module. Leave this section alone. |
| Finite State Machine(s)                   | This section contains a simple FSM which controls the current state of the PS2_Controller. In the first always block, the reset condition is defined so that if a reset signal is given, the controller moves to the default ‘PS2_STATE_0_IDLE’ state. Else, it allows the current state of the ps2_transceiver to be assigned the correct next ps2_transceiver state.  In the next always block, the conditions for which state the controller will move into are defined. Using a case statement, the logic is defined for what the next state should be based on the inputs being seen. The states are: PS2_STATE_0_IDLE, PS2_STATE_1_DATA_IN, PS2_STATE_2_COMMAND_OUT, PS2_STATE_3_END_TRANSFER, PS2_STATE_4_END_DELAYED. S_ps2_transceiver is in parenthesis at the beginning of the case statement because the case statement is sensitive to that signal; this means whenever the value of this changes, the case statement is entered.  The correct current state that the PS2_transceiver should be in is updated on every clock cycle. |
| Sequential Logic                          | This section contains the sequential logic of the controller. The always statement uses the clock signal to control when the values of certain registers are updated. Don’t worry about this section too much. |
| Combinational Logic                       | This section contains the logic used to determine what the positive and negative edges of the clock signal are. In addition, some basic assignments are made for asserting the correct values on the nodule ports. |
| Internal Modules                          | These are internal instances of Altera’s IP blocks that handle communication with the internal PS2 hardware of the FPGA. |

## PS2_Interface.v Specification

The PS2_Interface.v file simply calls an instance of the controller; your skeleton will pass data to the controller through the interface, and the controller will control when its internal modules are communicating with the PS2 core hardware in the FPGA. Then, the interface will output data to be fed into the LCD module. The following three modules in `skeleton.v`  will help you to see the output when you press a key.

```verilog
	// keyboard controller
	PS2_Interface myps2(clock, resetn, ps2_clock, ps2_data, ps2_key_data, ps2_key_pressed, ps2_out);
		
	// lcd controller
	lcd mylcd(clock, ~resetn, 1'b1, ps2_out, lcd_data, lcd_rw, lcd_en, lcd_rs, lcd_on, lcd_blon);
	
	// example for sending ps2 data to the first two seven segment displays
	Hexadecimal_To_Seven_Segment hex1(ps2_out[3:0], seg1);
	Hexadecimal_To_Seven_Segment hex2(ps2_out[7:4], seg2);
```

## Task: Choose 4 characters to implement

In `PS2_Interface.v`, implement the correct relationship between “ps2_key_data” and “last_data_received”.

Hint: if you want to show a letter on the screen, the value you pass to the LCD should be the letter’s ASCII code. For example, if you want to show “Q” on the LCD screen, its ASCII value is 81(decimal), so the input of the LCD module should be 51.

```verilog
// ...
output 	[7:0] 	ps2_key_data;
output 	[7:0] 	last_data_received;

// ...
always @(posedge inclock)
	begin
		if (resetn == 1'b0)
			last_data_received <= 8'h00;
		else if (ps2_key_pressed == 1'b1)
			case(ps2_key_data)
				// A
				8'h1c: last_data_received = 8'h41;
				// S
				8'h1b: last_data_received = 8'h53;
				// D
				8'h23: last_data_received = 8'h44;
				// F
				8'h2b: last_data_received = 8'h46;
			endcase
	end
```

The PS/2 Keyboard Scan Code (we used in this recitation) is listed below:

Reference: [here](https://techdocs.altium.com/display/FPGA/PS2+Keyboard+Scan+Codes)

| Key  | Scan Code |
| ---- | --------- |
| A    | 1C (F01C) |
| S    | 1B (F01B) |
| D    | 23 (F023) |
| F    | 2B (F02B) |
| G    | 34 (F034) |
| H    | 33 (F033) |
| J    | 3B (F03B) |
| Q    | 15 (F015) |
| W    | 1D (F01D) |
| E    | 24 (F024) |
| R    | 2D (F02D) |
| T    | 2C (F02C) |
| Y    | 35 (F035) |
| U    | 3C (F03C) |
| I    | 43 (F043) |
| O    | 44 (F044) |
| P    | 4D (F04D) |
| K    | 42 (F042) |
| L    | 4B(F04B)  |
| Z    | 1A(F01A)  |
| X    | 22(F022)  |
| C    | 21(F021)  |
| B    | 32(F032)  |
| N    | 31(F031)  |
| M    | 3A(F03A)  |

