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
	input reset_n,
	input adc_clk,
	input cis_clk,
	
	//------------ write parameter
	input  start_init,   //init ad para
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
	input  [8:0]cmd_offsetb2,
	//control
	input start_cis,    //open cis sample
	input [15:0] sp_para, //  cis �����ʲ��� 
	output reg ad_sload,
	output reg ad_sdata,
	output reg adc_cds,
	output reg cis_sp,
	output reg cis_wren    //���� ���ݱ�־λ
);


reg r_init_done = 1'b0;   //��ʼ�����ɱ�־ �ڳ�ʼ���� ��1
reg[3:0] r_wradr = 4'd0;  //��д��ַ
reg[5:0] r_wrbitcnt = 4'd0;   //��дBIT λ
reg[8:0] r_wr_data = 9'd0;
// ��ʼ�� AD ����
always @(negedge adc_clk)   
begin
	if(!reset_n)
		begin
			r_wr_data <= 9'd0;
		end
	else
		begin
			case (r_wradr)
			4'd0: r_wr_data <= cmd_config1;
			4'd1: r_wr_data <= cmd_mux1;
			4'd2: r_wr_data <= cmd_gaina1;
			4'd3: r_wr_data <= cmd_gainb1;
			4'd4: r_wr_data <= cmd_offseta1;
			4'd5: r_wr_data <= cmd_offsetb1;
			4'd6: r_wr_data <= cmd_config2;
			4'd7: r_wr_data <= cmd_mux2;
			4'd8: r_wr_data <= cmd_gaina2;
			4'd9: r_wr_data <= cmd_gainb2;
			4'd10: r_wr_data <= cmd_offseta2;
			4'd11: r_wr_data <= cmd_offsetb2;
			default: r_wr_data <= 0;
			endcase
		end
end


always @(negedge adc_clk)   
begin
	if(!reset_n)
		begin
			r_init_done <= 1'b0;
			ad_sload <= 1'b0;
			ad_sdata <= 1'b0;
			r_wradr <= 4'd0;
			r_wrbitcnt <= 5'd0;
			ad_sload <= 1'b1;
		end
	else if(!start_init)
		begin
			ad_sload <= 1'b1;
		end			
	else if(r_init_done)   //�Ѿ���ʼ����
		begin
			ad_sload <= 1'b1;
		end	
	else   //��ʼ������
		begin
			if(r_wradr > 4'd11)
				begin
					r_init_done <= 1'b1;	   //��ʼ������
				end
			else
				begin
					if(r_wrbitcnt < 1) //д��д����λ
						begin
							ad_sload <= 1'b0;  //��ʼ��������
							ad_sdata = 1'b1;
							r_wrbitcnt <= r_wrbitcnt+1'b1; //��һλ����
						end
					else if(r_wrbitcnt < 5) //���͵�ַ
						begin
							ad_sdata = r_wradr[4-r_wrbitcnt];
							r_wrbitcnt <= r_wrbitcnt+1'b1; //��һλ����
						end
					else if(r_wrbitcnt < 7)  //dummy
						begin
							ad_sdata  <= 0;
							r_wrbitcnt <= r_wrbitcnt+1'b1; //��һλ����
						end
					else if(r_wrbitcnt < 16)  //9 bit data
						begin
							ad_sdata  <= r_wr_data[15 - r_wrbitcnt];
							r_wrbitcnt <= r_wrbitcnt+1'b1; //��һλ����
						end
					else if(r_wrbitcnt < 20)  //dummy
						begin
							ad_sload <= 1'b1;  //������������
							r_wrbitcnt <= r_wrbitcnt+1'b1; //��һλ����
						end
					else 
						begin
							r_wrbitcnt <= 0;
							r_wradr = r_wradr + 1'b1;  //д��һ����ַ
						end
				end
		end			
end
	
		
endmodule