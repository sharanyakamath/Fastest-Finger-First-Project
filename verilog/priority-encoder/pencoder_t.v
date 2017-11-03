`timescale 1ns / 1ps
module test;
reg [9:0] encoder_in;
wire [3:0] binary_out;
priority_encoder uut(.binary_out(binary_out),.encoder_in(encoder_in));
initial
begin

$dumpfile("pencoder.vcd");
$dumpvars(0,test); 

	$monitor("encoder_in = %10b\tbinary_out = %b%b%b%b",encoder_in,binary_out[3],binary_out[2],binary_out[1],binary_out[0]);

encoder_in=10'b1111111111;

#10 encoder_in=10'b1111111110;

#10 encoder_in=10'b1111111101;

#10 encoder_in=10'b1111111011;

#10 encoder_in=10'b1111110111;

 $finish;
end
     
endmodule
