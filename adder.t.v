// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"
`define DELAY 500

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;
    wire my_sum, my_carryout;

    behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder my_adder (my_sum, my_carryout, a, b, carryin);

    initial begin
    	$dumpfile("adder.vcd");
    	$dumpvars();
        $display("One Bit Full Adder");
	    $display("A  B Cin | Cout Sum | BenCout BenSum | MyCout MySum");            // Prints header for truth table
	    a=0;b=0;carryin = 0; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  0    0  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    a=0;b=0;carryin = 1; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  0    1  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    a=0;b=1;carryin = 0; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  0    1  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    a=0;b=1;carryin = 1; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  1    0  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    a=1;b=0;carryin = 0; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  0    1  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    a=1;b=0;carryin = 1; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  1    0  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    a=1;b=1;carryin = 0; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  1    0  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    a=1;b=1;carryin = 1; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b  %b  %b  |  1    1  |    %b      %b    |    %b     %b  ", a, b, carryin, carryout, sum, my_carryout, my_sum);
	    
	    
    end
endmodule
