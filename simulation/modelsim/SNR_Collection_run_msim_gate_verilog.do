transcript on
vmap altera_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/altera_ver
vmap cycloneive_ver E:/zpstr/Device/SNR_Collection/simulation/modelsim/verilog_libs/cycloneive_ver
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {SNR_Collection.vo}

vlog -vlog01compat -work work +incdir+E:/zpstr/Device/SNR_Collection/simulation/modelsim {E:/zpstr/Device/SNR_Collection/simulation/modelsim/SNR_Collection.vt}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  SNR_Collection_vlg_tst

add wave *
view structure
view signals
run -all
