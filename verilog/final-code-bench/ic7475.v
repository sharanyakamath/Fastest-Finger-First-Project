
module ic7475(p2,p3,p6,p7,p4,p16,p15,p10,p9);
   
  input p2,p3,p6,p7,p13,p4;
  output p16,p15,p10,p9;
  reg p16,p15,p10,p9;
  always @(p4 or p2)
  if (p4) begin
    p16 <= p2;
  end
   always @(p4 or p3)
  if (p4) begin
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
