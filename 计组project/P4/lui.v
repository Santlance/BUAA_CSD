module lui(
		input [31:0] a, // 32 Î»ÊäÈë£¬²Ù×÷Êý1
		input [31:0] b, // 32 Î»ÊäÈë£¬²Ù×÷Êý2
		output wire [31:0] r, // 32 Î»Êä³ö£¬ÓÐa b ¾­¹ýaluc Ö¸¶¨µÄ²Ù×÷Éú³É
		output reg zero, // 0 ±êÖ¾Î»
		output reg carry, // ½øÎ»±êÖ¾Î»
		output reg negative, // ¸ºÊý±êÖ¾Î»
		output reg overflow // Òç³ö±êÖ¾Î»
);
		assign r={b[15:0],16'b0};
		always @ (*)
		begin
				zero=(r==0) ? 1'b1 : 1'b0;
				negative=r[31];
				carry=0;
				overflow=0;
		end

endmodule