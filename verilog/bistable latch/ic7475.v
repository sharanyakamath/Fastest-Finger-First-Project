`include "dlatch.v"
module ic7475(p2,p3,p6,p7,p13,p4,p16,p15,p10,p9);
   
  input p2,p3,p6,p7,p13,p4;
  output p16,p15,p10,p9;
  reg p16,p15,p10,p9;
 // dlatch uut1(p2,p13,p16);
 // dlatch uut2(p3,p13,p15);
 // dlatch uut3(p6,p4,p10);
 // dlatch uut4(p7,p4,p9);
  always @(p13 or p2)
  if (p13) begin
    p16 <= p2;
  end
   always @(p13 or p3)
  if (p13) begin
    p15 <= p3;
  end
  always @(p4 or p6)
  if (p4) begin
    p10 <= p6;
  end
  always @(p4 or p7)
  if (p4) begin
    p9 <= p7;
  end 
 endmodule
