module main(   output flag,
		input [3:0]player,
		output [6:0]display,
		output [3:0]decimal
		);
 wire [3:0]player;
reg [6:0]display;
reg [3:0]decimal;
reg flag;
always @*
     begin
	case (player)
	4'b0000: flag=1'b1; 
	4'b0011: flag=1'b0; 
	4'b0101: flag=1'b0; 
	4'b1001: flag=1'b0; 
	4'b0110: flag=1'b0;
	4'b1010: flag=1'b0;
	4'b1100: flag=1'b0; 
        endcase
    end


always @*
if(flag)
     begin
	case (player)
	4'b0000: begin display=7'b1111110; decimal=4'b0000; end 
	4'b0001: begin display=7'b0110000; decimal=4'b0001; end
	4'b0010: begin display=7'b1101101; decimal=4'b0010; end
	4'b0100: begin display=7'b1111001; decimal=4'b0011; end
	4'b1000: begin display=7'b0110011; decimal=4'b0100; end
        endcase
    end
	
endmodule
