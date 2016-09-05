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
	input[7:0] led_para,  //LED cotrol para
	output led
);

parameter  PRE_CNT1 = 8'd250;
parameter  PRE_CNT2 = 8'd125;
parameter  PRE_CNT4 = 8'd64;
parameter  PRE_CNT8 = 8'd32;
parameter  PRE_CNT16 = 8'd16;

reg[7:0] r_ledcnt = 8'd0;

reg[7:0] r_ledprepara = 8'd0;

reg[7:0] r_cnt = 8'd0;

reg[7:0] r_flashcnt = 8'd0;





reg r_ledout = 1'b1;


assign  led = r_ledout;



reg[7:0] r_div1;
reg		r_carry1;
reg[7:0] r_div2;
reg		r_carry2;





always @(posedge clk)   //100mhz
begin
	if(!reset_n)
		begin
			r_div1 <= 8'd0;
			r_carry1 <= 1'b0;
		end
	else
		begin
			if(r_div1 < 8'd200)
				r_div1 <= r_div1+ 1'b1;
			else
				begin
					r_carry1 <= !r_carry1;   //   r_div1  100m/400 = 250k
					r_div1 <= 0;
				end
		end		
end

always @(posedge r_carry1 or negedge reset_n)
begin
	if(!reset_n)
		begin
			r_div2 <= 8'd0;
			r_carry2 <= 1'b0;
		end
	else
		begin
			if(r_div2 < 8'd250)
				r_div2 <= r_div2+ 1'b1;
			else
				begin
					r_carry2 <= !r_carry2;   //   r_div2 250k/500  500hz
					r_div2 <= 0;
				end
		end		
end


// set cnt value


always @(posedge r_carry2 or negedge reset_n)   // 500hz   500hz /500 hz
begin
	if(!reset_n)
		begin
			if(led_para[3])
					r_ledcnt =  PRE_CNT16;
				else if(led_para[2])
					r_ledcnt =  PRE_CNT8;
				else if(led_para[1])
					r_ledcnt =  PRE_CNT4;
				else if(led_para[0])
					r_ledcnt =  PRE_CNT2;
				else  // other value
					r_ledcnt = 	PRE_CNT16;	
				r_ledprepara <= led_para;
				r_flashcnt <= 8'd10;   // flash 10 time
		end
	else
		begin
			if(r_ledprepara != led_para)
				begin
					if(led_para[3])
						r_ledcnt =  PRE_CNT16;
					else if(led_para[2])
						r_ledcnt =  PRE_CNT8;
					else if(led_para[1])
						r_ledcnt =  PRE_CNT4;
					else if(led_para[0])
						r_ledcnt =  PRE_CNT2;
					else
						r_ledcnt = 	PRE_CNT16;	
					r_ledprepara <= led_para;
				end
			if(r_cnt < r_ledcnt)
				r_cnt <= r_cnt+ 1'b1;
			else 
				begin
					r_cnt <= 8'd0;
					r_ledout <= !r_ledout;
					if(r_flashcnt)
						begin
						r_flashcnt <= r_flashcnt -1'b1;
						end
					else
						begin
							r_flashcnt <= 8'd10;
							if(r_ledcnt !=  PRE_CNT1)
								r_ledcnt <= PRE_CNT1;
						end
				end
		end
	
	
end




endmodule