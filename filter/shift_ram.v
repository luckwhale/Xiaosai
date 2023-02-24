module shift_ram
#(
		parameter DATA_WIDTH = 16,  //数据宽度，float16
		parameter F = 3, //卷积核大小
		parameter IMG_WIDTH = 8
)
(
    input clk,
    input rst_n,

    input iValid,
    input [DATA_WIDTH-1:0] iData,

    output reg oValid,
	 
	 //测试使用
//	   output reg [DATA_WIDTH-1:0] oData_11, oData_12, oData_13,
//    output reg [DATA_WIDTH-1:0] oData_21, oData_22, oData_23,
//    output reg [DATA_WIDTH-1:0] oData_31, oData_32, oData_33,
	 
    output [DATA_WIDTH*F*F-1:0]oData
);



	 //存储的中间变量
    reg  [DATA_WIDTH-1:0] row3_data;
    wire [DATA_WIDTH-1:0] row2_data;
    wire [DATA_WIDTH-1:0] row1_data;
	 //中间变量
    reg  [15:0] Valid_shift;
	 //移位输出
	 reg [DATA_WIDTH-1:0] oData_11, oData_12, oData_13;
    reg [DATA_WIDTH-1:0] oData_21, oData_22, oData_23;
    reg [DATA_WIDTH-1:0] oData_31, oData_32, oData_33;
	 
	 assign oData = {oData_11, oData_12, oData_13,oData_21, oData_22, oData_23,oData_31, oData_32, oData_33};
    
    // shift_ram实现2行缓存
    line_shift_ram line_shift_ram(
        .clock    (clk),
        .clken    (iValid),
        .shiftin  (row3_data),
        .taps0x   (row2_data),
        .taps1x   (row1_data),
        .shiftout ()
    );
	 

    // 将输入数据寄存作为窗口第三行起始数据，同时也作为行缓存的输入
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            row3_data <= 0;
        else if(iValid)
            row3_data <= iData;
    end

    // 获取3x3卷积模板
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            {oData_11, oData_12, oData_13} <= 3'b000;
            {oData_21, oData_22, oData_23} <= 3'b000;
            {oData_31, oData_32, oData_33} <= 3'b000;
        end else if(iValid) begin
            {oData_11, oData_12, oData_13} <= {oData_12, oData_13, row1_data};
            {oData_21, oData_22, oData_23} <= {oData_22, oData_23, row2_data};
            {oData_31, oData_32, oData_33} <= {oData_32, oData_33, row3_data};
        end
    end

    // iValid打两拍输出
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            Valid_shift <=  16'b0;
				oValid = 1'b0;
			end
        else if (Valid_shift<IMG_WIDTH*2+F)
            Valid_shift <= Valid_shift+iValid;
		  else 
				oValid <= 1'b1;
    end
endmodule
