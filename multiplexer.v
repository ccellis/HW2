// Multiplexer circuit

`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input S0, S1, //address0 = S0, address1 = S0
    input A, B, C, D
);
    wire nS0;
    wire nS1;
    wire AS0;
    wire BS0;
    wire CS0;
    wire DS0;
    wire AS1;
    wire BS1;
    wire CS1;
    wire DS1;
    wire AorB;
    wire CorD;

    `NOT S0inv(nS0, S0);
    `NOT S1inv(nS1, S1);

    `AND Aand1gate(AS0, A, nS0);
    `AND Band1gate(BS0, B, S0);
    `AND Cand1gate(CS0, C, nS0);
    `AND Dand1gate(DS0, D, S0);

    `AND Aand2gate(AS1, AS0, nS1);
    `AND Band2gate(BS1, BS0, nS1);
    `AND Cand2gate(CS1, CS0, S1);
    `AND Dand2gate(DS1, DS0, S1);

    `OR  AorBgate(AorB, AS1, BS1);
    `OR  CorDgate(CorD, CS1, DS1);
    `OR  orgate(out, AorB, CorD);
    
endmodule

