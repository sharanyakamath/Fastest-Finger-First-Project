`timescale 1ns/100ps
 module ic7475_tb;
 wire p16,p15,p10,p9; 
 reg p2,p3,p6,p7,p13,p4;

 ic7475 uut(p2,p3,p6,p7,p13,p4,p16,p15,p10,p9);
 initial begin
		p2=1'b0;
		p3=1'b0;
		p6=1'b0;
		p7=1'b0;
	        p13=1'b0;
                p4=1'b0;
            
		$dumpfile("ddsproject.vcd");
		$dumpvars(0,ic7475_tb);
		$monitor(" inputs = %b%b%b%b\tenable1=%d\tenable2=%d\t d1=%d\td2=%d\td3=%d\td4=%d\t",p2,p3,p6,p7,p13,p4,p16,p15,p10,p9);
               
#2 begin p2=1'b1; p3=1'b0; p6=1'b1; p7=1'b1; end
#2 begin p2=1'b0; p3=1'b0; p6=1'b1; p7=1'b0; end
#2 begin p2=1'b0; p3=1'b0; p6=1'b1; p7=1'b1; end
#2 begin p2=1'b0; p3=1'b1; p6=1'b0; p7=1'b0; end
#2 begin p2=1'b1; p3=1'b0; p6=1'b1; p7=1'b0; end
end
	
	always
          #5 p13 = ~p13;
        always
          #5 p4=~p4;

	initial #50 $finish;
 endmodule
