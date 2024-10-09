module mux_carryOut_logic(
	input logic a,
	input logic b,
	input logic c_in,
	output logic c_out
);

	logic row1_1, row1_2, row1_3, row1_4, row2_1, row2_2;

// row a
mux_2to1_slice u1(.x0(1'b1), .x1(1'b1), .s(a), .f(row1_1) );

mux_2to1_slice u2(.x0(1'b0), .x1(1'b1), .s(a), .f(row1_2) );

mux_2to1_slice u3(.x0(1'b0), .x1(1'b1), .s(a), .f(row1_3) );

mux_2to1_slice u4(.x0(1'b0), .x1(1'b0), .s(a), .f(row1_4) );


// row b
mux_2to1_slice u5(.x0(row1_2), .x1(row1_1), .s(b), .f(row2_1) );

mux_2to1_slice u6(.x0(row1_4), .x1(row1_3), .s(b), .f(row2_2) );


// row c_in
mux_2to1_slice u7(.x0(row2_2), .x1(row2_1), .s(c_in), .f(c_out) );

endmodule
