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
//��ָ��Ҫ�ӵ�define    CONTROLLER    DECODER    HAZARDUNIT/////
/************************************************************/

/************************************************************/
//����MUX���߸���MUXʱע��������C����E                         //
/************************************************************/


//����19��������ӿ����߲�ͬ�ĵط�
//14����.CLK(clk) �� .Reset(reset)
//M���Ĵ�����  .RTV_E(WriteData_E) Ҫд���ڴ������Ӧ���Ǿ���ת��ѡ�������ݣ�������ֱ�Ӵ�E���Ĵ�����  
//W���Ĵ�����	 .ReadData_M(MemOut) �����ڴ��������DM�����
//��ͻ��Ԫ��	 .A3_E(WriteRd_E) ����������E���Ž��е�д��Ĵ�����ѡ�����Դ�����뵥Ԫ��E��д��ַӦ���Ǿ���ѡ���ģ�������ֱ������E���Ĵ���
//��ͻ��Ԫ��   .A3_M(RD_M) M��д��ַ�Ѿ�����ѡ���ˣ��ʿ���ֱ������M���Ĵ���
//��ͻ��Ԫ��   .A3_W(RD_W) W��д��ַ�Ѿ�����ѡ���ˣ��ʿ���ֱ������W���Ĵ���

//�ܽ���д�������ָ��ֻ�����࣬һ���GRF��һ���DM��STOREָ�
//��DMд�������ֻ�������� RTV
//��GRFд������ݿ����� ALUOutput PC+8 ReadData���ڴ����ֵ��

//�������⴦��
//D��������RegWrite�ź�֮����ˮ
//E��ѡ����д��Ĵ����ĵ�ַ�źţ�rt rd 31��֮����ˮ&������ͻ��Ԫ
//E��ѡ����ALUOutput���Ѷ�31����д�������PC+8������ALUOutput������PC+8�ͺ�31һ���ڼĴ�������ˮ�ˣ����������������31��PC+8��ת������
//W��ѡ����д��Ĵ��������ݣ���ALUOutput ���� ReadData ���ǣ�PC+8��ʵ����δ����


//��ָ�������ͨ·�������źŽ��з���,
//��ָ��Ļ����ղ�������һ����ͨ· ����ͣ���� ��ת�����ƣ����Ҷ�����ͣ��ת�����ƵĻ�����Ϊ��д�Ĵ����Ļ�����Ҫ�Ĵ�����
//������ �������� + �����ź� + ��ͻ��Ԫ

//Bclass		ֻ��D��
//cal_r		ֻ��W��
//cal_i		ֻ��W��
//Jclass		ֻ��D��
//load		ֻ��W��
//store 		ֻ��M��
//jal			ֻ��W��

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
//F������
//IM ָ��洢��Ԫ					//Bclass  cal_r  cal_i  Jclass  load  store  jal
//IFU ȡָ�Ԫ						//Bclass  cal_r  cal_i  Jclass  load  store  jal
//MUXPC ѡ����һ��PCֵ�Ķ�ѡ��		//Bclass  Jclass  jal



	PIPELINE_F pipeline_f(
	.CLK(clk),  						   //��������MIPSģ���ʱ���źţ�����IFU��ʱ������                  /**/
	.Reset(reset),   					   //��������MIPSģ��ĸ�λ�źţ�����IFU�Ƿ����							 /**/
	.Stall(Stall),  					  	//�������Գ�ͻ��Ԫ����ͣ�źţ�����IFU�Ƿ���ͣ
	.PCSel(PCSel),    					//��������D��������D��������������һ��PC��ѡ���źţ�ѡ��IFU��һ��ֵ
	.NPCOut(NPCOut),						//��������D��������D��NPC����һ��PC���ܵ�ֵ����������D������תָ���IFU����һ��ֵ
	
	.Instr_F(Instr_F),  					//���F����ָ��        To��D���Ĵ���
	.PCPlus4_F(PCPlus4_F)				//���F����PC+4		   To��D���Ĵ���
	);
	
//F����������ָ���PC+4

