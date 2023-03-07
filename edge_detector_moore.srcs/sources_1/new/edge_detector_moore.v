`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 06.03.2023 13:50:14
// Design Name: 
// Module Name: edge_detector_moore
// Project Name: 
// Target Devices: BASYS 3
// Tool Versions: Vivado 2020.2
// Description: Edge detector based on moore state machine
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module edge_detector_moore
(
	input  wire       clk, reset,
	input  wire       pin_in    ,
	output reg [1:0]  pin_out   ,
	output wire       clk_led
);

localparam 	input_1_bekle      = 2'b00,
			input_1_tamamlandi = 2'b01,
			input_0_bekle      = 2'b10,
			input_0_tamamlandi = 2'b11;
			
reg [1:0] state_reg, state_next;

wire clk_gen;

assign clk_led = clk_gen;


clk_generator clk	(.clk_in (clk),
					 .clk_out(clk_gen));

always @(*)
begin
	state_next = 2'b00;
	pin_out    = 2'b00;
	
	case (state_reg)
	
	    input_1_bekle:
	    begin
	    	pin_out = 2'b00;
			if (pin_in)
				state_next = input_1_tamamlandi;
			else
				state_next = input_1_bekle;
			
	    end
		
		input_1_tamamlandi:
		begin
			pin_out = 2'b01;
			if (pin_in)
				state_next = input_0_bekle;	
			else
				state_next = input_0_tamamlandi;
		end
		
		input_0_bekle:
		begin
			pin_out = 2'b00;
			if (pin_in)
				state_next = input_0_bekle;
			else
				state_next = input_0_tamamlandi;
		end
		
		input_0_tamamlandi:
		begin
			pin_out = 2'b10;
			if (pin_in)
				state_next = input_1_tamamlandi;
			else
				state_next = input_1_bekle;
		end
	
	endcase

end

always @(posedge clk_gen, posedge reset)
begin
	if (reset)
		state_reg <= input_1_bekle;
	else
		state_reg <= state_next;
end




endmodule
