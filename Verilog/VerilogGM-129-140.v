/*
						-----------------------------------------------
							FIRST RESPONSE DETECTOR CIRCUIT
						-----------------------------------------------

							----------------------------
							GATE MODELLING VERILOG CODE
							----------------------------
-----------------------------------------------
Mini-Project: CO202 - Design Of Digital Systems
-----------------------------------------------
Reg.No.
Palak Singhal 	16CO129
Sharanya Kamath 16CO140
-----------------------------------------------

---------
Abstract: 
---------
The idea of this mini project is to create a circuit which determines which participant has reponded the earliest.
These type of circuits are useful in the buzzer rounds of quiz shows.

In first response rounds of quiz contests, the question is thrown open to all the teams.
The person who knows the answer hits his switch first and then answers the question. 
Sometimes two or more players hit the switch almost simultaneously and it is very difficult to detect which of
them has pressed the switch first.
________________________________________________________________________________________________________________________________________________

-----------------
Functionalities
-----------------
-> Inputs are accepted as the players' switch status whenever there is a change.

-> Enables to the latches are produced by the method of feedback. 

-> There is no need of a manual enable/reset switch as the desired conditions are produced automatically through feedback.

-> Active-low and Active-high conditions are managed appropriately.

-> Decimal number is also displayed along with 7 segment output for better understandability.

-> Foolproof method to determine the winner as the main code does not depend on the clock pulse difference between player responses. 
________________________________________________________________________________________________________________________________________________

------------------------------
Brief Description of the Code
------------------------------
-> 4bit bistable latch module:
 	
	Used to lock the input of the player whose response was the earliest.
	The enables of this component automatically become 0 after passing the first input.
	Hence the latch does not pass the inputs of the players who pressed their switches later.

-> Priority Encoder module:

	Priority encoder encodes the active-low input condition into the
	corresponding binary coded decimal (BCD) number output.

-> Hex Inverter module:	

	This component consists of NOT gates which convert the active-low output of the
	priority encoder into active-high.

-> Hex to 7 segment decoder module: 	

	This decoder converts the 4 bit binary active-high inputs to corresponding 7 segment inputs
	for the 7 segment LED display.

-> The input after getting inverted passes from 4-bit bistable latch to the active low priority encoder and simultaneously locks the bistable 
   latch by turning the enable to 0 with the help of 2 nand gates. From the active low state it is converted to active high state using a hex     	inverter which then passes to a 7 segment decoder which displays the output corresponding to the winning player.  
________________________________________________________________________________________________________________________________________________
*/

//4 bit bistable d-latch
module bistable_latch(
		d1,	//Input to d-latch1
		d2,	//Input to d-latch2
		d3,	//Input to d-latch3
		d4,	//Input to d-latch4
		enable,	//Common enable input for all latches
		q1,	//Output of d-latch1
		q2,	//Output of d-latch2
		q3,	//Output of d-latch3
		q4	//Output of d-latch4
	);
   
	input d1,d2,d3,d4,enable;	
  	output q1,q2,q3,q4;
  	reg q1,q2,q3,q4;
	
	//Latch1
  	always @(enable or d1)			//Execute this block whenever there is a change in enable or d1
  		if (enable)			//This latch is active when enable is high			 	
			begin
	    			q1 <= d1;	//Output of dlatch is equal to input when active
	  		end

	//Latch2   	
	always @(enable or d2)			//Execute this block whenever there is a change in enable or d2
	  	if (enable) 			//This latch is active when enable is high
			begin
		  	  	q2 <= d2;	//Output of dlatch is equal to input when active
		  	end

	//Latch3
  	always @(enable or d3)			//Execute this block whenever there is a change in enable or d3
	  	if (enable) 			//This latch is active when enable is high
			begin
    				q3 <= d3;	//Output of dlatch is equal to input when active
  			end
	  	
	//Latch4
	always @(enable or d4)			//Execute this block whenever there is a change in enable or d4
	  	if (enable) 			//This latch is active when enable is high
			begin
		    		q4 <= d4;	//Output of dlatch is equal to input when active	
  			end
 
endmodule


/*

  ACTIVE LOW PRIORITY ENCODER
  Since the number of players in the game are 4, the first
  4 inputs to the priority encoder need to be considered, the rest can be safely kept at active high
  using a high voltage. The output corresponding to the player who presses the switch first is turned
  to an active low state while the others are still in the active high state.
*/

