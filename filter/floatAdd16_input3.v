module floatAdd16_input3 (clk,rst_n,floatA,floatB,floatC,sum);

input clk;
input rst_n;

input [15:0] floatA, floatB, floatC;  	// 输入为两个float16数据A和B
output reg [15:0] sum;   		// 输出为float16数据

wire [15:0] temp_sum1,temp_sum2;

floatAdd16	add1(
			.floatA(floatA),
			.floatB(floatB),
			.sum(temp_sum1)
		);

floatAdd16	add2(
			.floatA(floatC),
			.floatB(temp_sum1),
			.sum(temp_sum2)
		);	
	
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n)
		sum <= 0;
	else
		sum <= temp_sum2;
end	

endmodule