//////////////////////////////////////////////////////////////////////////////////	
//D���Ĵ���	
	REGISTER_D register_d(
   .Instr_F(Instr_F),  					//��������F��������IM����ָ��
	.PCPlus4_F(PCPlus4_F),  			//��������F��������IFU����PC++4
	.CLK(clk),  							//��������MIPSģ���ʱ���ź�											 /**/
	.Stall(Stall),  						//�������Գ�ͻ��Ԫ����ͣ�ź�
	.Reset(reset),							//��������MIPSģ��ĸ�λ�ź�											 /**/
   
	.Instr_D(Instr_D),  					//���D����ָ��		To�� D������ E���Ĵ��� ��ͻ��Ԫ
	.PCPlus4_D(PCPlus4_D)				//���D����PC+4		To�� D������ E���Ĵ���	
	);
//D���Ĵ�������D����ָ���PC+4

//////////////////////////////////////////////////////////////////////////////////	
//D������
//GRF	�Ĵ�����									//Bclass  cal_r  cal_i  load  store  jal
//EXT	������չ��									//cal_i  load  store
//NPC	PC����ѡ����								//Bclass  Jclass	jal
//CMP	�Ƚ���										//Bclass  
//CONTROLLER_D	D��������						//Bclass  cal_r  cal_i  Jclass  load  store  jal
//MFRSD	ת��ָ����D��Ҫ��ȡ��GRFRD1��ֵ		//Bclass  cal_r  cal_i  load  store
//MFRTD	ת��ָ����D��Ҫ��ȡ��GRFRD2��ֵ		//Bclass  cal_r  load  store

	PIPELINE_D pipeline_d(
	.CLK(clk),  							//��������MIPSģ���ʱ���ź�												 /**/
	.Reset(reset),  						//��������MIPSģ��ĸ�λ�ź�												 /**/
	.RegWrite_W(RegWrite_W),  			//��������W���Ĵ�����д���źţ������Ƿ�д��Ĵ�����
	.RD_W(RD_W),  							//��������W���Ĵ�����д���ַ������д��ĵ�ַ
	.Instr_D(Instr_D),  					//��������D���Ĵ�����ָ��
	.MUXRFWDOut(MUXRFWDOut),			//��������W��������MUXRFWD����д�����ݣ���ת������
	.PCPlus4_D(PCPlus4_D),  			//��������D���Ĵ�����PC+4
	.ALUOutput_M(ALUOutput_M),  		//��������M���Ĵ�����ALU�����ת������
	.ForwardRSD(ForwardRSD),  			//�������Գ�ͻ��Ԫ��RSת�������ź�
	.ForwardRTD(ForwardRTD),			//�������Գ�ͻ��Ԫ��RTת�������ź�
	.PCPlus4_W(PCPlus4_W),				//��������W���Ĵ�����PC+4�����������display��
	
	.EXTOut(EXTOut),  					//�����������չ���				To�� E���Ĵ���
	.NPCOut(NPCOut),  					//�����һ�����ܵ�PCֵ			To�� F������
	.PCSel(PCSel),  						//���PCѡ���ź�					To�� F������
	.RegWrite_D(RegWrite_D),  			//���D��ָ���д�źţ���D������ǰ����д�źţ�֮������ˮ���д��� 		To�� E���Ĵ���
	.RSV_D(RSV_D),  						//���GRFRD1		To�� E���Ĵ���
	.RTV_D(RTV_D)							//���GRFRD2		To�� E���Ĵ���
	);
//D���������� ��������չ��� ��תָ���PC��ֵ PCѡ���ź� D��ָ��д�ź� �Ĵ���������ȡ��ֵ

