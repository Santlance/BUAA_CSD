module fsm_1010(
    input clk,
    input in,
    output reg out = 0
    );
	 
	 integer state = 0;
	 /*state�������ܹ���ȷ��ʾ��ǰ�ۼƶ����1010��ǰ׺�ĳ��ȡ�
	 ����δ����ʱstate=0; ���뵽10ʱ����������state<=2��*/
	 
	 always @(posedge clk) begin
		case (state)
		0:
			begin
				state <= in == 1 ? 1 : 0;
				out <= 0;
			end
		1:
			begin
				state <= in == 1 ? 1 : 2;
				out <= 0;
			end		
		2:
			begin
				state <= in == 1 ? 3 : 0;
				out <= 0;
			end	
		3:
			begin
				state <= in == 1 ? 0 : 4;
				out <= (in == 0);
			end	
		4:
			begin
				state <= in == 1 ? 3 : 0;
				out <= 0;
			end	
		endcase
	 end
endmodule
