 module priority_encoder (
  binary_out , 
  encoder_in ,  
  enable       
  );
  output [3:0] binary_out ;
  input  enable ; 
  input [9:0] encoder_in ; 
       
  reg [3:0] binary_out ;
        
  always @ (enable or encoder_in)
  begin
    binary_out = 0;
    if (enable) begin
     if (encoder_in[0] == 1) begin
      binary_out = 1; 
     end 
else if (encoder_in[1] == 1) begin
      binary_out = 2; 
     end 
else if (encoder_in[2] == 1) begin
      binary_out = 3; 
     end 
else if (encoder_in[3] == 1) begin
      binary_out = 4; 
     end 
else if (encoder_in[4] == 1) begin
      binary_out = 5; 
     end 
else if (encoder_in[5] == 1) begin
      binary_out = 6; 
     end 
else if (encoder_in[6] == 1) begin
      binary_out = 7; 
     end 
else if (encoder_in[7] == 1) begin
      binary_out = 8; 
     end 
else if (encoder_in[8] == 1) begin
      binary_out = 9; 
     end 
else if (encoder_in[9] == 1) begin
      binary_out = 10; 
      end
 
   end
  end
  
  endmodule
