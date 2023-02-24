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
	 
	 input [DATA_WIDTH*F*F-1:0] param1,
	 input [DATA_WIDTH*F*F-1:0] param2,
	 input [DATA_WIDTH*F*F-1:0] param3,
	 

    output reg oValid,
    output [DATA_WIDTH-1:0] result
);

wire [DATA_WIDTH*F*F-1:0] oData [D-1:0];
wire [DATA_WIDTH*F*F-1:0] param [D-1:0];
wire [DATA_WIDTH-1:0] temp_result [D-1:0];
wire [DATA_WIDTH-1:0] iData [D-1:0];

reg [15:0] counter;
wire [D-1:0] oValid_temp;

assign iData[0] = iData1;
assign iData[1] = iData2;
assign iData[2] = iData3;

assign param[0] = param1;
assign param[1] = param2;
assign param[2] = param3;


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
			
				.oValid(oValid_temp[j]),
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
		
    // oVaild
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            counter <=  16'b0;
				oValid  <=  0;
			end
        else if (oValid_temp[0]==1&&oValid_temp[1]==1&&oValid_temp[2]==1&&counter<3) 
            counter <= counter + 1;
		  else if (counter>=3)
				oValid <=   1;

	 end
endmodule
