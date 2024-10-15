module alu
(
    input logic [7:0] X,
    input logic [7:0] Y,
    input logic [1:0] m,
    input logic [1:0] s,
    output logic [15:0] Z
);
    
	logic [7:0]X_input_arithmetic;
	logic [7:0]Y_input_arithmetic;

	logic [7:0]X_input_shifter;
	logic [7:0]Y_input_shifter;

	logic [7:0]X_input_comparator;
	logic [7:0]Y_input_comparator;

	logic [7:0]X_input_logic;
	logic [7:0]Y_input_logic;
	
	

    logic [15:0] arithmetic_result;
	logic [7:0] shifter_result_X;
	logic [7:0] shifter_result_Y;
    logic [15:0] shifter_result;
    logic [15:0] comparator_result;
    logic [15:0] logic_result;

	logic greater;
	logic lesser;
	
	
	assign shifter_result[15:8] = shifter_result_X;
	assign shifter_result[7:0] = shifter_result_Y;
	assign comparator_result[15:2] = 14'b0;
	assign comparator_result[1] = greater;
	assign comparator_result[0] = lesser;
	

//demux X
Nbit_4to1_demux #(8) u1 ( .I(X), .s(s), .X0(X_input_arithmetic), .X1(X_input_shifter), .X2(X_input_comparator), .X3(X_input_logic) );

//demux Y
Nbit_4to1_demux #(8) u2( .I(Y), .s(s), .X0(Y_input_arithmetic), .X1(Y_input_shifter), .X2(Y_input_comparator), .X3(Y_input_logic) );

    arithmetic_module arithmetic 
    (
        .X(X_input_arithmetic),
        .Y(Y_input_arithmetic),
        .m(m),
        .Z(arithmetic_result)
    );

    shifter_and_rotator shifter1 
    (
        .x(X_input_shifter),
	.select(m),
        .y(shifter_result_X)
    );

    shifter_and_rotator shifter2 
    (
        .x(Y_input_shifter),
	.select(m),
        .y(shifter_result_Y)
    );

    parallel_comparator_8bit comparator 
    (
        .A(X_input_comparator),
        .B(Y_input_comparator),
        .g(greater),
        .l(lesser)
    );



    logic_unit logic_op 
   (
        .X(X_input_logic),
        .Y(Y_input_logic),
        .s(m),
        .Z(logic_result)
    );

// mux for output
mux4to1_Nbit #(16) u6 ( .A(arithmetic_result), .B(shifter_result), .C(comparator_result), .D(logic_result), .sel(s), .Y(Z) );

//    always_comb begin
//        case (s)
//            2'b00: z = arithmetic_result;
//            2'b01: z = shifter_result;
//            2'b10: z = comparator_result;
//            2'b11: z = logic_result;
//            default: z = 16'b0;
//        endcase
//    end
endmodule