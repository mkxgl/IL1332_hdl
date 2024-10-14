module alu
(
    input logic [7:0] X,
    input logic [7:0] Y,
    input logic [1:0] m,
    input logic [1:0] s,
    output logic [15:0] Z
);
    
    logic [15:0] arithmetic_result;
    logic [15:0] shifter_result;
    logic [15:0] comparator_result;
    logic [15:0] logic_result;

    arithmetic_unit arithmetic 
    (
        .X(X),
        .Y(Y),
        .m(m),
        .Z(arithmetic_result) // probably gotta use another name for the variable
    );

    shifter_rotator_unit shifter 
    (
        .X(X),
        .Y(Y),
        .m(m),
        .Z(shifter_result)
    );

    comparator_unit comparator 
    (
        .X(X),
        .Y(Y),
        .m(m),
        .Z(comparator_result)
    );

    logic_unit logic_op 
    (
        .X(X),
        .Y(Y),
        .m(m),
        .Z(logic_result)
    );

    always_comb begin
        case (s)
            2'b00: Z = arithmetic_result;
            2'b01: Z = shifter_result;
            2'b10: Z = comparator_result;
            2'b11: Z = logic_result;
            default: Z = 16'b0;
        endcase
    end
endmodule
