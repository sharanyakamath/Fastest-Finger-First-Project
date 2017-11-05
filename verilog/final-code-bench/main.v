module ic7475(p2,p3,p6,p7,p13,p4,p16,p15,p10,p9);
   
	input p2,p3,p6,p7,p13,p4;
  	output p16,p15,p10,p9;
  	reg p16,p15,p10,p9;

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


module priority_encoder (binary_out , encoder_in);
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
	if (encoder_in[1] == 1'b0) begin
        	binary_out[0]=1'b1;
		binary_out[1]=1'b0;
		binary_out[2]=1'b1;
		binary_out[3]=1'b1; 
     	end	 
	if (encoder_in[2] == 1'b0) begin
        	binary_out[0]=1'b0;
		binary_out[1]=1'b0;
		binary_out[2]=1'b1;
		binary_out[3]=1'b1;  
     	end 
	if (encoder_in[3] == 1'b0) begin
        	binary_out[0]=1'b1;
		binary_out[1]=1'b1;
		binary_out[2]=1'b0;
		binary_out[3]=1'b1; 
     	end	 
	if (encoder_in[4] == 1'b0) begin
        	binary_out[0]=1'b0;
		binary_out[1]=1'b1;
		binary_out[2]=1'b0;
		binary_out[3]=1'b1;
     	end	 
	if (encoder_in[5] == 1'b0) begin
        	binary_out[0]=1'b1;
		binary_out[1]=1'b0;
		binary_out[2]=1'b0;
		binary_out[3]=1'b1; 
     	end 
	if (encoder_in[6] == 1'b0) begin
        	binary_out[0]=1'b0;
		binary_out[1]=1'b0;
		binary_out[2]=1'b0;
		binary_out[3]=1'b1;   
     	end 
	if (encoder_in[7] == 1'b0) begin
        	binary_out[0]=1'b1;
		binary_out[1]=1'b1;
		binary_out[2]=1'b1;
		binary_out[3]=1'b0; 
     	end	 
	if (encoder_in[8] == 1'b0) begin
        	binary_out[0]=1'b0;
		binary_out[1]=1'b1;
		binary_out[2]=1'b1;
		binary_out[3]=1'b0;  
     	end	 
	if (encoder_in[9] == 1'b0) begin
        	binary_out[0]=1'b1;
		binary_out[1]=1'b0;
		binary_out[2]=1'b1;
		binary_out[3]=1'b0;  
	end
    end
endmodule

module hexto7segment(input  [3:0]x,output reg [6:0]z);

	always @*
	case (x)
		4'b0000 : z = 7'b1111110 ;  		//Hexadecimal 0

		4'b0001 : z = 7'b0110000 ;  		//Hexadecimal 1

		4'b0010 : z = 7'b1101101 ; 		//Hexadecimal 2

		4'b0011 : z = 7'b1111001 ;		//Hexadecimal 3

		4'b0100 : z = 7'b0110011 ;		//Hexadecimal 4

	endcase
endmodule


module hexinverter(input a,b,c,d,output w,x,y,z);

	not n1(w,a);
	not n2(x,b);
	not n3(y,c);
	not n4(z,d);

endmodule


module main(input P1,P2,P3,P4,en,output [6:0] out);

	wire w1,w2,w3,w4,r,w6,en;
	wire [9:0]w5;
	wire [3:0]w7;
	wire [3:0]w8;

	not n1(w1,P1);
	not n2(w2,P2);
	not n3(w3,P3);
	not n4(w4,P4);
	ic7475 latch(w1,w2,w3,w4,en,en,w5[0],w5[1],w5[2],w5[3]);
	assign w5[4]=1'b1;
	assign w5[5]=1'b1;
	assign w5[6]=1'b1;
	assign w5[7]=1'b1;
	assign w5[8]=1'b1;
	assign w5[9]=1'b1;
	priority_encoder pen(w7,w5);
	hexinverter invert(w7[0],w7[1],w7[2],w7[3],w8[0],w8[1],w8[2],w8[3]);
	hexto7segment hexseven(w8,out);
	
endmodule





