module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data,
							 up,
							 down,
							 right,
							 left);

	
input iRST_n;
input iVGA_CLK;

input up, down, right, left;

output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;                        
///////// ////                     
reg [18:0] ADDR;
reg [23:0] bgr_data;

reg [9:0] base_x = 10'd320;
reg [9:0] base_y = 10'd240;
reg [15:0] counter;
reg [9:0] x, y;

wire VGA_CLK_n;
wire [7:0] index;
wire [23:0] bgr_data_raw;
wire cBLANK_n,cHS,cVS,rst;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
     ADDR<=19'd0;
  else if (cHS==1'b0 && cVS==1'b0)
     ADDR<=19'd0;
  else if (cBLANK_n==1'b1)
     ADDR<=ADDR+1;
	  x <= ADDR%640;
     y <= ADDR/640;
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;
img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( index )
	);
	
/////////////////////////
//////Add switch-input logic here
always @(posedge VGA_CLK_n)
begin 
	if((x > base_x) && (x < (base_x + 30)) && (y > base_y) && (y < (base_y + 30)))
		bgr_data <= 24'hFF69B4;
	else
		bgr_data <= bgr_data_raw;
end

always @(posedge VGA_CLK_n)
begin
	if (counter == 0)
	begin
		if(up)
			base_y  <= base_y ? (base_y - 1) : 10'd480;
		if(down)
			base_y <= (base_y > 10'd479) ? 10'd0 : base_y + 1;
		if(left)
			base_x <= (base_x) ? (base_x - 1) : 10'd640;
		if(right)
			base_x <= (base_x > 10'd639) ? 10'd0 : (base_x + 1);
	end
	counter <= counter + 1;
end

	
//////Color table output
img_index	img_index_inst (
	.address ( index ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw)
	);	
//////
//////latch valid data at falling edge;
assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0]; 
///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

endmodule
 	















