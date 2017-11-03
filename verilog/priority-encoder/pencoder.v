 module priority_encoder (
  binary_out , 
  encoder_in     
  );
  output [3:0] binary_out ;
  input [9:0] encoder_in ; 
       
  reg [3:0] binary_out ;
        
  always @ (encoder_in)
  begin
	binary_out[0]=1'b1;
	binary_out[1]=1'b1;
	binary_out[2]=1'b1;
	binary_out[3]=1'b1; 
   
     if (encoder_in[0] == 1'b0) begin
        binary_out[0]=1'b0;
	binary_out[1]=1'b1;
	binary_out[2]=1'b1;
	binary_out[3]=1'b1; 
     end 
else if (encoder_in[1] == 1'b0) begin
        binary_out[0]=1'b1;
	binary_out[1]=1'b0;
	binary_out[2]=1'b1;
	binary_out[3]=1'b1; 
     end 
else if (encoder_in[2] == 1'b0) begin
        binary_out[0]=1'b0;
	binary_out[1]=1'b0;
	binary_out[2]=1'b1;
	binary_out[3]=1'b1;  
     end 
else if (encoder_in[3] == 1'b0) begin
        binary_out[0]=1'b1;
	binary_out[1]=1'b1;
	binary_out[2]=1'b0;
	binary_out[3]=1'b1; 
     end 
else if (encoder_in[4] == 1'b0) begin
        binary_out[0]=1'b0;
	binary_out[1]=1'b1;
	binary_out[2]=1'b0;
	binary_out[3]=1'b1;
     end 
else if (encoder_in[5] == 1'b0) begin
        binary_out[0]=1'b1;
	binary_out[1]=1'b0;
	binary_out[2]=1'b0;
	binary_out[3]=1'b1; 
     end 
else if (encoder_in[6] == 1'b0) begin
        binary_out[0]=1'b0;
	binary_out[1]=1'b0;
	binary_out[2]=1'b0;
	binary_out[3]=1'b1;   
     end 
else if (encoder_in[7] == 1'b0) begin
        binary_out[0]=1'b1;
	binary_out[1]=1'b1;
	binary_out[2]=1'b1;
	binary_out[3]=1'b0; 
     end 
else if (encoder_in[8] == 1'b0) begin
        binary_out[0]=1'b0;
	binary_out[1]=1'b1;
	binary_out[2]=1'b1;
	binary_out[3]=1'b0;  
     end 
else if (encoder_in[9] == 1'b0) begin
        binary_out[0]=1'b1;
	binary_out[1]=1'b0;
	binary_out[2]=1'b1;
	binary_out[3]=1'b0;  
      end
 
  
  end
  
  endmodule
