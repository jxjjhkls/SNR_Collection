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
assign ad1_sload = ad2_sload;
assign ad1_sdata = ad2_sdata;
assign fpga_gpio1 = cis_clk;
assign fpga_gpio3 = adc_clk;

// ad control


wire w_start_init;   //���ʼ����
wire w_start_cis;   // ��ʼ���ݲ���  0: ������  1: ����
wire w_cis_wren;  // ��������0�� ����������Ч��ʼ
wire[15:0] w_sp_para;   //cis  �����ʲ���
wire  [8:0]w_cmd_config1;
wire  [8:0]w_cmd_mux1;
wire  [8:0]w_cmd_gaina1;
wire  [8:0]w_cmd_gainb1;
wire  [8:0]w_cmd_offseta1;
wire  [8:0]w_cmd_offsetb1;
wire  [8:0]w_cmd_config2;
wire  [8:0]w_cmd_mux2;
wire  [8:0]w_cmd_gaina2;
wire  [8:0]w_cmd_gainb2;
wire  [8:0]w_cmd_offseta2;
wire  [8:0]w_cmd_offsetb2;



clk clk_inst(
	.reset_n  	(dsp_reset),
	.clk_in 	(emif_clk),    //100mhz
	.clk_25M    (adc_clk),    // 20mhz
	.clk_10M	(cis_clk)    //  10mhz
);


// ad control
adc_ctrl adc_ctrl_inst(
	.reset_n	(dsp_reset),
	.adc_clk	(adc_clk),
	.cis_clk	(cis_clk),
	.start_init (w_start_init),
	.cmd_config1	(w_cmd_config1),  
	.cmd_mux1	(w_cmd_mux1),  
	.cmd_gaina1 	(w_cmd_gaina1),  
	.cmd_gainb1		(w_cmd_gainb1),  
	.cmd_offseta1	(w_cmd_offseta1),  
	.cmd_offsetb1	(w_cmd_offsetb1),  
	.cmd_config2	(w_cmd_config2),  
	.cmd_mux2	(w_cmd_mux2),  
	.cmd_gaina2	(w_cmd_gaina2),  
	.cmd_gainb2	(w_cmd_gainb2),  
	.cmd_offseta2	(w_cmd_offseta2),  
	.cmd_offsetb2	(w_cmd_offsetb2), 
	.sp_para 		(w_sp_para),  
	.start_cis		(w_start_cis),
	.ad_sload		(ad2_sload),
	.ad_sdata		(ad2_sdata),
	.adc_cds		(adc_cds),
	.cis_sp			(cis_sp),
	.cis_wren		(w_cis_wren)    // 1: ��Ч����   0����Ч����
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