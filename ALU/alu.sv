module alu
(
    input logic [7:0] x,
    input logic [7:0] y,
    input logic [1:0] m,
    input logic [1:0] s,
    output logic [15:0] z
);
    
    logic [15:0] arithmetic_result;
    logic [15:0] shifter_result;
    logic [15:0] comparator_result;
    logic [15:0] logic_result;

    arithmetic_unit arithmetic 
    (
        .x(x),
        .y(y),
        .m(m),
        .z(arithmetic_result)
    );

    shifter_rotator_unit shifter 
    (
        .x(x),
        .y(y),
        .m(m),
        .z(shifter_result)
    );

    comparator_unit comparator 
    (
        .x(x),
        .y(y),
        .m(m),
        .z(comparator_result)
    );

    logic_unit logic_op 
    (
        .x(x),
        .y(y),
        .m(m),
        .z(logic_result)
    );

    always_comb begin
        case (s)
            2'b00: z = arithmetic_result;
            2'b01: z = shifter_result;
            2'b10: z = comparator_result;
            2'b11: z = logic_result;
            default: z = 16'b0;
        endcase
    end
endmodule
