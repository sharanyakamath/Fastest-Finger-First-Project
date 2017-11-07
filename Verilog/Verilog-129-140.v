/*
						-----------------------------------------------
							FIRST RESPONSE DETECTOR CIRCUIT
						-----------------------------------------------

							----------------------------
							        TEST-BENCH
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
-> The player vector is declared where each bit displays a player i.e player1 to player3 on travelling from lsb to msb of player vector.
   Initially all the players are assigned a 0 bit to display the start state.

->  4 TEST CASES are taken where for each test case players press their switch at an interval of 10ns which gives the order in which the bits     	player vector turn high i.e the order in which the players press the switch.
 
->  After each test case the condition where the all the players turn off their switch is displayed by turning all bits of the player vector to
    0.  

-> The output is the seven segment display and corresponding decimal for all the test cases.
________________________________________________________________________________________________________________________________________________
*/
`timescale 1ns / 1ps
module Verilog_129_140;
reg [3:0]player;					//Inputs provide by the 4 players
wire [6:0]display;					//7 bit output shown on the led display
wire [3:0]decimal; 					//for decimal output
wire flag;						//a wire flag for the behavioral model

VerilogM_129_140 uut(flag, player,display,decimal);	//instantiation of the behavioral and gatelevel module		

initial
begin
$dumpfile("VerilogBM-129-140.vcd");				//creation of a vcd file
$dumpvars(0,Verilog_129_140);

	$display("\nP1\tP2\tP3\tP4\t7segment\tDecimal display\n");
	player[0]=1'b0;					//initialization of each player to 0(tackles the condition where no player presses
	player[1]=1'b0;					//the switch
	player[2]=1'b0;
	player[3]=1'b0;
#10							//TEST CASE 1
	player[0]=1'b1;					//test case where player 1 presses it first 

#10
	player[1]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	player[2]=1'b1;					//then player 3 after time delay of 10 nano seconds

#10
	player[3]=1'b1;					//then player 4 after time delay of 10 nano seconds

#10
	begin						//reset condition(the switch presssed returns to open state again)
	player[0]=1'b0;
	player[1]=1'b0;
	player[2]=1'b0;
	player[3]=1'b0;
	end

#10							//TEST CASE 2	
	player[1]=1'b1;					//test case where player 2 presses it first 

#10
	player[0]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	player[2]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	player[3]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	begin
	player[0]=1'b0;
	player[1]=1'b0;
	player[2]=1'b0;
	player[3]=1'b0;
	end

#10							//TEST CASE 3
	player[3]=1'b1;					//test case where player 4 presses it first 

#10
	player[1]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	player[2]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	player[0]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	begin
	player[0]=1'b0;
	player[1]=1'b0;
	player[2]=1'b0;
	player[3]=1'b0;
	end

#10							//TEST CASE 4
	player[2]=1'b1;					//test case where player 3 presses it first 

#10
	player[1]=1'b1;					//then player 2 after time delay of 10 nano seconds

#10
	player[0]=1'b1;					//then player 3 after time delay of 10 nano seconds

#10
	player[3]=1'b1;					//then player 4 after time delay of 10 nano seconds

end

initial
	begin
		$monitor("%b\t%b\t%b\t%b\t%7b\t\t%d\n",player[0],player[1],player[2],player[3],display,decimal);	//display statement
	end

endmodule

/*x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-*/
