`include "ic7475.v"
`include "inverter.v"
`include "seven.v"
`include "pencoder.v"

module main(input P1,P2,P3,P4,en,output [6:0] out);
wire w1,w2,w3,w4,r,w6,en;
wire [9:0]w5;
wire [3:0]w7;
wire [3:0]w8;
not n1(w1,P1);
not n2(w2,P2);
not n3(w3,P3);
not n4(w4,P4);
ic7475 latch(w1,w2,w3,w4,en,w5[0],w5[1],w5[2],w5[3]);
assign w5[4]=1'b1;
assign w5[5]=1'b1;
assign w5[6]=1'b1;
assign w5[7]=1'b1;
assign w5[8]=1'b1;
assign w5[9]=1'b1;
priority_encoder pen(w7,w5);
hexinverter invert(w7[0],w7[1],w7[2],w7[3],w8[0],w8[1],w8[2],w8[3]);
hexto7segment hexseven(w8,out);

initial begin
$monitor("w1=%b w2=%b w3=%b w4=%b r=%b w5=%10b w7=%4b w8=%4b",w1,w2,w3,w4,w5,w7,w8);
end
endmodule





