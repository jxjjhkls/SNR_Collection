library verilog;
use verilog.vl_types.all;
entity altera_cyclonev_pll is
    generic(
        number_of_counters: integer := 9;
        number_of_fplls : integer := 1;
        number_of_extclks: integer := 2;
        number_of_dlls  : integer := 1;
        number_of_lvds  : integer := 2;
        pll_auto_clk_sw_en_0: string  := "false";
        pll_clk_loss_edge_0: string  := "both_edges";
        pll_clk_loss_sw_en_0: string  := "false";
        pll_clk_sw_dly_0: integer := 0;
        pll_clkin_0_src_0: string  := "clk_0";
        pll_clkin_1_src_0: string  := "clk_0";
        pll_manu_clk_sw_en_0: string  := "false";
        pll_sw_refclk_src_0: string  := "clk_0";
        pll_auto_clk_sw_en_1: string  := "false";
        pll_clk_loss_edge_1: string  := "both_edges";
        pll_clk_loss_sw_en_1: string  := "false";
        pll_clk_sw_dly_1: integer := 0;
        pll_clkin_0_src_1: string  := "clk_1";
        pll_clkin_1_src_1: string  := "clk_1";
        pll_manu_clk_sw_en_1: string  := "false";
        pll_sw_refclk_src_1: string  := "clk_1";
        pll_output_clock_frequency_0: string  := "700.0 MHz";
        reference_clock_frequency_0: string  := "700.0 MHz";
        mimic_fbclk_type_0: string  := "gclk";
        dsm_accumulator_reset_value_0: integer := 0;
        forcelock_0     : string  := "false";
        nreset_invert_0 : string  := "false";
        pll_atb_0       : integer := 0;
        pll_bwctrl_0    : integer := 1000;
        pll_cmp_buf_dly_0: string  := "0 ps";
        pll_cp_comp_0   : string  := "true";
        pll_cp_current_0: integer := 20;
        pll_ctrl_override_setting_0: string  := "true";
        pll_dsm_dither_0: string  := "disable";
        pll_dsm_out_sel_0: string  := "disable";
        pll_dsm_reset_0 : string  := "false";
        pll_ecn_bypass_0: string  := "false";
        pll_ecn_test_en_0: string  := "false";
        pll_enable_0    : string  := "true";
        pll_fbclk_mux_1_0: string  := "fb";
        pll_fbclk_mux_2_0: string  := "m_cnt";
        pll_fractional_carry_out_0: integer := 24;
        pll_fractional_division_0: integer := 1;
        pll_fractional_value_ready_0: string  := "true";
        pll_lf_testen_0 : string  := "false";
        pll_lock_fltr_cfg_0: integer := 25;
        pll_lock_fltr_test_0: string  := "false";
        pll_m_cnt_bypass_en_0: string  := "false";
        pll_m_cnt_coarse_dly_0: string  := "0 ps";
        pll_m_cnt_fine_dly_0: string  := "0 ps";
        pll_m_cnt_hi_div_0: integer := 3;
        pll_m_cnt_in_src_0: string  := "ph_mux_clk";
        pll_m_cnt_lo_div_0: integer := 3;
        pll_m_cnt_odd_div_duty_en_0: string  := "false";
        pll_m_cnt_ph_mux_prst_0: integer := 0;
        pll_m_cnt_prst_0: integer := 256;
        pll_n_cnt_bypass_en_0: string  := "true";
        pll_n_cnt_coarse_dly_0: string  := "0 ps";
        pll_n_cnt_fine_dly_0: string  := "0 ps";
        pll_n_cnt_hi_div_0: integer := 1;
        pll_n_cnt_lo_div_0: integer := 1;
        pll_n_cnt_odd_div_duty_en_0: string  := "false";
        pll_ref_buf_dly_0: string  := "0 ps";
        pll_reg_boost_0 : integer := 0;
        pll_regulator_bypass_0: string  := "false";
        pll_ripplecap_ctrl_0: integer := 0;
        pll_slf_rst_0   : string  := "false";
        pll_tclk_mux_en_0: string  := "false";
        pll_tclk_sel_0  : string  := "n_src";
        pll_test_enable_0: string  := "false";
        pll_testdn_enable_0: string  := "false";
        pll_testup_enable_0: string  := "false";
        pll_unlock_fltr_cfg_0: integer := 1;
        pll_vco_div_0   : integer := 0;
        pll_vco_ph0_en_0: string  := "true";
        pll_vco_ph1_en_0: string  := "true";
        pll_vco_ph2_en_0: string  := "true";
        pll_vco_ph3_en_0: string  := "true";
        pll_vco_ph4_en_0: string  := "true";
        pll_vco_ph5_en_0: string  := "true";
        pll_vco_ph6_en_0: string  := "true";
        pll_vco_ph7_en_0: string  := "true";
        pll_vctrl_test_voltage_0: integer := 750;
        vccd0g_atb_0    : string  := "disable";
        vccd0g_output_0 : integer := 0;
        vccd1g_atb_0    : string  := "disable";
        vccd1g_output_0 : integer := 0;
        vccm1g_tap_0    : integer := 2;
        vccr_pd_0       : string  := "false";
        vcodiv_override_0: string  := "false";
        sim_use_fast_model_0: string  := "false";
        output_clock_frequency_0: string  := "100.0 MHz";
        enable_output_counter_0: string  := "true";
        phase_shift_0   : string  := "0 ps";
        duty_cycle_0    : integer := 50;
        c_cnt_coarse_dly_0: string  := "0 ps";
        c_cnt_fine_dly_0: string  := "0 ps";
        c_cnt_in_src_0  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_0: integer := 0;
        c_cnt_prst_0    : integer := 1;
        cnt_fpll_src_0  : string  := "fpll_0";
        dprio0_cnt_bypass_en_0: string  := "true";
        dprio0_cnt_hi_div_0: integer := 3;
        dprio0_cnt_lo_div_0: integer := 3;
        dprio0_cnt_odd_div_even_duty_en_0: string  := "false";
        dprio1_cnt_bypass_en_0: vl_notype;
        dprio1_cnt_hi_div_0: vl_notype;
        dprio1_cnt_lo_div_0: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_0: vl_notype;
        output_clock_frequency_1: string  := "0 ps";
        enable_output_counter_1: string  := "true";
        phase_shift_1   : string  := "0 ps";
        duty_cycle_1    : integer := 50;
        c_cnt_coarse_dly_1: string  := "0 ps";
        c_cnt_fine_dly_1: string  := "0 ps";
        c_cnt_in_src_1  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_1: integer := 0;
        c_cnt_prst_1    : integer := 1;
        cnt_fpll_src_1  : string  := "fpll_0";
        dprio0_cnt_bypass_en_1: string  := "true";
        dprio0_cnt_hi_div_1: integer := 2;
        dprio0_cnt_lo_div_1: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_1: string  := "true";
        dprio1_cnt_bypass_en_1: vl_notype;
        dprio1_cnt_hi_div_1: vl_notype;
        dprio1_cnt_lo_div_1: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_1: vl_notype;
        output_clock_frequency_2: string  := "0 ps";
        enable_output_counter_2: string  := "true";
        phase_shift_2   : string  := "0 ps";
        duty_cycle_2    : integer := 50;
        c_cnt_coarse_dly_2: string  := "0 ps";
        c_cnt_fine_dly_2: string  := "0 ps";
        c_cnt_in_src_2  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_2: integer := 0;
        c_cnt_prst_2    : integer := 1;
        cnt_fpll_src_2  : string  := "fpll_0";
        dprio0_cnt_bypass_en_2: string  := "true";
        dprio0_cnt_hi_div_2: integer := 1;
        dprio0_cnt_lo_div_2: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_2: string  := "false";
        dprio1_cnt_bypass_en_2: vl_notype;
        dprio1_cnt_hi_div_2: vl_notype;
        dprio1_cnt_lo_div_2: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_2: vl_notype;
        output_clock_frequency_3: string  := "0 ps";
        enable_output_counter_3: string  := "true";
        phase_shift_3   : string  := "0 ps";
        duty_cycle_3    : integer := 50;
        c_cnt_coarse_dly_3: string  := "0 ps";
        c_cnt_fine_dly_3: string  := "0 ps";
        c_cnt_in_src_3  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_3: integer := 0;
        c_cnt_prst_3    : integer := 1;
        cnt_fpll_src_3  : string  := "fpll_0";
        dprio0_cnt_bypass_en_3: string  := "false";
        dprio0_cnt_hi_div_3: integer := 1;
        dprio0_cnt_lo_div_3: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_3: string  := "false";
        dprio1_cnt_bypass_en_3: vl_notype;
        dprio1_cnt_hi_div_3: vl_notype;
        dprio1_cnt_lo_div_3: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_3: vl_notype;
        output_clock_frequency_4: string  := "0 ps";
        enable_output_counter_4: string  := "true";
        phase_shift_4   : string  := "0 ps";
        duty_cycle_4    : integer := 50;
        c_cnt_coarse_dly_4: string  := "0 ps";
        c_cnt_fine_dly_4: string  := "0 ps";
        c_cnt_in_src_4  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_4: integer := 0;
        c_cnt_prst_4    : integer := 1;
        cnt_fpll_src_4  : string  := "fpll_0";
        dprio0_cnt_bypass_en_4: string  := "false";
        dprio0_cnt_hi_div_4: integer := 1;
        dprio0_cnt_lo_div_4: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_4: string  := "false";
        dprio1_cnt_bypass_en_4: vl_notype;
        dprio1_cnt_hi_div_4: vl_notype;
        dprio1_cnt_lo_div_4: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_4: vl_notype;
        output_clock_frequency_5: string  := "0 ps";
        enable_output_counter_5: string  := "true";
        phase_shift_5   : string  := "0 ps";
        duty_cycle_5    : integer := 50;
        c_cnt_coarse_dly_5: string  := "0 ps";
        c_cnt_fine_dly_5: string  := "0 ps";
        c_cnt_in_src_5  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_5: integer := 0;
        c_cnt_prst_5    : integer := 1;
        cnt_fpll_src_5  : string  := "fpll_0";
        dprio0_cnt_bypass_en_5: string  := "false";
        dprio0_cnt_hi_div_5: integer := 1;
        dprio0_cnt_lo_div_5: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_5: string  := "false";
        dprio1_cnt_bypass_en_5: vl_notype;
        dprio1_cnt_hi_div_5: vl_notype;
        dprio1_cnt_lo_div_5: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_5: vl_notype;
        output_clock_frequency_6: string  := "0 ps";
        enable_output_counter_6: string  := "true";
        phase_shift_6   : string  := "0 ps";
        duty_cycle_6    : integer := 50;
        c_cnt_coarse_dly_6: string  := "0 ps";
        c_cnt_fine_dly_6: string  := "0 ps";
        c_cnt_in_src_6  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_6: integer := 0;
        c_cnt_prst_6    : integer := 1;
        cnt_fpll_src_6  : string  := "fpll_0";
        dprio0_cnt_bypass_en_6: string  := "false";
        dprio0_cnt_hi_div_6: integer := 1;
        dprio0_cnt_lo_div_6: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_6: string  := "false";
        dprio1_cnt_bypass_en_6: vl_notype;
        dprio1_cnt_hi_div_6: vl_notype;
        dprio1_cnt_lo_div_6: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_6: vl_notype;
        output_clock_frequency_7: string  := "0 ps";
        enable_output_counter_7: string  := "true";
        phase_shift_7   : string  := "0 ps";
        duty_cycle_7    : integer := 50;
        c_cnt_coarse_dly_7: string  := "0 ps";
        c_cnt_fine_dly_7: string  := "0 ps";
        c_cnt_in_src_7  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_7: integer := 0;
        c_cnt_prst_7    : integer := 1;
        cnt_fpll_src_7  : string  := "fpll_0";
        dprio0_cnt_bypass_en_7: string  := "false";
        dprio0_cnt_hi_div_7: integer := 1;
        dprio0_cnt_lo_div_7: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_7: string  := "false";
        dprio1_cnt_bypass_en_7: vl_notype;
        dprio1_cnt_hi_div_7: vl_notype;
        dprio1_cnt_lo_div_7: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_7: vl_notype;
        output_clock_frequency_8: string  := "0 ps";
        enable_output_counter_8: string  := "true";
        phase_shift_8   : string  := "0 ps";
        duty_cycle_8    : integer := 50;
        c_cnt_coarse_dly_8: string  := "0 ps";
        c_cnt_fine_dly_8: string  := "0 ps";
        c_cnt_in_src_8  : string  := "ph_mux_clk";
        c_cnt_ph_mux_prst_8: integer := 0;
        c_cnt_prst_8    : integer := 1;
        cnt_fpll_src_8  : string  := "fpll_0";
        dprio0_cnt_bypass_en_8: string  := "false";
        dprio0_cnt_hi_div_8: integer := 1;
        dprio0_cnt_lo_div_8: integer := 1;
        dprio0_cnt_odd_div_even_duty_en_8: string  := "false";
        dprio1_cnt_bypass_en_8: vl_notype;
        dprio1_cnt_hi_div_8: vl_notype;
        dprio1_cnt_lo_div_8: vl_notype;
        dprio1_cnt_odd_div_even_duty_en_8: vl_notype;
        dpa_output_clock_frequency_0: string  := "0 ps";
        pll_vcoph_div_0 : integer := 1;
        enable_extclk_output_0: string  := "false";
        pll_extclk_cnt_src_0: string  := "vss";
        pll_extclk_enable_0: string  := "true";
        pll_extclk_invert_0: string  := "false";
        enable_extclk_output_1: string  := "false";
        pll_extclk_cnt_src_1: string  := "vss";
        pll_extclk_enable_1: string  := "true";
        pll_extclk_invert_1: string  := "false";
        enable_dll_output_0: string  := "false";
        pll_dll_src_value_0: string  := "vss";
        enable_lvds_output_0: string  := "false";
        pll_loaden_coarse_dly_0: string  := "0 ps";
        pll_loaden_enable_disable_0: string  := "true";
        pll_loaden_fine_dly_0: string  := "0 ps";
        pll_lvdsclk_coarse_dly_0: string  := "0 ps";
        pll_lvdsclk_enable_disable_0: string  := "true";
        pll_lvdsclk_fine_dly_0: string  := "0 ps";
        enable_lvds_output_1: string  := "false";
        pll_loaden_coarse_dly_1: string  := "0 ps";
        pll_loaden_enable_disable_1: string  := "true";
        pll_loaden_fine_dly_1: string  := "0 ps";
        pll_lvdsclk_coarse_dly_1: string  := "0 ps";
        pll_lvdsclk_enable_disable_1: string  := "true";
        pll_lvdsclk_fine_dly_1: string  := "0 ps"
    );
    port(
        phout_0         : out    vl_logic_vector(7 downto 0);
        adjpllin        : in     vl_logic_vector;
        cclk            : in     vl_logic_vector;
        coreclkin       : in     vl_logic_vector;
        extswitch       : in     vl_logic_vector;
        iqtxrxclkin     : in     vl_logic_vector;
        plliqclkin      : in     vl_logic_vector;
        rxiqclkin       : in     vl_logic_vector;
        clkin           : in     vl_logic_vector(3 downto 0);
        refiqclk_0      : in     vl_logic_vector(1 downto 0);
        refiqclk_1      : in     vl_logic_vector(1 downto 0);
        clk0bad         : out    vl_logic_vector;
        clk1bad         : out    vl_logic_vector;
        pllclksel       : out    vl_logic_vector;
        atpgmode        : in     vl_logic_vector;
        clk             : in     vl_logic_vector;
        fpllcsrtest     : in     vl_logic_vector;
        iocsrclkin      : in     vl_logic_vector;
        iocsrdatain     : in     vl_logic_vector;
        iocsren         : in     vl_logic_vector;
        iocsrrstn       : in     vl_logic_vector;
        mdiodis         : in     vl_logic_vector;
        phaseen         : in     vl_logic_vector;
        read            : in     vl_logic_vector;
        rstn            : in     vl_logic_vector;
        scanen          : in     vl_logic_vector;
        sershiftload    : in     vl_logic_vector;
        shiftdonei      : in     vl_logic_vector;
        updn            : in     vl_logic_vector;
        write           : in     vl_logic_vector;
        addr_0          : in     vl_logic_vector(5 downto 0);
        byteen_0        : in     vl_logic_vector(1 downto 0);
        cntsel_0        : in     vl_logic_vector(4 downto 0);
        din_0           : in     vl_logic_vector(15 downto 0);
        blockselect     : out    vl_logic_vector;
        iocsrdataout    : out    vl_logic_vector;
        iocsrenbuf      : out    vl_logic_vector;
        iocsrrstnbuf    : out    vl_logic_vector;
        phasedone       : out    vl_logic_vector;
        dout_0          : out    vl_logic_vector(15 downto 0);
        dprioout_0      : out    vl_logic_vector(815 downto 0);
        fbclkfpll       : in     vl_logic_vector;
        lvdfbin         : in     vl_logic_vector;
        nresync         : in     vl_logic_vector;
        pfden           : in     vl_logic_vector;
        shiften_fpll    : in     vl_logic_vector;
        zdb             : in     vl_logic_vector;
        fblvdsout       : out    vl_logic_vector;
        lock            : out    vl_logic_vector;
        mcntout         : out    vl_logic_vector;
        plniotribuf     : out    vl_logic_vector;
        clken           : in     vl_logic_vector;
        extclk          : out    vl_logic_vector;
        dll_clkin       : in     vl_logic_vector;
        clkout          : out    vl_logic_vector;
        loaden          : out    vl_logic_vector;
        lvdsclk         : out    vl_logic_vector;
        divclk          : out    vl_logic_vector;
        cascade_out     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_counters : constant is 1;
    attribute mti_svvh_generic_type of number_of_fplls : constant is 1;
    attribute mti_svvh_generic_type of number_of_extclks : constant is 1;
    attribute mti_svvh_generic_type of number_of_dlls : constant is 1;
    attribute mti_svvh_generic_type of number_of_lvds : constant is 1;
    attribute mti_svvh_generic_type of pll_auto_clk_sw_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_clk_loss_edge_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_clk_loss_sw_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_clk_sw_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_clkin_0_src_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_clkin_1_src_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_manu_clk_sw_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_sw_refclk_src_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_auto_clk_sw_en_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_clk_loss_edge_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_clk_loss_sw_en_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_clk_sw_dly_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_clkin_0_src_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_clkin_1_src_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_manu_clk_sw_en_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_sw_refclk_src_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_output_clock_frequency_0 : constant is 1;
    attribute mti_svvh_generic_type of reference_clock_frequency_0 : constant is 1;
    attribute mti_svvh_generic_type of mimic_fbclk_type_0 : constant is 1;
    attribute mti_svvh_generic_type of dsm_accumulator_reset_value_0 : constant is 1;
    attribute mti_svvh_generic_type of forcelock_0 : constant is 1;
    attribute mti_svvh_generic_type of nreset_invert_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_atb_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_bwctrl_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_cmp_buf_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_cp_comp_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_cp_current_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_ctrl_override_setting_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_dsm_dither_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_dsm_out_sel_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_dsm_reset_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_ecn_bypass_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_ecn_test_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_enable_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_fbclk_mux_1_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_fbclk_mux_2_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_fractional_carry_out_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_fractional_division_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_fractional_value_ready_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_lf_testen_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_lock_fltr_cfg_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_lock_fltr_test_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_bypass_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_coarse_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_fine_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_hi_div_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_in_src_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_lo_div_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_odd_div_duty_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_ph_mux_prst_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_m_cnt_prst_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_n_cnt_bypass_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_n_cnt_coarse_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_n_cnt_fine_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_n_cnt_hi_div_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_n_cnt_lo_div_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_n_cnt_odd_div_duty_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_ref_buf_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_reg_boost_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_regulator_bypass_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_ripplecap_ctrl_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_slf_rst_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_tclk_mux_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_tclk_sel_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_test_enable_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_testdn_enable_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_testup_enable_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_unlock_fltr_cfg_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_div_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph0_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph1_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph2_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph3_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph4_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph5_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph6_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vco_ph7_en_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vctrl_test_voltage_0 : constant is 1;
    attribute mti_svvh_generic_type of vccd0g_atb_0 : constant is 1;
    attribute mti_svvh_generic_type of vccd0g_output_0 : constant is 1;
    attribute mti_svvh_generic_type of vccd1g_atb_0 : constant is 1;
    attribute mti_svvh_generic_type of vccd1g_output_0 : constant is 1;
    attribute mti_svvh_generic_type of vccm1g_tap_0 : constant is 1;
    attribute mti_svvh_generic_type of vccr_pd_0 : constant is 1;
    attribute mti_svvh_generic_type of vcodiv_override_0 : constant is 1;
    attribute mti_svvh_generic_type of sim_use_fast_model_0 : constant is 1;
    attribute mti_svvh_generic_type of output_clock_frequency_0 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_0 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_0 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_0 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_0 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_0 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_0 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_0 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_0 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_0 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_0 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_0 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_0 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_0 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_0 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_0 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_1 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_1 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_1 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_1 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_1 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_1 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_1 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_1 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_1 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_1 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_1 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_1 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_1 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_1 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_1 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_1 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_1 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_1 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_2 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_2 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_2 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_2 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_2 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_2 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_2 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_2 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_2 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_2 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_2 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_2 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_2 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_2 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_2 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_2 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_2 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_2 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_3 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_3 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_3 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_3 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_3 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_3 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_3 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_3 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_3 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_3 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_3 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_3 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_3 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_3 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_3 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_3 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_3 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_3 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_4 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_4 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_4 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_4 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_4 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_4 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_4 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_4 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_4 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_4 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_4 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_4 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_4 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_4 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_4 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_4 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_4 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_4 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_5 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_5 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_5 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_5 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_5 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_5 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_5 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_5 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_5 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_5 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_5 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_5 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_5 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_5 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_5 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_5 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_5 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_5 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_6 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_6 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_6 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_6 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_6 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_6 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_6 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_6 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_6 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_6 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_6 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_6 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_6 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_6 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_6 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_6 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_6 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_6 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_7 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_7 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_7 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_7 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_7 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_7 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_7 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_7 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_7 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_7 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_7 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_7 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_7 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_7 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_7 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_7 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_7 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_7 : constant is 3;
    attribute mti_svvh_generic_type of output_clock_frequency_8 : constant is 1;
    attribute mti_svvh_generic_type of enable_output_counter_8 : constant is 1;
    attribute mti_svvh_generic_type of phase_shift_8 : constant is 1;
    attribute mti_svvh_generic_type of duty_cycle_8 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_coarse_dly_8 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_fine_dly_8 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_in_src_8 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_ph_mux_prst_8 : constant is 1;
    attribute mti_svvh_generic_type of c_cnt_prst_8 : constant is 1;
    attribute mti_svvh_generic_type of cnt_fpll_src_8 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_bypass_en_8 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_hi_div_8 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_lo_div_8 : constant is 1;
    attribute mti_svvh_generic_type of dprio0_cnt_odd_div_even_duty_en_8 : constant is 1;
    attribute mti_svvh_generic_type of dprio1_cnt_bypass_en_8 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_hi_div_8 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_lo_div_8 : constant is 3;
    attribute mti_svvh_generic_type of dprio1_cnt_odd_div_even_duty_en_8 : constant is 3;
    attribute mti_svvh_generic_type of dpa_output_clock_frequency_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_vcoph_div_0 : constant is 1;
    attribute mti_svvh_generic_type of enable_extclk_output_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_extclk_cnt_src_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_extclk_enable_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_extclk_invert_0 : constant is 1;
    attribute mti_svvh_generic_type of enable_extclk_output_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_extclk_cnt_src_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_extclk_enable_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_extclk_invert_1 : constant is 1;
    attribute mti_svvh_generic_type of enable_dll_output_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_dll_src_value_0 : constant is 1;
    attribute mti_svvh_generic_type of enable_lvds_output_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_loaden_coarse_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_loaden_enable_disable_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_loaden_fine_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_lvdsclk_coarse_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_lvdsclk_enable_disable_0 : constant is 1;
    attribute mti_svvh_generic_type of pll_lvdsclk_fine_dly_0 : constant is 1;
    attribute mti_svvh_generic_type of enable_lvds_output_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_loaden_coarse_dly_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_loaden_enable_disable_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_loaden_fine_dly_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_lvdsclk_coarse_dly_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_lvdsclk_enable_disable_1 : constant is 1;
    attribute mti_svvh_generic_type of pll_lvdsclk_fine_dly_1 : constant is 1;
end altera_cyclonev_pll;
