
						------------------------------------------------
						Project Title: 	FIRST RESPONSE DETECTOR CIRCUIT
						------------------------------------------------

						By:	 	Palak Singhal 	16CO129
								Sharanya Kamath 16CO140
------------------------------------------------------------------------------------------------------------------------------------------------

Submitted to:	Prof. B.R.Chandavarkar
		Associate Professor
		CSE Dept
		NITK Surathkal

Date:		7-11-2017
------------------------------------------------------------------------------------------------------------------------------------------------

Introduction:

The idea of this mini project is to create a circuit which determines which participant has reponded the earliest.
These type of circuits are useful in the buzzer rounds of quiz shows.

In first response rounds of quiz contests, the question is thrown open to all the teams.
The person who knows the answer hits his switch first and then answers the question. 
Sometimes two or more players hit the switch almost simultaneously and it is very difficult to detect which of
them has pressed the switch first.
------------------------------------------------------------------------------------------------------------------------------------------------

Contents:

In this zip folder, we have packed the following files:

-> VerilogGM-129-140.v   : Gate modelling verilog code
-> VerilogBM-129-140.v   : Behavioral modelling verilog code
-> VerilogGM-129-140.vcd : Gtkwave output file of gate modelling
-> VerilogBM-129-140.vcd : Gtkwave output file of behavioral modelling
-> Verilog-129-140.v     : Common testbench for gate and behavioral modelling
-> Verilog-129-140.txt   : README file

--------------------------------------------------------------------------------------------------------------------------------------------------

Compilation Procedure:

-> iverilog -o VerilogGM-129-140.vvp VerilogGM-129-140.v Verilog-129-140.v
-> vvp VerilogGM-129-140.vvp
-> gtkwave VerilogGM-129-140.vcd

-> iverilog -o VerilogBM-129-140.vvp VerilogBM-129-140.v Verilog-129-140.v
-> vvp VerilogGM-129-140.vvp
-> gtkwave VerilogBM-129-140.vcd
------------------------------------------------------------------------------------------------------------------------------------------------

How to use:

The switches of the players are pressed in any order.
The number of the player whose switch was pressed first is displayed on the display.
Pressing other player switches does not affect the winner's number on the display.
To reset, all the players' switches are switched off.
------------------------------------------------------------------------------------------------------------------------------------------------

Gate modelling
Modules included:

-> 4 bit bistable d-latch
-> active low output 10:4 priority encoder
-> Hex inverter
-> Hex to 7 segment decoder

------------------------------------------------------------------------------------------------------------------------------------------------

Thank you

