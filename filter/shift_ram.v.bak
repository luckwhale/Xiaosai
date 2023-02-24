module main
#(
  parameter DSIZE = 16,  //数据位宽      
  parameter CSIZE = 9	//卷积个数
 ) 
(
    input clk,
    input rst_n,

    input iValid,
    input [15:0] iData,
	 input [16*9-1:0] param,

    output oValid,
    output [15:0] result
);

wire [16*9-1:0] oData;
	 
    
filter_3X3 #(DSIZE,CSIZE) filter_in  (
	.clk(clk),
	.rst_n(rst_n),
	.iValid(iValid),
	.iData(iData),

	.oValid(oValid),
	.oData(oData)
);
	 
	 
tree #(DSIZE,CSIZE) filter_out  (
	.clk(clk),
	.rst_n(rst_n),
	.param(param),
	.oData(oData),
			
	.result(result)
);
	 
endmodule
