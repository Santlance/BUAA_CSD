`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:36 12/06/2018 
// Design Name: 
// Module Name:    mips 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////



/************************************************************/
//加指令要加的define    CONTROLLER    DECODER    HAZARDUNIT/////
/************************************************************/

/************************************************************/
//构造MUX或者更改MUX时注意改输出是C还是E                         //
/************************************************************/


//共有19处命名与接口连线不同的地方
//14处是.CLK(clk) 和 .Reset(reset)
//M级寄存器：  .RTV_E(WriteData_E) 要写入内存的数据应该是经过转发选择后的数据，而不是直接从E级寄存器来  
//W级寄存器：	 .ReadData_M(MemOut) 读出内存的数据是DM的输出
//冲突单元：	 .A3_E(WriteRd_E) 由于我是在E级才进行的写入寄存器的选择，所以传入冲入单元的E级写地址应该是经过选择后的，而不是直接来自E级寄存器
//冲突单元：   .A3_M(RD_M) M级写地址已经经过选择了，故可以直接来自M级寄存器
//冲突单元：   .A3_W(RD_W) W级写地址已经经过选择了，故可以直接来自W级寄存器

//能进行写入操作的指令只有两类，一类对GRF，一类对DM（STORE指令）
//对DM写入的数据只能是来自 RTV
//对GRF写入的数据可以是 ALUOutput PC+8 ReadData（内存读的值）

//几个特殊处理
//D级产生了RegWrite信号之后流水
//E级选择了写入寄存器的地址信号，rt rd 31，之后流水&传给冲突单元
//E级选择了ALUOutput，把对31进行写入操作的PC+8传入了ALUOutput，这样PC+8就和31一起在寄存器中流水了，不用另外增添针对31和PC+8的转发输入
//W级选择了写入寄存器的数据，是ALUOutput 还是 ReadData 还是（PC+8）实质上未更改


//对指令的数据通路及控制信号进行分类,
//加指令的话按照步骤来：一数据通路 二暂停机制 三转发机制，而且对于暂停和转发机制的话，分为是写寄存器的还是需要寄存器的
//即考虑 顶层连线 + 控制信号 + 冲突单元

//Bclass		只到D级
//cal_r		只到W级
//cal_i		只到W级
//Jclass		只到D级
//load		只到W级
//store 		只到M级
//jal			只到W级

module mips(
	input clk,
	input reset
    );
	 wire Stall, PCSel, RegWrite_W, RegWrite_D, RegWrite_E, RegWrite_M, ForwardRTM, Busy, Start;
	 wire [1:0] ForwardRSD, ForwardRTD, ForwardRSE, ForwardRTE;
	 wire [4:0] RD_W,RS_E, RT_E, RD_E, WriteRd_E,RD_M;
	 wire [31:0] NPCOut, Instr_F, PCPlus4_F, Instr_D, PCPlus4_D, MUXRFWDOut, ALUOutput_M, EXTOut, RSV_D, RTV_D,
					 Instr_E, PCPlus4_E, RSV_E, RTV_E, EXTOut_E, ALUOutput, WriteData_E, Instr_M, RTV_M,
					 PCPlus4_M, MemOut, Instr_W, ReadData_W, PCPlus4_W, ALUOutput_W;
//////////////////////////////////////////////////////////////////////////////////
//F级部件
//IM 指令存储单元					//Bclass  cal_r  cal_i  Jclass  load  store  jal
//IFU 取指令单元						//Bclass  cal_r  cal_i  Jclass  load  store  jal
//MUXPC 选择下一条PC值的多选器		//Bclass  Jclass  jal



	PIPELINE_F pipeline_f(
	.CLK(clk),  						   //输人来自MIPS模块的时钟信号，控制IFU的时钟周期                  /**/
	.Reset(reset),   					   //输入来自MIPS模块的复位信号，控制IFU是否清空							 /**/
	.Stall(Stall),  					  	//输入来自冲突单元的暂停信号，控制IFU是否暂停
	.PCSel(PCSel),    					//输入来自D级部件（D级控制器）的下一条PC的选择信号，选择IFU下一个值
	.NPCOut(NPCOut),						//输入来自D级部件（D级NPC）下一条PC可能的值，输入来自D级的跳转指令的IFU的下一个值
	
	.Instr_F(Instr_F),  					//输出F级的指令        To：D级寄存器
	.PCPlus4_F(PCPlus4_F)				//输出F级的PC+4		   To：D级寄存器
	);
	
//F级部件产生指令和PC+4

//////////////////////////////////////////////////////////////////////////////////	
//D级寄存器	
	REGISTER_D register_d(
   .Instr_F(Instr_F),  					//输入来自F级部件（IM）的指令
	.PCPlus4_F(PCPlus4_F),  			//输入来自F级部件（IFU）的PC++4
	.CLK(clk),  							//输入来自MIPS模块的时钟信号											 /**/
	.Stall(Stall),  						//输入来自冲突单元的暂停信号
	.Reset(reset),							//输入来自MIPS模块的复位信号											 /**/
   
	.Instr_D(Instr_D),  					//输出D级的指令		To： D级部件 E级寄存器 冲突单元
	.PCPlus4_D(PCPlus4_D)				//输出D级的PC+4		To： D级部件 E级寄存器	
	);
//D级寄存器产生D级的指令和PC+4

//////////////////////////////////////////////////////////////////////////////////	
//D级部件
//GRF	寄存器堆									//Bclass  cal_r  cal_i  load  store  jal
//EXT	符号扩展器									//cal_i  load  store
//NPC	PC计算选择器								//Bclass  Jclass	jal
//CMP	比较器										//Bclass  
//CONTROLLER_D	D级控制器						//Bclass  cal_r  cal_i  Jclass  load  store  jal
//MFRSD	转发指令在D级要读取的GRFRD1的值		//Bclass  cal_r  cal_i  load  store
//MFRTD	转发指令在D级要读取的GRFRD2的值		//Bclass  cal_r  load  store

	PIPELINE_D pipeline_d(
	.CLK(clk),  							//输入来自MIPS模块的时钟信号												 /**/
	.Reset(reset),  						//输入来自MIPS模块的复位信号												 /**/
	.RegWrite_W(RegWrite_W),  			//输入来自W级寄存器的写入信号，控制是否写入寄存器堆
	.RD_W(RD_W),  							//输入来自W级寄存器的写入地址，决定写入的地址
	.Instr_D(Instr_D),  					//输入来自D级寄存器的指令
	.MUXRFWDOut(MUXRFWDOut),			//输入来自W级部件（MUXRFWD）的写入数据，暨转发所需
	.PCPlus4_D(PCPlus4_D),  			//输入来自D级寄存器的PC+4
	.ALUOutput_M(ALUOutput_M),  		//输入来自M级寄存器的ALU输出，转发所需
	.ForwardRSD(ForwardRSD),  			//输入来自冲突单元的RS转发控制信号
	.ForwardRTD(ForwardRTD),			//输入来自冲突单元的RT转发控制信号
	.PCPlus4_W(PCPlus4_W),				//输入来自W级寄存器的PC+4，是用来输出display的
	
	.EXTOut(EXTOut),  					//输出立即数扩展结果				To： E级寄存器
	.NPCOut(NPCOut),  					//输出下一条可能的PC值			To： F级部件
	.PCSel(PCSel),  						//输出PC选择信号					To： F级部件
	.RegWrite_D(RegWrite_D),  			//输出D级指令的写信号，在D级就提前产生写信号，之后在流水线中传输 		To： E级寄存器
	.RSV_D(RSV_D),  						//输出GRFRD1		To： E级寄存器
	.RTV_D(RTV_D)							//输出GRFRD2		To： E级寄存器
	);
//D级部件产生 立即数扩展结果 跳转指令后PC的值 PC选择信号 D级指令写信号 寄存器两个读取的值

//////////////////////////////////////////////////////////////////////////////////	
//E级寄存器
	REGISTER_E register_e(
	.CLK(clk),  							//输入来自MIPS模块的时钟信号													 /**/
	.Reset(reset),  						//输入来自MIPS模块的复位信号													 /**/
	.FlushE(Stall),  						//输入来自冲突单元的暂停信号，实质上是清空信号，相当于插入NOP
	.Instr_D(Instr_D),  					//输入来自D级寄存器的指令
	.PCPlus4_D(PCPlus4_D),  			//输入来自D级寄存器的PC+4
	.RSV_D(RSV_D),  						//输入来自D级部件（MFRSD）的GRFRD1
	.RTV_D(RTV_D),							//输入来自D级部件（MFRTD）的GRFRD2
	.EXTOut_D(EXTOut),  					//输入来自D级部件（EXT）的扩展数
	.RegWrite_D(RegWrite_D),  			//输入来自D级部件（CONTROLLER_D）的写信号
	.RS_D(Instr_D[25:21]),  			//输入来自D级寄存器的指令的读寄存器地址1
	.RT_D(Instr_D[20:16]),  			//输入来自D级寄存器的指令的读寄存器地址2
	.RD_D(Instr_D[15:11]),				//输入来自D级寄存器的指令的写寄存器地址
	
	.Instr_E(Instr_E),  					//输出E级的指令		To： E级部件 M级寄存器 冲突单元
	.PCPlus4_E(PCPlus4_E),  			//输出E级的PC+4		To： E级部件 M级寄存器
	.RSV_E(RSV_E),  						//输出E级的GRFRD1	To： E级部件
	.RTV_E(RTV_E),  						//输出E级的GRFRD2	To： E级部件 		/*store类型要用这个值存储，但是得经过E级部件选择*/
	.EXTOut_E(EXTOut_E),  				//输出E级的扩展数		To： E级部件
	.RegWrite_E(RegWrite_E), 			//输出E级的写入信号	To： M级寄存器 冲突单元
	.RS_E(RS_E),  							//输出E级指令的读寄存器地址1		To： 没啥用，不管了，实际上它的作用在E级部件中被Instr_E代替了
	.RT_E(RT_E),  							//输出E级指令的读寄存器地址2		To： 没啥用，不管了，实际上它的作用在E级部件中被Instr_E代替了
	.RD_E(RD_E)								//输出E级指令的写寄存器地址		To： 没啥用，不管了，实际上它的作用在E级部件中被Instr_E代替了
	);
//////////////////////////////////////////////////////////////////////////////////	
//E级部件		
//ALU 算术逻辑运算单元																		//cal_r  cal_i  load  store									
//CONTROLLER_E E级控制器																	//cal_r  cal_i  load  store  jal

//MUXALUOutput 选择ALU的输出，															//cal_r  cal_i  load  store  jal
//用来区分一般的对寄存器进行算术操作的指令和对31号寄存器进行操作的指令的输出

//MUXRDE 选择真正的写入寄存器的地址，应该将其输出连接至冲突单元，不然E级的写地址会错误//cal_r  cal_i  load  store  jal
//MUXALUB 选择ALU的第二个操作数是寄存器数还是立即数										//cal_r  cal_i  load  store
//MFRSE 选择ALU的第一个操作数的转发														//cal_r  cal_i  load  store
//MFRTE 选择ALU的第二个操作数的转发														//cal_r  cal_i  load  store

	PIPELINE_E pipeline_e(
	.CLK(clk),								//输入时钟信号
	.Reset(reset),							//输入复位信号
	.Instr_E(Instr_E),					//输入来自E级寄存器的指令  
	.RTV_E(RTV_E),  						//输入来自E级寄存器的GRFRD2
	.RSV_E(RSV_E),  						//输入来自E级寄存器的GRFRD1
	.EXTOut_E(EXTOut_E),  				//输入来自E级寄存器的扩展数
	.MUXRFWDOut(MUXRFWDOut),  			//输入来自W级部件（MUXRFWD）的写入数据，转发所需
	.ALUOutput_M(ALUOutput_M),  		//输入来自M级寄存器的ALU输出，转发所需
	.ForwardRSE(ForwardRSE),  			//输入来自冲突单元的RSE控制信号
	.ForwardRTE(ForwardRTE),			//输入来自冲突单元的RTE控制信号
	.PCPlus4_E(PCPlus4_E),				//输入来自E级寄存器的PC+4，为对31号寄存器进行jal类操作的数准备
	
	.Start(Start),							//输出乘除模块启动信号		To： 冲突单元
	.Busy(Busy),							//输出乘除模块繁忙信号      To： 冲突单元
	.ALUOutput(ALUOutput),  			//输出ALU的运算结果			To： M级寄存器
	.WriteRd_E(WriteRd_E),  			//输出真正的E级的写入地址   To： M级寄存器 					/*真正的经过的选择后的写入地址在E级确定*/
	.WriteData_E(WriteData_E)			//输出要写入内存的数据，应该来自经过转发MFRTE选择器选择的数据	To： M级寄存器
	);
//E级部件产生 ALU的运算结果 E级的真正的写入地址 E级的真正的写入数据

//////////////////////////////////////////////////////////////////////////////////	
//M级寄存器
	REGISTER_M register_m(
	.CLK(clk),  							//输入来自MIPS模块的时钟信号										/**/
	.Reset(reset),  						//输入来自MIPS模块的复位信号										/**/
	.Instr_E(Instr_E),  					//输入来自E级寄存器的指令
	.RTV_E(WriteData_E),					//输入来自E级部件（MFRTE）的内存写入数据            	/**/		/*此处应为来自E级部件的输出，而不是来自E级寄存器的值*/  
	.PCPlus4_E(PCPlus4_E),  			//输入来自E级寄存器的PC+4	
	.ALUOutput_E(ALUOutput), 			//输入来自E级部件（MUXALUOutput）的ALU运算结果
	.RegWrite_E(RegWrite_E),  			//输入来自E级寄存器的写信号
	.WriteRd_E(WriteRd_E),				//输入来自E级部件（MUXRDE）的真正的写寄存器地址
	
	.RegWrite_M(RegWrite_M),  			//输出M级的写信号		To： W级寄存器 冲突单元
	.Instr_M(Instr_M),  					//输出M级的指令		To： M级部件 W级寄存器 冲突单元
	.RTV_M(RTV_M),  						//输出M级的写入数据	To： M级部件 
	.PCPlus4_M(PCPlus4_M),  			//输出M级的PC+4		To： M级部件 W级寄存器
	.ALUOutput_M(ALUOutput_M),  		//输出M级的ALU运算结果	To： D级部件 E级部件 M级部件 W级寄存器
	.RD_M(RD_M)								//输出M级的写寄存器地址	To： W级寄存器 冲突单元
	);
//////////////////////////////////////////////////////////////////////////////////	
//M级部件
//DM 内存单元													//load  store 
//CONTROLLER_M	M级控制器 									//load  store
//MFRTM 选择写入寄存器的值的转发							//store
//如果添加LH LB SH SB之类的指令，在此加两个MUX即可		//load store

	PIPELINE_M pipeline_m(
	.CLK(clk),  							//输入来自MIPS模块的时钟信号				/**/
	.Reset(reset),  						//输入来自MIPS模块的复位信号				/**/
	.ALUOutput_M(ALUOutput_M),			//输入来自M级寄存器的的ALU输出  作为存取内存的地址
	.RTV_M(RTV_M),  						//输入来自M级寄存器的写入数据，这也是经过E级转发选择后的数据
	.Instr_M(Instr_M),  					//输入来自M级寄存器的指令
	.ForwardRTM(ForwardRTM),			//输入来自冲突单元的RT转发控制信号
	.PCPlus4_M(PCPlus4_M),  			//输入来自M级寄存器的PC+4	display所用
	.MUXRFWDOut(MUXRFWDOut),			//输入来自W级部件（MUXRFWD）写数据，转发所需
	
	.MemOut(MemOut)       				//输出内存读数据	To： W级寄存器
	);
//M级部件产生 内存读数据	

//////////////////////////////////////////////////////////////////////////////////	
//W级寄存器
	REGISTER_W register_w(
	.CLK(clk),  							//输入来自MIPS模块的时钟信号			/**/
	.Reset(reset),  						//输入来自MIPS模块的复位信号			/**/
	.Instr_M(Instr_M),  					//输入来自M级寄存器的指令
	.PCPlus4_M(PCPlus4_M),  			//输入来自M级寄存器的PC+4
	.ALUOutput_M(ALUOutput_M),			//输入来自M级寄存器的ALU运算结果  
	.ReadData_M(MemOut),  				//输入来自M级部件（DM）的内存读数据  						/**/			/*此处输入MemOut*/
	.RD_M(RD_M), 							//输入来自M级寄存器的写寄存器地址 
	.RegWrite_M(RegWrite_M),			//输入来自M级寄存器的写寄存器数据
	
	.Instr_W(Instr_W),  					//输出W级的指令			To： W级部件 冲突单元
	.PCPlus4_W(PCPlus4_W),  			//输出W级的PC+4			To： W级部件
	.ALUOutput_W(ALUOutput_W),  		//输出W级的ALU运算结果	To： W级部件
	.ReadData_W(ReadData_W),  			//输出W级的内存读数据		To： W级部件
	.RD_W(RD_W),  							//输出W级的寄存器写地址	To： D级部件 冲突单元
	.RegWrite_W(RegWrite_W)				//输出W级的寄存器写信号	To： D级部件 冲突单元
	);
//////////////////////////////////////////////////////////////////////////////////	
//W级部件
//CONTROLLER_W W级的控制器		//cal_r  cal_i  load  jal
//MUXRFWD 选择真正的写入数据		//cal_r  cal_i  load  jal
//GRF 理论上存在的写入寄存器堆

	PIPELINE_W pipeline_w(
	.Instr_W(Instr_W),					//输入来自W级寄存器的指令  
	.ReadData_W(ReadData_W),  			//输入来自W级寄存器的内存读数据
	.ALUOutput_W(ALUOutput_W),			//输入来自W级寄存器的ALU运算结果
	.PCPlus4_W(PCPlus4_W),				//输入来自W级寄存器的PC+4
	
	.MUXRFWDOut(MUXRFWDOut)				//输出寄存器要写入的数据			To： D级部件 E级部件 M级部件		/*决定真正要写入的数据是在W级*/
	);
//W级部件产生 写入寄存器的值

//////////////////////////////////////////////////////////////////////////////////
//冲突单元										//Bclass  cal_r  cal_i  Jclass  load  store  jal
	HAZARDUNIT hazardunit(
   .Instr_D(Instr_D), 					//输入来自D级寄存器的指令
	.Instr_E(Instr_E),  					//输入来自E级寄存器的指令
	.Instr_M(Instr_M),  					//输入来自M级寄存器的指令
	.Instr_W(Instr_W),  					//输入来自W级寄存器的指令
	.RegWrite_E(RegWrite_E),  			//输入来自E级寄存器的写信号
	.RegWrite_M(RegWrite_M),  			//输入来自M级寄存器的写信号										/*之前连线出错，连到了E级的写信号*/
	.RegWrite_W(RegWrite_W), 			//输入来自W级寄存器的写信号 
	.A3_E(WriteRd_E),						//输入来自E级寄存器的写地址			/**/			/*由于我的设计像7.58那样，是在E级处理RegDst的，所以得传入MUX后的RD_E */ 
	.A3_M(RD_M),							//输入来自M级寄存器的写地址			/**/
	.A3_W(RD_W),							//输入来自W级寄存器的写地址			/**/
	.Busy(Busy),							//输入来自E级部件的繁忙信号
	.Start(Start),							//输入来自E级部件的启动信号
		
	.Stall(Stall),							//输出暂停信号 			To： F级部件 D级寄存器 E级寄存器
	.ForwardRSD(ForwardRSD),  			//输出RSD转发信号		To： D级部件
	.ForwardRTD(ForwardRTD),  			//输出RTD转发信号		To： D级部件
	.ForwardRSE(ForwardRSE),  			//输出RSE转发信号		To： E级部件
	.ForwardRTE(ForwardRTE), 			//输出RTE转发信号		To： E级部件
	.ForwardRTM(ForwardRTM)				//输出RTM转发信号		To： M级部件
	);
endmodule
