module filter_3x3(
    input clk,
    input rst_n,

    input iValid,
    input [7:0] iData,

    output oValid,
    output reg [7:0] oData_11, oData_12, oData_13,
    output reg [7:0] oData_21, oData_22, oData_23,
    output reg [7:0] oData_31, oData_32, oData_33
);
    reg [7:0] row3_data;
    wire [7:0] row2_data;
    wire [7:0] row1_data;
    reg [1:0] Valid_shift;
    
    // shift_ram实现2行缓存
    line_shift_ram inst_line_shift_ram(
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
        if(!rst_n)
            Valid_shift <=  2'b00;
        else
            Valid_shift <= {Valid_shift[0], iValid};
    end

    assign oValid = Valid_shift[1];
endmodule