//////////////////////////////////////////////////////////////////////////////////	
//E���Ĵ���
	REGISTER_E register_e(
	.CLK(clk),  							//��������MIPSģ���ʱ���ź�													 /**/
	.Reset(reset),  						//��������MIPSģ��ĸ�λ�ź�													 /**/
	.FlushE(Stall),  						//�������Գ�ͻ��Ԫ����ͣ�źţ�ʵ����������źţ��൱�ڲ���NOP
	.Instr_D(Instr_D),  					//��������D���Ĵ�����ָ��
	.PCPlus4_D(PCPlus4_D),  			//��������D���Ĵ�����PC+4
	.RSV_D(RSV_D),  						//��������D��������MFRSD����GRFRD1
	.RTV_D(RTV_D),							//��������D��������MFRTD����GRFRD2
	.EXTOut_D(EXTOut),  					//��������D��������EXT������չ��
	.RegWrite_D(RegWrite_D),  			//��������D��������CONTROLLER_D����д�ź�
	.RS_D(Instr_D[25:21]),  			//��������D���Ĵ�����ָ��Ķ��Ĵ�����ַ1
	.RT_D(Instr_D[20:16]),  			//��������D���Ĵ�����ָ��Ķ��Ĵ�����ַ2
	.RD_D(Instr_D[15:11]),				//��������D���Ĵ�����ָ���д�Ĵ�����ַ
	
	.Instr_E(Instr_E),  					//���E����ָ��		To�� E������ M���Ĵ��� ��ͻ��Ԫ
	.PCPlus4_E(PCPlus4_E),  			//���E����PC+4		To�� E������ M���Ĵ���
	.RSV_E(RSV_E),  						//���E����GRFRD1	To�� E������
	.RTV_E(RTV_E),  						//���E����GRFRD2	To�� E������ 		/*store����Ҫ�����ֵ�洢�����ǵþ���E������ѡ��*/
	.EXTOut_E(EXTOut_E),  				//���E������չ��		To�� E������
	.RegWrite_E(RegWrite_E), 			//���E����д���ź�	To�� M���Ĵ��� ��ͻ��Ԫ
	.RS_E(RS_E),  							//���E��ָ��Ķ��Ĵ�����ַ1		To�� ûɶ�ã������ˣ�ʵ��������������E�������б�Instr_E������
	.RT_E(RT_E),  							//���E��ָ��Ķ��Ĵ�����ַ2		To�� ûɶ�ã������ˣ�ʵ��������������E�������б�Instr_E������
	.RD_E(RD_E)								//���E��ָ���д�Ĵ�����ַ		To�� ûɶ�ã������ˣ�ʵ��������������E�������б�Instr_E������
	);
//////////////////////////////////////////////////////////////////////////////////	
//E������		
//ALU �����߼����㵥Ԫ																		//cal_r  cal_i  load  store									
//CONTROLLER_E E��������																	//cal_r  cal_i  load  store  jal

//MUXALUOutput ѡ��ALU�������															//cal_r  cal_i  load  store  jal
//��������һ��ĶԼĴ�����������������ָ��Ͷ�31�żĴ������в�����ָ������

//MUXRDE ѡ��������д��Ĵ����ĵ�ַ��Ӧ�ý��������������ͻ��Ԫ����ȻE����д��ַ�����//cal_r  cal_i  load  store  jal
//MUXALUB ѡ��ALU�ĵڶ����������ǼĴ���������������										//cal_r  cal_i  load  store
//MFRSE ѡ��ALU�ĵ�һ����������ת��														//cal_r  cal_i  load  store
//MFRTE ѡ��ALU�ĵڶ�����������ת��														//cal_r  cal_i  load  store

	PIPELINE_E pipeline_e(
	.CLK(clk),								//����ʱ���ź�
	.Reset(reset),							//���븴λ�ź�
	.Instr_E(Instr_E),					//��������E���Ĵ�����ָ��  
	.RTV_E(RTV_E),  						//��������E���Ĵ�����GRFRD2
	.RSV_E(RSV_E),  						//��������E���Ĵ�����GRFRD1
	.EXTOut_E(EXTOut_E),  				//��������E���Ĵ�������չ��
	.MUXRFWDOut(MUXRFWDOut),  			//��������W��������MUXRFWD����д�����ݣ�ת������
	.ALUOutput_M(ALUOutput_M),  		//��������M���Ĵ�����ALU�����ת������
	.ForwardRSE(ForwardRSE),  			//�������Գ�ͻ��Ԫ��RSE�����ź�
	.ForwardRTE(ForwardRTE),			//�������Գ�ͻ��Ԫ��RTE�����ź�
	.PCPlus4_E(PCPlus4_E),				//��������E���Ĵ�����PC+4��Ϊ��31�żĴ�������jal���������׼��
	
	.Start(Start),							//����˳�ģ�������ź�		To�� ��ͻ��Ԫ
	.Busy(Busy),							//����˳�ģ�鷱æ�ź�      To�� ��ͻ��Ԫ
	.ALUOutput(ALUOutput),  			//���ALU��������			To�� M���Ĵ���
	.WriteRd_E(WriteRd_E),  			//���������E����д���ַ   To�� M���Ĵ��� 					/*�����ľ�����ѡ����д���ַ��E��ȷ��*/
	.WriteData_E(WriteData_E)			//���Ҫд���ڴ�����ݣ�Ӧ�����Ծ���ת��MFRTEѡ����ѡ�������	To�� M���Ĵ���
	);
