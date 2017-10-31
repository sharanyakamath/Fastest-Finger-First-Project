`timescale 1ns / 1ps
module test;
reg a,b,c,d;
wire w,x,y,z;
hexinverter uut(.a(a),.b(b),.c(c),.d(d),.w(w),.x(x),.y(y),.z(z));
initial 
begin
a=0;
b=0;
c=0;
d=0;
#1 a=~a;
#2 b=~b;
#3 c=~c;
#4 d=~d;
#10;
end
initial 
begin
$monitor("a b c d = %b %b %b %b\tw x y z = %b %b %b %b",a,b,c,d,w,x,y,z);
end
endmodule
