`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 06.03.2023 13:50:14
// Design Name: 
// Module Name: clk_generator
// Project Name: 
// Target Devices: BASYS 3
// Tool Versions: Vivado 2020.2
// Description: Clock signal generation for 100 MHz to 1 sec
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_generator
#(parameter N = 100000000)
(
	input  wire clk_in,
	output reg  clk_out = 1'b0
);

reg [31:0] clk_reg = 32'd0;

always @(posedge clk_in)
begin
	
	if (clk_reg == N)
	begin
		clk_out = ~clk_out;
		clk_reg = 32'd0;
	end
	
	else
	begin
		clk_reg = clk_reg + 1;
		clk_out = clk_out;
	end

end


endmodule