//E���������� ALU�������� E����������д���ַ E����������д������

//////////////////////////////////////////////////////////////////////////////////	
//M���Ĵ���
	REGISTER_M register_m(
	.CLK(clk),  							//��������MIPSģ���ʱ���ź�										/**/
	.Reset(reset),  						//��������MIPSģ��ĸ�λ�ź�										/**/
	.Instr_E(Instr_E),  					//��������E���Ĵ�����ָ��
	.RTV_E(WriteData_E),					//��������E��������MFRTE�����ڴ�д������            	/**/		/*�˴�ӦΪ����E�����������������������E���Ĵ�����ֵ*/  
	.PCPlus4_E(PCPlus4_E),  			//��������E���Ĵ�����PC+4	
	.ALUOutput_E(ALUOutput), 			//��������E��������MUXALUOutput����ALU������
	.RegWrite_E(RegWrite_E),  			//��������E���Ĵ�����д�ź�
	.WriteRd_E(WriteRd_E),				//��������E��������MUXRDE����������д�Ĵ�����ַ
	
	.RegWrite_M(RegWrite_M),  			//���M����д�ź�		To�� W���Ĵ��� ��ͻ��Ԫ
	.Instr_M(Instr_M),  					//���M����ָ��		To�� M������ W���Ĵ��� ��ͻ��Ԫ
	.RTV_M(RTV_M),  						//���M����д������	To�� M������ 
	.PCPlus4_M(PCPlus4_M),  			//���M����PC+4		To�� M������ W���Ĵ���
	.ALUOutput_M(ALUOutput_M),  		//���M����ALU������	To�� D������ E������ M������ W���Ĵ���
	.RD_M(RD_M)								//���M����д�Ĵ�����ַ	To�� W���Ĵ��� ��ͻ��Ԫ
	);
//////////////////////////////////////////////////////////////////////////////////	
//M������
//DM �ڴ浥Ԫ													//load  store 
//CONTROLLER_M	M�������� 									//load  store
//MFRTM ѡ��д��Ĵ�����ֵ��ת��							//store
//������LH LB SH SB֮���ָ��ڴ˼�����MUX����		//load store

	PIPELINE_M pipeline_m(
	.CLK(clk),  							//��������MIPSģ���ʱ���ź�				/**/
	.Reset(reset),  						//��������MIPSģ��ĸ�λ�ź�				/**/
	.ALUOutput_M(ALUOutput_M),			//��������M���Ĵ����ĵ�ALU���  ��Ϊ��ȡ�ڴ�ĵ�ַ
	.RTV_M(RTV_M),  						//��������M���Ĵ�����д�����ݣ���Ҳ�Ǿ���E��ת��ѡ��������
	.Instr_M(Instr_M),  					//��������M���Ĵ�����ָ��
	.ForwardRTM(ForwardRTM),			//�������Գ�ͻ��Ԫ��RTת�������ź�
	.PCPlus4_M(PCPlus4_M),  			//��������M���Ĵ�����PC+4	display����
	.MUXRFWDOut(MUXRFWDOut),			//��������W��������MUXRFWD��д���ݣ�ת������
	
	.MemOut(MemOut)       				//����ڴ������	To�� W���Ĵ���
	);
//M���������� �ڴ������	

