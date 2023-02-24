library verilog;
use verilog.vl_types.all;
entity line_shift_ram is
    port(
        clken           : in     vl_logic;
        clock           : in     vl_logic;
        shiftin         : in     vl_logic_vector(15 downto 0);
        shiftout        : out    vl_logic_vector(15 downto 0);
        taps0x          : out    vl_logic_vector(15 downto 0);
        taps1x          : out    vl_logic_vector(15 downto 0)
    );
end line_shift_ram;
