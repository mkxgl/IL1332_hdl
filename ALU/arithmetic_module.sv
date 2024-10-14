module arithmetic_module(
	input logic [1:0] m,
	input logic [7:0] X,
	input logic [7:0] Y,
	output logic [15:0] Z
	);


	logic [7:0] X_input_add_sub;
	logic [7:0] Y_input_add_sub;


	logic [7:0] X_input_mult_10;
	logic [7:0] Y_input_mult_10;

	
	
	logic [6:0] extend_output_add_sub;

	logic [15:0] extended_result_add;
	logic [15:0] extended_result_sub;

	logic [15:0] output_mult;

	logic select_add;
	logic select_sub;
	assign select_add = 1'b0;
	assign select_sub = 1'b1;
	
	assign extend_output_add_sub = 7'b0;
	assign extended_result_add[15:9] = extend_output_add_sub;
	assign extended_result_sub[15:9] = extend_output_add_sub;



//demux X
Nbit_4to1_demux #(8) u1 ( .I(X), .s(m), .X0(X_input_add_sub), .X1(X_input_add_sub), .X2(X_input_mult_10), .X3() );

//demux Y
Nbit_4to1_demux #(8) u2( .I(Y), .s(m), .X0(Y_input_add_sub), .X1(Y_input_add_sub), .X2(Y_input_mult_10), .X3() );

//Multiplier
mult_NMbit_v4 #(8,8) u3 (.A(X_input_mult_10), .B(Y_input_mult_10), .Prod(output_mult) );

// Adder
cla_sub_8bit u4 (.a(X_input_add_sub), .b_input(Y_input_add_sub), .sub(select_add), .sum(extended_result_add[8:0]) );

// Subtractor
cla_sub_8bit u5 (.a(X_input_add_sub), .b_input(Y_input_add_sub), .sub(select_sub), .sum(extended_result_sub[8:0]) );

// mux for output
mux4to1_Nbit #(16) u6 ( .A(extended_result_add), .B(extended_result_sub), .C(output_mult), .D(), .sel(m), .Y(Z) );

endmodule


