module hexto7segment(
    input  [3:0]x,
    output reg [6:0]z
    );
always @*
case (x)
4'b0000 :      	//Hexadecimal 0
z = 7'b1111110;
4'b0001 :    		//Hexadecimal 1
z = 7'b0110000  ;
4'b0010 :  		// Hexadecimal 2
z = 7'b1101101 ; 
4'b0011 : 		// Hexadecimal 3
z = 7'b1111001 ;
4'b0100 :		// Hexadecimal 4
z = 7'b0110011 ;

endcase
 
endmodule
