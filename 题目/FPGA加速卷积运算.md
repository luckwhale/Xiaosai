# FPGA 神经网络加速器的加速原理

##   基本原理

神经网络是一种基于大脑神经网络的机器学习模型。一系列节点排列在“层”中，通过操作和权重相互连接。该模型已证明在图像分类任务中取得了成功，这些任务如今具有许多应用，从自动驾驶汽车到面部识别。标准 CNN 可以具有浮点权重和特征图——这些需要大量的内存资源和计算能力来实现必要的乘法器等。

目前卷积神经网络的FPGA知加速研究主要集中在**并行计算**和**内存带宽优化**两方面，其中并行计算主要通过设计卷积层间并行、卷积内计算并行和输出通道并行3种方式来实现加速免，此类单纯的硬件并行加速方法资源占用较多、带宽需求较大，实际应用中仍需做相应的改进。内存带宽优化通常采用一些优化算法定量分析计算吞吐量和所需内存的带宽，确定最佳性能进币解决资源占用量大的问题，此类方案在不同层间需要重新配置，灵活性稍显不足。

在加速算法没计方面，一般采用通用用阵乘法算法将矩阵转换为向量，并对每个向量一对一计算，最后将向量计算结果转换为矩阵但并未减少计算量，同时又产生大量的读写需求和内存需求。

## 并行计算

基于FPGA的卷积并行加速其实有很多方法，**例如脉动阵列、加法树等操作**。本篇博客将介绍一下基于加法树的并行化设计。其实总体原理也是很简单的。如下图所示，九个叶子节点是乘法器节点，分别代表九次乘法运算（卷积核是3*3的）。在得到乘法运算结果之后，将结果传送给加法节点。为了进一步增加并行性，加法树结构采用三叉树。即，对每三个子节点进行求和。最终得到一个部分和。（参考：[CSDN博客](https://blog.csdn.net/wangbowj123/article/details/105607708?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522167680804616800213063876%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=167680804616800213063876&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduend~default-1-105607708-null-null.142^v73^insert_down4,201^v4^add_ask,239^v2^insert_chatgpt&utm_term=FPGA%20%E5%8D%B7%E7%A7%AF%E5%8A%A0%E9%80%9F&spm=1018.2226.3001.4187)）

![](C:\Users\26825\Desktop\集创赛\校内初赛\题目\picture\tree.png)

## Winograd 卷积加速算法

Winograd 算法最早是 1980 年由 Shmuel Winograd 提出的《Fast Algorithms for Convolutional Neural Networks》，当时并没有引起太大的轰动。在 CVPR 2016 会议上，Lavin 等人提出了利用 winograd 加速卷积运算，于是 Winograd 加速卷积优化在算法圈里火了一把。

  Winograd 加速卷积运算的原理简单来说就是用更多的加法计算来减少乘法计算，从而降低计算量，且不像 FFT 那样会引入复数 ，但前提是，处理器中的乘法计算的时钟周期要大于加法计算的时钟周期。

（参考：[CSDN博客](https://blog.csdn.net/weixin_42405819/article/details/120224277?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522167680905816782425680561%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=167680905816782425680561&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-1-120224277-null-null.142^v73^insert_down4,201^v4^add_ask,239^v2^insert_chatgpt&utm_term=winograd&spm=1018.2226.3001.4187)）

## 流水线切割

##  移位寄存器

<img src="C:\Users\26825\Desktop\集创赛\校内初赛\题目\picture\shift_ram.jpg" style="zoom: 25%;" />
