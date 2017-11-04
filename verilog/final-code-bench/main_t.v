`timescale 1ns / 1ps
    module test;
reg P1,P2,P3,P4,en;
wire [6:0]out;
main uut(P1,P2,P3,P4,en,out);

initial
begin
	P1=1'b1;
	en=1'b1;

#10
	begin
	P2=1'b1;
	en=1'b0;
	end

#10
	P3=1'b1;

#10
	P4=1'b1;

#10
	begin
	P1=1'bx;
	P2=1'bx;
	P3=1'bx;
	P4=1'bx;
	end

#10
	begin
	P3=1'b1;
	en=1'b1;
	end

#10
	begin
	P2=1'b1;
	en=1'b0;
	end

#10
	P3=1'b1;

#10
	P4=1'b1;

end
initial
begin
$monitor("p1p2p3p4=%b%b%b%b\tout=%7b",P1,P2,P3,P4,out);
end
endmodule
