module pE16(clk,reset,floatA,floatB,result);

parameter DATA_WIDTH = 16;  // 数据类型float16

input clk, reset;
input [DATA_WIDTH-1:0] floatA, floatB; // 输入float16数据A和B
output reg [DATA_WIDTH-1:0] result;  // 输出float16数据

wire [DATA_WIDTH-1:0] multResult;
wire [DATA_WIDTH-1:0] addResult;

floatMult16 FM (floatA,floatB,multResult); // float16乘法运算
floatAdd16 FADD (multResult,result,addResult);// float16加法运算

always @ (posedge clk or posedge reset) begin
	if (reset == 1'b1) begin
		result = 0;    // 开始时，result赋值为0
	end else begin
		result = addResult;  // 求和结果不断更新为result，即为累加操作，result作为最后的输出
	end
end

endmodule
