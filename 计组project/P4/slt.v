module slt(
		input [31:0] a, // 32 Î»ÊäÈë£¬²Ù×÷Êý1
		input [31:0] b, // 32 Î»ÊäÈë£¬²Ù×÷Êý2
		input aluc, // 4 Î»ÊäÈë£¬¿ØÖÆalu µÄ²Ù×÷
		output reg [31:0] r, // 32 Î»Êä³ö£¬ÓÐa b ¾­¹ýaluc Ö¸¶¨µÄ²Ù×÷Éú³É
		output reg zero, // 0 ±êÖ¾Î» 
		output reg carry, // ½øÎ»±êÖ¾Î»
		output reg negative, // ¸ºÊý±êÖ¾Î»
		output reg overflow // Òç³ö±êÖ¾Î»
    );
		always @ (*)
		begin
				if (aluc==1)
				begin
						r=($signed(a) < $signed(b)) ? 1 : 0;
						/*
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
								overflow=0;
						*/
						zero=(r==0) ? 1'b1 : 1'b0;
						negative=0;
						carry=0;
				end
				else
				begin
						r=($unsigned(a) < $unsigned(b)) ? 1 : 0;
						zero=(r==0) ? 1'b1 : 1'b0;
						negative=0;
						overflow=0;
						carry=(a < b) ? 1'b1 : 1'b0;
				end
		end

endmodule