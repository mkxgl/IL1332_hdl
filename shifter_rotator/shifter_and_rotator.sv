module shifter_and_rotator //#(parameter N)
(
	input logic[7:0] x,
	input logic[1:0] select,
	output logic[7:0] y
	
);
	logic select_mux_out;
	logic [7-1:0] shift_right; // intermediate signals between the muxes
	logic [7-1:0] shift_left;  // intermediate signals between the muxes

	// kanske inte behövs
	//logic rotate_right_x0;  // x_0
	//logic rotate_left_x7;   // x_7

	// left and right input
	logic left_and_right_input;
	
 // left + right input mux
mux_4to1_slice u1 (.x0(1'b0), .x1(1'b0), .x2(x[7]), .x3(x[0]), .s(select), .f(left_and_right_input) );


// left most mux x7
mux_4to1_slice u2 (.x0(x[6]), .x1(left_and_right_input), .x2(x[6]), .x3(left_and_right_input), .s(select), .f(y[7]) );

	genvar i;
	generate
		for(i = 1; i<7; i++)
			begin : mux_4to1_slice 
				mux_4to1_slice sl(
					.x0(x[i-1]),
					.x1(x[i+1]),
					.x2(x[i-1]),
					.x3(x[i+1]),
					.s(select),
					.f(y[i])
				);
			end
		endgenerate

// x6
//mux_4to1_slice u3 (.x0(x[5]), .x1(x[7]), .x2(x[5]), .x3(x[7]), .s(select), .f(y[1]) );

// x5
//mux_4to1_slice u4 (.x0(x[4]), .x1(x[6]), .x2(x[4]), .x3(x[6]), .s(select), .f(y[2]) );

// x4
//mux_4to1_slice u5 (.x0(x[3]), .x1(x[5]), .x2(x[3]), .x3(x[5]), .s(select), .f(y[3]) );

// x3
//mux_4to1_slice u6 (.x0(x[2]), .x1(x[4]), .x2(x[2]), .x3(x[4]), .s(select), .f(y[4]) );

// x2
//mux_4to1_slice u7 (.x0(x[1]), .x1(x[3]), .x2(x[1]), .x3(x[3]), .s(select), .f(y[5]) );

// x1
//mux_4to1_slice u8 (.x0(x[0]), .x1(x[2]), .x2(x[0]), .x3(x[2]), .s(select), .f(y[6]) );

// right most mux x0
mux_4to1_slice u9 (.x0(left_and_right_input), .x1(x[1]), .x2(left_and_right_input), .x3(x[1]), .s(select), .f(y[0]) );

endmodule