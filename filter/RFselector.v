module RFselector(image,rowNumber, column,receptiveField);

parameter DATA_WIDTH = 16;
parameter D = 1; //卷积核深度
parameter H = 32; //图像高度
parameter W = 32; //图像宽度
parameter F = 5; //卷积核尺寸

input [0:D*H*W*DATA_WIDTH-1] image;
input [5:0] rowNumber, column;
output reg [0:(((W-F+1)/2)*D*F*F*DATA_WIDTH)-1] receptiveField;

integer address, c, k, i;

always @ (image or rowNumber or column) begin
	address = 0;
	if (column == 0) begin
		for (c = 0; c < (W-F+1)/2; c = c + 1) begin
			for (k = 0; k < D; k = k + 1) begin
				for (i = 0; i < F; i = i + 1) begin
					receptiveField[address*F*DATA_WIDTH+:F*DATA_WIDTH] = image[rowNumber*W*DATA_WIDTH+c*DATA_WIDTH+k*H*W*DATA_WIDTH+i*W*DATA_WIDTH+:F*DATA_WIDTH];
					address = address + 1;
				end
			end
		end
	end else begin
		for (c = (W-F+1)/2; c < (W-F+1); c = c + 1) begin
			for (k = 0; k < D; k = k + 1) begin
				for (i = 0; i < F; i = i + 1) begin
					receptiveField[address*F*DATA_WIDTH+:F*DATA_WIDTH] = image[rowNumber*W*DATA_WIDTH+c*DATA_WIDTH+k*H*W*DATA_WIDTH+i*W*DATA_WIDTH+:F*DATA_WIDTH];
					address = address + 1;
				end
			end
		end
	end
	
end

endmodule
