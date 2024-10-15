module mux_4to1_slice(
	input x0,
	input x1,
	input x2,
	input x3,
	input [1:0] s,
	output f
);
	logic not_s0, not_s1, not_x0, not_x1, not_x2, not_x3;

	assign s0 = s[0];
	assign s1 = s[1];

// s0
nand2_delay u1(.a(s0), .b(s0), .y(not_s0));

// s1
nand2_delay u2(.a(s1), .b(s1), .y(not_s1));

// x0
nand3_delay u3(.a(x0), .b(not_s1), .c(not_s0), .y(not_x0));

// x1
nand3_delay u4(.a(x1), .b(not_s1), .c(s0), .y(not_x1));

// x2
nand3_delay u5(.a(x2), .b(s1), .c(not_s0), .y(not_x2));

// x3
nand3_delay u6(.a(x3), .b(s1), .c(s0), .y(not_x3));

// f
nand4_delay u7(.a(not_x0), .b(not_x1), .c(not_x2), .d(not_x3), .y(f));

endmodule

