module convUnit_by_shift
#(
 parameter DATA_WIDTH = 16,  //数据宽度，float16
 parameter D = 3, //卷积核深度
 parameter F = 3 //卷积核大小
 ) 
(
    input clk,
    input rst_n,

    input iValid,
    input [DATA_WIDTH-1:0] iData1,
	 input [DATA_WIDTH-1:0] iData2,
	 input [DATA_WIDTH-1:0] iData3,
	 
	 input [DATA_WIDTH*F*F*D-1:0] param,

    output [D-1:0] oValid,
    output [DATA_WIDTH-1:0] result
);

wire [DATA_WIDTH*F*F-1:0] oData [D-1:0];
wire [DATA_WIDTH-1:0] temp_result [D-1:0];
wire [DATA_WIDTH-1:0] iData [D-1:0];
assign iData[0] = iData1;
assign iData[1] = iData2;
assign iData[2] = iData3;

genvar j;
generate
	for(j = 0; j < 3; j = j + 1)
	begin: shift_rams
		shift_ram
		u_shift_ram(
				.clk(clk),
				.rst_n(rst_n),

				.iValid(iValid),
				.iData(iData[j]),
			
				.oValid(oValid[j]),
				.oData(oData[j])
		);
	end
endgenerate
 


genvar i;
generate
	for(i = 0; i < 3; i = i + 1)
	begin: pE_trees
		pE_tree
		u_pE_tree(
			.clk(clk),
			.rst_n(rst_n),
			.param(param[i]),
	
			.oData(oData[i]),
			.result(temp_result[i])
		);
	end
endgenerate

floatAdd16_input3
		floatAdd16_input3_sum(
			.clk(clk),
			.rst_n(rst_n),
			.floatA(temp_result[0]),
			.floatB(temp_result[1]),
			.floatC(temp_result[2]),
			.sum(result)
		);

	 
endmodule
