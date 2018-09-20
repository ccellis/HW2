// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input A, B, //A = address0, B = address1
    input enable
);
    wire nA;
    wire nB;
    wire and0;
    wire and1;
    wire and2;
    wire and3;

    `NOT Ainv(nA, A);
    `NOT Binv(nB, B);
    `AND and1gate(and0, nA, nB);
    `AND and2gate(and1, A, nB);
    `AND and3gate(and2, nA, B);
    `AND and4gate(and3, A, B);
    `AND out1gate(out0, and0, enable);
    `AND out2gate(out1, and1, enable);
    `AND out3gate(out2, and2, enable);
    `AND out4gate(out3, and3, enable);
endmodule