//////////////////////////////////////////////////////////////////////////////////	
//W���Ĵ���
	REGISTER_W register_w(
	.CLK(clk),  							//��������MIPSģ���ʱ���ź�			/**/
	.Reset(reset),  						//��������MIPSģ��ĸ�λ�ź�			/**/
	.Instr_M(Instr_M),  					//��������M���Ĵ�����ָ��
	.PCPlus4_M(PCPlus4_M),  			//��������M���Ĵ�����PC+4
	.ALUOutput_M(ALUOutput_M),			//��������M���Ĵ�����ALU������  
	.ReadData_M(MemOut),  				//��������M��������DM�����ڴ������  						/**/			/*�˴�����MemOut*/
	.RD_M(RD_M), 							//��������M���Ĵ�����д�Ĵ�����ַ 
	.RegWrite_M(RegWrite_M),			//��������M���Ĵ�����д�Ĵ�������
	
	.Instr_W(Instr_W),  					//���W����ָ��			To�� W������ ��ͻ��Ԫ
	.PCPlus4_W(PCPlus4_W),  			//���W����PC+4			To�� W������
	.ALUOutput_W(ALUOutput_W),  		//���W����ALU������	To�� W������
	.ReadData_W(ReadData_W),  			//���W�����ڴ������		To�� W������
	.RD_W(RD_W),  							//���W���ļĴ���д��ַ	To�� D������ ��ͻ��Ԫ
	.RegWrite_W(RegWrite_W)				//���W���ļĴ���д�ź�	To�� D������ ��ͻ��Ԫ
	);
//////////////////////////////////////////////////////////////////////////////////	
//W������
//CONTROLLER_W W���Ŀ�����		//cal_r  cal_i  load  jal
//MUXRFWD ѡ��������д������		//cal_r  cal_i  load  jal
//GRF �����ϴ��ڵ�д��Ĵ�����

	PIPELINE_W pipeline_w(
	.Instr_W(Instr_W),					//��������W���Ĵ�����ָ��  
	.ReadData_W(ReadData_W),  			//��������W���Ĵ������ڴ������
	.ALUOutput_W(ALUOutput_W),			//��������W���Ĵ�����ALU������
	.PCPlus4_W(PCPlus4_W),				//��������W���Ĵ�����PC+4
	
	.MUXRFWDOut(MUXRFWDOut)				//����Ĵ���Ҫд�������			To�� D������ E������ M������		/*��������Ҫд�����������W��*/
	);
//W���������� д��Ĵ�����ֵ

//////////////////////////////////////////////////////////////////////////////////
//��ͻ��Ԫ										//Bclass  cal_r  cal_i  Jclass  load  store  jal
	HAZARDUNIT hazardunit(
   .Instr_D(Instr_D), 					//��������D���Ĵ�����ָ��
	.Instr_E(Instr_E),  					//��������E���Ĵ�����ָ��
	.Instr_M(Instr_M),  					//��������M���Ĵ�����ָ��
	.Instr_W(Instr_W),  					//��������W���Ĵ�����ָ��
	.RegWrite_E(RegWrite_E),  			//��������E���Ĵ�����д�ź�
	.RegWrite_M(RegWrite_M),  			//��������M���Ĵ�����д�ź�										/*֮ǰ���߳���������E����д�ź�*/
	.RegWrite_W(RegWrite_W), 			//��������W���Ĵ�����д�ź� 
	.A3_E(WriteRd_E),						//��������E���Ĵ�����д��ַ			/**/			/*�����ҵ������7.58����������E������RegDst�ģ����Եô���MUX���RD_E */ 
	.A3_M(RD_M),							//��������M���Ĵ�����д��ַ			/**/
	.A3_W(RD_W),							//��������W���Ĵ�����д��ַ			/**/
	.Busy(Busy),							//��������E�������ķ�æ�ź�
	.Start(Start),							//��������E�������������ź�
		
	.Stall(Stall),							//�����ͣ�ź� 			To�� F������ D���Ĵ��� E���Ĵ���
	.ForwardRSD(ForwardRSD),  			//���RSDת���ź�		To�� D������
	.ForwardRTD(ForwardRTD),  			//���RTDת���ź�		To�� D������
	.ForwardRSE(ForwardRSE),  			//���RSEת���ź�		To�� E������
	.ForwardRTE(ForwardRTE), 			//���RTEת���ź�		To�� E������
	.ForwardRTM(ForwardRTM)				//���RTMת���ź�		To�� M������
	);
endmodule
