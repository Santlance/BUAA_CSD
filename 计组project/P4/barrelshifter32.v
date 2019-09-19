module barrelshifter32(
		input [31:0] a, // 32 Î»ÊäÈë£¬²Ù×÷Êý1
		input [31:0] b, // 32 Î»ÊäÈë£¬²Ù×÷Êý2
		input [1:0] aluc, // 4 Î»ÊäÈë£¬¿ØÖÆalu µÄ²Ù×÷
		output reg [31:0] r, // 32 Î»Êä³ö£¬ÓÐa b ¾­¹ýaluc Ö¸¶¨µÄ²Ù×÷Éú³É
		output reg zero, // 0 ±êÖ¾Î»
		output reg carry, // ½øÎ»±êÖ¾Î»
		output reg negative, // ¸ºÊý±êÖ¾Î»
		output reg overflow // Òç³ö±êÖ¾Î»
);	
		always @ (*)
		begin
				case (aluc)
						2'b00:
						begin
								r=$signed(b) >>> a[4:0];
								if (a[4:0]==0)
										carry=0;
								else
										carry=b[a[4:0] - 1];
						end
						2'b01:
						begin  
								r=b >> a[4:0];
								if (a[4:0]==0)
										carry=0;
								else
										carry=b[a[4:0] - 1];
						end
						2'b10: 
						begin
								r=b << a[4:0];
								if (a[4:0]==0)
										carry=0;
								else
										carry=b[32-a[4:0]];
						end
						2'b11:
						begin
								r=b << a[4:0];
								if (a[4:0]==0)
										carry=0;
								else
										carry=b[32-a[4:0]];
						end
				endcase
				zero=(r==0) ? 1'b1 : 1'b0;
				negative=r[31];
				overflow=0;
		end
		
endmodule