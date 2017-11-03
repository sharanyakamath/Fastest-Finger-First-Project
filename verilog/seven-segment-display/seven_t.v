    `timescale 1ns / 1ps
    module stimulus;
    	// Inputs
    	reg [3:0] x;
    	// Outputs
    	wire [6:0] z;
    	// Instantiate the Unit Under Test (UUT)
    	hexto7segment uut (
    		.x(x), 
    		.z(z)
    	);
     
    	initial begin
    		// Initialize Inputs
    		x = 0;
     
    	#20 x = 1;
    	#20 x = 2;
    	#20 x = 3;	
    	#20 x = 4;	
    	#40;
        end  
     
    		initial begin
    		 $monitor("x=%h,z=%7b",x,z);
    		 end
     
    endmodule
