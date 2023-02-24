module pE_tree
#(
parameter DATA_WIDTH = 16,  //数据宽度，float16
parameter F = 3 //卷积核大小
)
(
	input clk,
	input rst_n,
	input [DATA_WIDTH*F*F-1:0] param,
	
	input [DATA_WIDTH*F*F-1:0] oData,
	output [DATA_WIDTH-1 : 0]result
);



reg [DATA_WIDTH -1: 0] result_reg;				//输出结果
wire [DATA_WIDTH -1:0] mult_w [F*F-1:0];     //乘法结果暂存

wire [DATA_WIDTH-1 : 0] adder_w3 [2 : 0];	//加法结果暂存

//重复例化乘法模块
genvar i;
generate
	for(i = 0; i < F*F; i = i + 1)
	begin: floatMult16_level3
		floatMult16
		u_floatMult16(
			.clk(clk),
			.rst_n(rst_n),
			.floatA(oData[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH]),
			.floatB(param[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH]),
			.product(mult_w[i])
		);
	end 

endgenerate

genvar j;
generate
	for(j = 0; j < 3; j = j + 1)
	begin: floatAdd16_input3_level2
		floatAdd16_input3
		u_floatAdd16_input3(
			.clk(clk),
			.rst_n(rst_n),
			.floatA(mult_w[j * F + 0]),
			.floatB(mult_w[j * F + 1]),
			.floatC(mult_w[j * F + 2]),
			.sum(adder_w3[j])
		);
	end
endgenerate

floatAdd16_input3
		floatAdd16_input3_level1(
			.clk(clk),
			.rst_n(rst_n),
			.floatA(adder_w3[0]),
			.floatB(adder_w3[1]),
			.floatC(adder_w3[2]),
			.sum(result)
		);


endmodule
