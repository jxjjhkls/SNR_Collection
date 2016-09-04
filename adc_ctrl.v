/******************************************************
*	Filename	:adc_ctrl.v
*	Author		:zpstr
*	Version		:V1.0
*	Date		:2016-09-04
*	Copyright (c) 2015 zpstr All rights reserved.
*History:
	v1.0:  2016-09-04
******************************************************/
`timescale 1 ns/ 1 ps

module adc_ctrl(
	input rest_n,adc_clk,cis_clk,
	//------------ write parameter
	input  wrpara_eable;   //write para eable 
	input  [8:0]cmd_config1,
	input  [8:0]cmd_mux1,
	input  [8:0]cmd_gaina1,
	input  [8:0]cmd_gainb1,
	input  [8:0]cmd_offseta1,
	input  [8:0]cmd_offsetb1,
	input  [8:0]cmd_config2,
	input  [8:0]cmd_mux2,
	input  [8:0]cmd_gaina2,
	input  [8:0]cmd_gainb2,
	input  [8:0]cmd_offseta2,
	input  [8:0]cmd_offsetb2
	
	//control
	input sp_eable;    //open cis sample
	
	out   

)