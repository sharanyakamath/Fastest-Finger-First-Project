module main(
		input [3:0]player,
		output [6:0]display,
		output [3:0]decimal
		);
 wire [3:0]player;
reg [6:0]display;
wire [3:0]decimal;
assign decimal[0]=player[0];
assign decimal[1]=player[1];
assign decimal[2]=player[2];
assign decimal[3]=player[3];
always @*
     begin
	case (player)
	4'b0000: display=7'b1111110; 
	4'b0001: display=7'b0110000; 
	4'b0010: display=7'b1101101; 
	4'b0100: display=7'b1111001; 
	4'b1000: display=7'b0110011; 
        endcase
    end
	
endmodule
