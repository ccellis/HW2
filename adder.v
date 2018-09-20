// Adder circuit

`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input A, 
    input B, 
    input carryin
);
    wire AxorB;
    wire AxorBandC;
    wire AandB;

    `XOR AxorBgate(AxorB, A, B);
    `XOR AxorBxorCgate(sum, AxorB, carryin);
    `AND AandBgate(AandB,A,B);
    `AND AxorBandCgate(AxorBandC, AxorB, carryin);
    `OR  orgate(carryout, AxorBandC, AandB);

endmodule
