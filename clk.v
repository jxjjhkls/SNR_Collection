/******************************************************
*	Filename	:clk.v
*	Author		:zpstr
*	Version		:V1.0
*	Date		:2016-09-04
*	Copyright (c) 2015 zpstr All rights reserved.
*History:
	v1.0:  2016-09-04
******************************************************/
`timescale 1 ns/ 1 ps
module clk(
	input reset_n,
	input clk_in,
	output clk_25M,
	output clk_10M
);
parameter PRE_25M = 8'd4/2-1;
parameter PRE_10M = 8'd10/2-1;


reg	carry_25M;
reg[7:0]  divider_25M;


reg carry_10M;
reg[7:0]  divider_10M;

assign clk_25M = carry_25M;
assign clk_10M = carry_10M;

always @(posedge clk_in)
begin
	if(!reset_n)
		begin    // reg init
		carry_25M <= 1'b0;
		divider_25M <= 8'b0;
		carry_10M <= 1'b0;
		divider_10M <= 8'b0;
		end
	else
		begin
			// 20 M proc
			if(divider_25M == PRE_25M)
				begin
					carry_25M <= !carry_25M;
					divider_25M = 8'b0;
				end
			else
				divider_25M <= divider_25M+1'd1;	
			//10 M proc	
			if(divider_10M == PRE_10M)
				begin
					carry_10M <= !carry_10M;
					divider_10M = 8'b0;
				end
			else
				divider_10M <= divider_10M+1'd1;				
		end
end
	


endmodule
