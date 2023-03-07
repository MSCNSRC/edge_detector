`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 06.03.2023 13:50:14
// Design Name: 
// Module Name: tb_clk
// Project Name: 
// Target Devices: BASYS 3
// Tool Versions: Vivado 2020.2
// Description: Testbench for clock generation module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_clk;
reg  r_clk_in;
wire w_clk_out;

clk_generator tb_clk	(.clk_in(r_clk_in),
						 .clk_out(w_clk_out));
always @(*)
begin
	if (r_clk_in)
		#5 r_clk_in <= 1'b0; 
	else
		#5 r_clk_in <= 1'b1;
end

initial
begin
	r_clk_in = 1'b0;
	
	repeat(200) @(posedge r_clk_in);
	$stop;

end

endmodule