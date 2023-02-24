library verilog;
use verilog.vl_types.all;
entity convUnit_by_shift is
    generic(
        DATA_WIDTH      : integer := 16;
        D               : integer := 3;
        F               : integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        iValid          : in     vl_logic;
        iData1          : in     vl_logic_vector;
        iData2          : in     vl_logic_vector;
        iData3          : in     vl_logic_vector;
        param1          : in     vl_logic_vector;
        param2          : in     vl_logic_vector;
        param3          : in     vl_logic_vector;
        oValid          : out    vl_logic;
        out_valid       : out    vl_logic_vector;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of F : constant is 1;
end convUnit_by_shift;
