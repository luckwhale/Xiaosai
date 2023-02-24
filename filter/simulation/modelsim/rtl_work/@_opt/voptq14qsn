library verilog;
use verilog.vl_types.all;
entity shift_ram is
    generic(
        DATA_WIDTH      : integer := 16;
        F               : integer := 3;
        IMG_WIDTH       : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        iValid          : in     vl_logic;
        iData           : in     vl_logic_vector;
        oValid          : out    vl_logic;
        oData           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of F : constant is 1;
    attribute mti_svvh_generic_type of IMG_WIDTH : constant is 1;
end shift_ram;
