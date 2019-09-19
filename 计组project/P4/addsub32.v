module addsub32(
		input [31:0] a, // 32 Î»ÊäÈë£¬²Ù×÷Êý1
		input [31:0] b, // 32 Î»ÊäÈë£¬²Ù×÷Êý2
		input [1:0] aluc, // 4 Î»ÊäÈë£¬¿ØÖÆalu µÄ²Ù×÷
		output reg [31:0] r, // 32 Î»Êä³ö£¬ÓÐa b ¾­¹ýaluc Ö¸¶¨µÄ²Ù×÷Éú³É
		output reg zero, // 0 ±êÖ¾Î»
		output reg carry, // ½øÎ»±êÖ¾Î»
		output reg negative, // ¸ºÊý±êÖ¾Î»
		output reg overflow
    );
		reg [31:0] temp;
		always @ (*)
		begin
				case (aluc)
						2'b00:
						begin
								r=a + b;
								if ((r < a)||(r < b)) 
										carry=1;
								else
										carry=0;
								zero=(r==0) ? 1'b1 : 1'b0;
								negative=0;
								overflow=0;
						end
						2'b10:
						begin
								//temp=a + b;
								r = a + b;
								if ((a[31]==b[31])&&(a[31] !=r[31]))
								begin
										overflow=1;
								end
								else
								begin
										overflow=0;
										//r = temp;
								end
								zero=(r==0) ? 1'b1 : 1'b0;
								negative=r[31];
								carry=0;
						end
						2'b01:
						begin
								r=a - b;
								if (a < b)
										carry=1; 
								else
										carry=0;
								zero=(r==0) ? 1'b1 : 1'b0;
								negative=0;
								overflow=0;
						end
						2'b11:
						begin
								r = a - b;
								if ((a[31]==0 )&&(b[31]==1)&&(r[31]==1))
								begin
										overflow=1;
								end
								else
								if ((a[31]==1 )&&(b[31]==0)&&(r[31]==0))
								begin
										overflow=1;
								end
								else
								begin
										overflow=0;
								end
								zero=(r==0) ? 1'b1 : 1'b0;
								negative=r[31];
								carry=0;
						end
				endcase
		end  
		
endmodule