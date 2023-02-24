module integrationConv (clk,reset,CNNinput,Conv,ConvOutput);

parameter DATA_WIDTH = 16;
parameter ImgInW = 32;
parameter ImgInH = 32;
parameter ConvOut = 28;
parameter Kernel = 5;
parameter DepthC = 6;


input clk, reset;
input [ImgInW*ImgInH*DATA_WIDTH-1:0] CNNinput;
input [Kernel*Kernel*DepthC*DATA_WIDTH-1:0] Conv;
output [ConvOut*ConvOut*DepthC*DATA_WIDTH-1:0] ConvOutput;

convLayerMulti C1
(
	.clk(clk),
	.reset(reset),
	.image(CNNinput),
	.filters(Conv),
	.outputConv(ConvOutput)
);

endmodule
