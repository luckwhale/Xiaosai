module add3 (floatA,floatB,floatC,sum);
	
input  [15:0] floatA, floatB, floatC;  // 输入float16数据A和B
output [15:0] sum;   // 输出为float16数据sum

wire [15:0] temp_sum;

floatAdd16 A1 (floatA,floatB,temp_sum); // float16乘法运算
floatAdd16 A2 (floatC,temp_sum,sum); // float16乘法运算

endmodule
