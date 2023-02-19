library verilog;
use verilog.vl_types.all;
entity filter_3X3 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        iValid          : in     vl_logic;
        iData           : in     vl_logic_vector(7 downto 0);
        oValid          : out    vl_logic;
        oData_11        : out    vl_logic_vector(7 downto 0);
        oData_12        : out    vl_logic_vector(7 downto 0);
        oData_13        : out    vl_logic_vector(7 downto 0);
        oData_21        : out    vl_logic_vector(7 downto 0);
        oData_22        : out    vl_logic_vector(7 downto 0);
        oData_23        : out    vl_logic_vector(7 downto 0);
        oData_31        : out    vl_logic_vector(7 downto 0);
        oData_32        : out    vl_logic_vector(7 downto 0);
        oData_33        : out    vl_logic_vector(7 downto 0)
    );
end filter_3X3;
