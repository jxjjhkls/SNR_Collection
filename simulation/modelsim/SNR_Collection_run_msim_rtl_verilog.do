transcript on
vmap altera_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/altera_ver
vmap lpm_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/lpm_ver
vmap sgate_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/sgate_ver
vmap altera_mf_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/altera_mf_ver
vmap altera_lnsim_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/altera_lnsim_ver
vmap cycloneive_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/cycloneive_ver
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/zpstr/Device/SNR_Collection {E:/zpstr/Device/SNR_Collection/SNR_Collection.v}

vlog -vlog01compat -work work +incdir+E:/zpstr/Device/SNR_Collection/simulation/modelsim {E:/zpstr/Device/SNR_Collection/simulation/modelsim/SNR_Collection.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  SNR_Collection_vlg_tst

add wave *
view structure
view signals
run -all
