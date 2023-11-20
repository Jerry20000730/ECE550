/*
	Create by: Fangcheng
	Date: 2023-10-25
*/
`timescale 1 ns / 100 ps
module processor_tb();
    reg clock, reset;
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;

    // instantiate the skeleton
    skeleton skeleton1(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock);

    // setting the initial values of all the reg
    initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        reset = 1'b1;    // assert reset
    #100
        reset = 1'b0;

    #100000
        $stop;
    end

    always 
        #10 clock = ~clock;

endmodule