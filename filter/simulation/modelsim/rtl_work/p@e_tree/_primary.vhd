library verilog;
use verilog.vl_types.all;
entity pE_tree is
    generic(
        DATA_WIDTH      : integer := 16;
        F               : integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        param           : in     vl_logic_vector;
        oData           : in     vl_logic_vector;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of F : constant is 1;
end pE_tree;
