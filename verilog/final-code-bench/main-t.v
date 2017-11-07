`timescale 1ns / 1ps
module test;
reg [3:0]player;
wire [6:0]display;
wire [3:0]decimal;
wire flag;
main uut(flag, player,display,decimal);

initial
begin
$dumpfile("fastest.vcd");
$dumpvars(0,test);

	$display("\nP1\tP2\tP3\tP4\t7segment\tDecimal display\n");
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
		$monitor("%b\t%b\t%b\t%b\t%7b\t\t%d\n",player[0],player[1],player[2],player[3],display,decimal);
	end

endmodule
