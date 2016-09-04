/******************************************************
*	Filename	:SNR_Collection.v
*	Author		:zpstr
*	Version		:V1.0
*	Date		:2016-09-04
*	Copyright (c) 2015 zpstr All rights reserved.
*History:
	v1.0:  2016-09-04
******************************************************/


`timescale 1 ns/ 1 ps
module SNR_Collection(
	input emif_clk,dsp_reset,
	output dsp_int,
	// emif buf
	input emif_a21,emif_a22,emif_re,emif_ce,emif_we,
	output emif_oe,
	inout[31:0] emif_data,
	
	
	//ad control
	output cis_sp,cis_clk,   //10mhz
	
	output adc_cds,adc_clk,  //20mhz
	
	output ad1_sclk,ad1_sdata,ad1_sload,
	input[7:0] ad1_data,
	
	output ad2_sclk,ad2_sdata,ad2_sload,
	input[7:0] ad2_data,

	
	output ctrl_led,
	output ea23,
	output led1,

	
	//test point
	output fpga_gpio1,fpga_gpio2,fpga_gpio4,
	output   fpga_gpio3
);
assign ea23 =1'b1;



// clk module
assign ad1_sclk = adc_clk;
assign ad2_sclk = adc_clk;

assign fpga_gpio1 = cis_clk;
assign fpga_gpio3 = adc_clk;


clk clk_inst(
	.clk_in 	(emif_clk),
	.rest_n  	(dsp_reset),
	.clk_25M    (adc_clk),
	.clk_10M	(cis_clk)
);






/*
assign led1 = cout;
assign ctrl_led = sum;


reg sum,cout; 
reg m1,m2,m3; 
always @(fpga_gpio1 or fpga_gpio2 or  fpga_gpio3) 
begin 
sum <= (fpga_gpio1 ^ fpga_gpio2) ^ fpga_gpio3; 
m1 <= sum; 
cout <= m1|sum; 
end 
*/

endmodule