module priority_encoder (output [3:0]binary_out ,
                         input [9:0]encoder_in);   // binary_out represents the active low output where binary_out[i] where i is the 
  				                   // player who presses the switch first is 0(active low) , rest all are 1(active high)
  	
       	reg [3:0] binary_out ;
        
  	always @ (encoder_in)                        // Whenever the encoder_inputs change that is whenever the circuit is reset and
  	begin                                        // another round of game happens.
		binary_out[0]=1'b1;
		binary_out[1]=1'b1;
		binary_out[2]=1'b1;                  // assign all the outputs to active high so that the display is 0 initially.
		binary_out[3]=1'b1; 
   
     	if (encoder_in[0] == 1'b0) begin
        	binary_out[0]=1'b0;                  // If player 1 presses the switch first encoder_in[0]=1 and corresponding output 
		binary_out[1]=1'b1;                  // binary_out[0]=0. rest all the binary_out[] are 1.
		binary_out[2]=1'b1;
		binary_out[3]=1'b1; 
     	end 
	if (encoder_in[1] == 1'b0) begin
        	binary_out[0]=1'b1;                  // If player 2 presses the switch first encoder_in[1]=1 and corresponding outpu
		binary_out[1]=1'b0;                  // binary_out[0]=0. rest all the binary_out[] are 1.
		binary_out[2]=1'b1;
		binary_out[3]=1'b1; 
     	end	 
	if (encoder_in[2] == 1'b0) begin
        	binary_out[0]=1'b0;                  // If player 3 presses the switch first encoder_in[2]=1 and corresponding outpu
		binary_out[1]=1'b0;                  // binary_out[0]=0. rest all the binary_out[] are 1.
		binary_out[2]=1'b1;
		binary_out[3]=1'b1;  
     	end 
	if (encoder_in[3] == 1'b0) begin
        	binary_out[0]=1'b1;                  // If player 4 presses the switch first encoder_in[3]=1 and corresponding output
		binary_out[1]=1'b1;                  // binary_out[0]=0. rest all the binary_out[] are 1.
		binary_out[2]=1'b0;
		binary_out[3]=1'b1; 
     	end	 
	if (encoder_in[4] == 1'b0) begin                
        	binary_out[0]=1'b0;                  // The remaining ports of priority encoder can be used if one wants to implement 
		binary_out[1]=1'b1;                  // our mini project with more than 4 players playing the game.
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
//Hex to 7 segment decoder
module hexto7segment(
			input  [3:0]hex,		//4 bit input
			output reg [6:0]seven_segment	//7 bit output		
			);
	always @*					//Execute this switch case block whenever there is a change in the input
	case (hex)
		4'b0000 : begin	seven_segment = 7'b1111110 ;  	//Hexadecimal 0
			  	  end
		4'b0001 : begin	seven_segment = 7'b0110000 ;  	//Hexadecimal 1
				  end	
		4'b0010 : begin	seven_segment = 7'b1101101 ; 	//Hexadecimal 2
				  end
		4'b0011 : begin	seven_segment = 7'b1111001 ;	//Hexadecimal 3
				  end
		4'b0100 : begin	seven_segment = 7'b0110011 ;	//Hexadecimal 4
				  end
		4'b0110 : begin	seven_segment = 7'b1011011 ;	//Hexadecimal 5
				  end
		4'b0110 : begin	seven_segment = 7'b1011111 ;	//Hexadecimal 6
				  end
		4'b0111 : begin	seven_segment = 7'b1110000 ;	//Hexadecimal 7
				  end	
		4'b1000 : begin	seven_segment = 7'b1111111 ;	//Hexadecimal 8
				  end
		4'b1001 : begin seven_segment = 7'b1110011 ;	//Hexadecimal 9
				  end	
		4'b0110 : begin	seven_segment = 7'b1110111 ;	//Hexadecimal A
				 end
		4'b0110 : begin seven_segment = 7'b0011111 ;	//Hexadecimal B
				 end
		4'b0110 : begin	seven_segment = 7'b1001110 ;	//Hexadecimal C
				 end
		4'b0110 : begin	seven_segment = 7'b0111101 ;	//Hexadecimal D
				 end
		4'b0110 : begin	seven_segment = 7'b1001111 ;	//Hexadecimal E
				 end	
		4'b0110 : begin	seven_segment = 7'b1000111 ;	//Hexadecimal F
				 end
	endcase
endmodule


//Hex-inverter is used to invert the inputs.
//This is used to convert the active low priority encoder to active high
  
module hexinverter(
			input a,	//input1
			b,		//input2
			c,		//input3
			d,		//input4
			output w,	//output1
			x,		//output2
			y,		//output3
			z);  		//output4

	not n1(w,a);
	not n2(x,b);
	not n3(y,c);
	not n4(z,d);

endmodule


//Main circuit module
module VerilogM_129_140(
		output flag,
		input [3:0]player,	//Inputs provide by the 4 players
		output [6:0]display,	//7 bit output shown on the led display
		output [3:0]decimal	//for decimal output	
		);

	wire w1,w2,w3,w4,w6,w9,reset,reset1,enable;
	wire [9:0]w5;
	wire [3:0]w7;
	wire [3:0]w8;
	
	//Inverting the inputs to satisfy active low conditions 
	not n1(w1,player[0]);
	not n2(w2,player[1]);
	not n3(w3,player[2]);
	not n4(w4,player[3]);

	bistable_latch latch(w1,w2,w3,w4,enable,w5[0],w5[1],w5[2],w5[3]);

	//Generating feedback for enable input of bistable latch
	nand n5(w9,w5[0],w5[1],w5[2],w5[3]);
	or n6(reset,player[0],player[1],player[2],player[3]);
	nand n7(reset1,reset,w9);
	and n8(enable,reset1,reset1);

	priority_encoder p_encoder(w7,w5);

	hexinverter invert(w7[0],w7[1],w7[2],w7[3],w8[0],w8[1],w8[2],w8[3]);

	hexto7segment hexseven(w8,display);

	//Assigning the decimal values to output variable	
	and a1( decimal[0],w8[0],w8[0]);
	and a2( decimal[1],w8[1],w8[1]);
	and a3( decimal[2],w8[2],w8[2]);
	and a4( decimal[3],w8[3],w8[3]);

endmodule


/*x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-*/


