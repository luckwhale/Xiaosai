library verilog;
use verilog.vl_types.all;
entity convUnit_by_shift_vlg_tst is
    generic(
        DELAY           : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DELAY : constant is 1;
end convUnit_by_shift_vlg_tst;
