`timescale 1ns / 1ps
module test;
reg [3:0]player;
wire [6:0]display;
wire [3:0]decimal;
main uut(player,display,decimal);

initial
begin
$dumpfile("fastest.vcd");
$dumpvars(0,test);
	player[0]=1'b0;
	player[1]=1'b0;
	player[2]=1'b0;
	player[3]=1'b0;
#10
	player[0]=1'b1;

#10
	player[1]=1'b1;

#10
	player[2]=1'b1;

#10
	player[3]=1'b1;

#10
	begin
	player[0]=1'b0;
	player[1]=1'b0;
	player[2]=1'b0;
	player[3]=1'b0;
	end

#10
	player[1]=1'b1;

#10
	player[0]=1'b1;

#10
	player[2]=1'b1;

#10
	player[3]=1'b1;

#10
	begin
	player[0]=1'b0;
	player[1]=1'b0;
	player[2]=1'b0;
	player[3]=1'b0;
	end

#10
	player[3]=1'b1;

#10
	player[1]=1'b1;

#10
	player[2]=1'b1;

#10
	player[0]=1'b1;

#10
	begin
	player[0]=1'b0;
	player[1]=1'b0;
	player[2]=1'b0;
	player[3]=1'b0;
	end

#10
	player[2]=1'b1;

#10
	player[1]=1'b1;

#10
	player[2]=1'b1;

#10
	player[3]=1'b1;

end

initial
	begin
		$monitor("player1 player2 player3 player4 : %4b\tdisplay : %7b\tdecimal : %d",player,display,decimal);
	end

endmodule
