module demux_4to1_slice(
	input i,
	input [1:0] s,
	output x0,
	output x1,
	output x2,
	output x3

);
	logic not_s0, not_s1, not_x0, not_x1, not_x2, not_x3;

	assign s0 = s[0];
	assign s1 = s[1];

// ~s0
nand2_delay u1(.a(s0), .b(s0), .y(not_s0));

// ~s1
nand2_delay u2(.a(s1), .b(s1), .y(not_s1));

// ~x0
nand3_delay u3(.a(i), .b(not_s1), .c(not_s0), .y(not_x0));

// ~x1
nand3_delay u4(.a(i), .b(not_s1), .c(s0), .y(not_x1));

// ~x2
nand3_delay u5(.a(i), .b(s1), .c(not_s0), .y(not_x2));

// ~x3
nand3_delay u6(.a(i), .b(s1), .c(s0), .y(not_x3));


// x0
nand2_delay u7(.a(not_x0), .b(not_x0), .y(x0));

// x1
nand2_delay u8(.a(not_x1), .b(not_x1), .y(x1));

// x2
nand2_delay u9(.a(not_x2), .b(not_x2), .y(x2));

// x3
nand2_delay u10(.a(not_x3), .b(not_x3), .y(x3));

endmodule

