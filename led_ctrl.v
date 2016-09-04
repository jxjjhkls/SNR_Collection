/******************************************************
*	Filename	:led_ctrl.v
*	Author		:zpstr
*	Version		:V1.0
*	Date		:2016-09-04
*	Copyright (c) 2015 zpstr All rights reserved.
*History:
	v1.0:  2016-09-04
******************************************************/
module led_ctrl(
	input reset_n,
	input clk,
	input[7:0] led_para  //LED cotrol para
)

reg[7:0] r_div1;
reg		r_carry1;
reg[7:0] r_div2;
reg		r_carry2;
reg[7:0] r_div3;
reg		r_carry3;
reg[7:0] r_div4;
reg		r_carry4;

always @(posedge clk)
begin
	if(!reset_n)
		begin
			r_div1 <= 8'd0;
			r_carry1 <= 1'b0;
		end
	else
		begin
			if(r_div1 < 8'd100)
				r_div1 <= r_div1+ 1'b1;
			else
				begin
					r_carry1 <= !r_carry1;   //   r_div1 50M/100 500K
					r_div1 <= 0;
				end
		end		
end

always @(posedge r_carry1)
begin
	if(!reset_n)
		begin
			r_div2 <= 8'd0;
			r_carry2 <= 1'b0;
		end
	else
		begin
			if(r_div2 < 8'd100)
				r_div2 <= r_div2+ 1'b1;
			else
				begin
					r_carry2 <= !r_carry2;   //   r_div2 500K/100  5K
					r_div2 <= 0;
				end
		end		
end

always @(posedge r_carry2)
begin
	if(!reset_n)
		begin
			r_div3 <= 8'd0;
			r_carry3 <= 1'b0;
		end
	else
		begin
			if(r_div3 < 8'd100)
				r_div3 <= r_div3+ 1'b1;
			else
				begin
					r_carry3 <= !r_carry3;   //   r_div3  5K/100 = 50HZ
					r_div3 <= 0;
				end
		end		
end

always @(posedge r_carry3)
begin
	
end




endmodule