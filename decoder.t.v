// Decoder testbench
`timescale 1 ns / 1 ps
`include "decoder.v"

module testDecoder (); 
    reg addr0, addr1;
    reg enable;
    wire out0,out1,out2,out3;
    wire myout0, myout1, myout2, myout3;

    behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
    structuralDecoder my_decoder (myout0,myout1,myout2,myout3,addr0,addr1,enable); // Swap after testing

    initial begin
    $dumpfile("decoder.vcd");
    $dumpvars();
    $display(" Inputs | Ben Outputs | My Outputs  | ");
    $display("En A0 A1| O0 O1 O2 O3 | O0 O1 O2 O3 | Expected Output");
    enable=0;addr0=0;addr1=0; #500 
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    enable=0;addr0=1;addr1=0; #500
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    enable=0;addr0=0;addr1=1; #500 
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    enable=0;addr0=1;addr1=1; #500 
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    enable=1;addr0=0;addr1=0; #500 
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    enable=1;addr0=1;addr1=0; #500 
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    enable=1;addr0=0;addr1=1; #500 
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    enable=1;addr0=1;addr1=1; #500 
    $display("%b  %b  %b |  %b  %b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, addr0, addr1, out0, out1, out2, out3,myout0, myout1, myout2, myout3);
    end

endmodule
