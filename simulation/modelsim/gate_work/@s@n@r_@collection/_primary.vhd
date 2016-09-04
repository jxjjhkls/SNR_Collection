library verilog;
use verilog.vl_types.all;
entity SNR_Collection is
    port(
        dsp_100mclk     : in     vl_logic;
        dsp_reset       : in     vl_logic;
        dsp_int         : out    vl_logic;
        emif_a21        : in     vl_logic;
        emif_a22        : in     vl_logic;
        emif_data       : out    vl_logic_vector(31 downto 0);
        cis_sp          : out    vl_logic;
        cis_clk         : out    vl_logic;
        adc_cds         : out    vl_logic;
        adc_clk         : out    vl_logic;
        ad1_sclk        : out    vl_logic;
        ad1_sdata       : out    vl_logic;
        ad1_sload       : out    vl_logic;
        ad1_data        : in     vl_logic_vector(7 downto 0);
        ad2_sclk        : out    vl_logic;
        ad2_sdata       : out    vl_logic;
        ad2_sload       : out    vl_logic;
        ad2_data        : in     vl_logic_vector(7 downto 0);
        ctrl_led        : out    vl_logic;
        ea23            : out    vl_logic;
        led1            : out    vl_logic;
        fpga_gpio2      : out    vl_logic;
        fpga_gpio3      : out    vl_logic;
        fpga_gpio4      : out    vl_logic
    );
end SNR_Collection;
