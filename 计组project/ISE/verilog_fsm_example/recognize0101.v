`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:01 10/28/2018 
// Design Name: 
// Module Name:    recognize0101 
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
module recognize0101(
		input clk,
		input in,
		output reg out = 0
    );
	 integer state = 0;
	 /*state被期望能够正确表示当前累计读入的1010的前缀的长度。
	 比如未读入时state=0；读入到10时我们期望有state<=2*/
	 always @(posedge clk) begin
		 case(state)
		 0:
			 begin
					state <= in==1?1:0;
					out <= 0;
			 end
		 
		 1:
			 begin
					state <= in==1?1:2;
					out <= 0;
			 end
		 
		 2:
			 begin
					state <= in==1?3:0;
					out <= 0;
			 end
			 
		 3:
			 begin
					 state <= in==1?1:4;
					 out <= (in==0);
			 end
			 
		 4:
			 begin
					 state <= in==1?3:0;
					 out <= 0;
			 end
		 default:;
		 endcase
	 end
endmodule
