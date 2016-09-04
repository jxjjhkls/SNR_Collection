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
	output clk_ad,
	output clk_cis
);
parameter PRE_CNT = 8'd5;

reg	r_carryad_pos = 1'b0;
reg[7:0] r_dividercnt_pos = 8'b0;

reg	r_carryad_neg = 1'b0;
reg[7:0] r_dividercnt_neg = 8'b0;

reg	r_carrycis = 1'b0;

assign clk_ad = r_carryad_pos | r_carryad_neg;
assign clk_cis = r_carrycis;

always @(posedge clk_in)
begin
	if(!reset_n)
		begin    // reg init
		r_carryad_pos <= 1'b0;
		r_dividercnt_pos <= 8'b0;
		end
	else
		begin
			// 20 M proc
			if(r_dividercnt_pos == (PRE_CNT -1)/2)
				begin
					r_carryad_pos <= !r_carryad_pos;
					r_dividercnt_pos <= r_dividercnt_pos+1'd1;	
				end
			else if(r_dividercnt_pos < (PRE_CNT -1))
				begin 
					r_dividercnt_pos <= r_dividercnt_pos+1'd1;	
				end		
			else 
				begin
					r_carryad_pos <= !r_carryad_pos;
					r_dividercnt_pos <= 8'b0;
				end	
		end
end
	

always @(negedge clk_in)
begin
	if(!reset_n)
		begin    // reg init
		r_carryad_neg <= 1'b0;
		r_dividercnt_neg <= 8'b0;
		end
	else
		begin
			// 20 M proc
			if(r_dividercnt_neg == (PRE_CNT -1)/2)
				begin
					r_carryad_neg <= !r_carryad_neg;
					r_dividercnt_neg <= r_dividercnt_neg+1'd1;	
				end
			else if(r_dividercnt_neg < (PRE_CNT -1))
				begin 
					r_dividercnt_neg <= r_dividercnt_neg+1'd1;	
				end		
			else 
				begin
					r_carryad_neg <= !r_carryad_neg;
					r_dividercnt_neg <= 8'b0;
				end	
		end
end


always @(posedge clk_ad)
begin
	if(!reset_n)
		begin
			r_carrycis <= 0;
		end
	else
		r_carrycis <= !r_carrycis;
end


endmodule
