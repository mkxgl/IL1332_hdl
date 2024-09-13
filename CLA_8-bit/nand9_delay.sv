module nand8_delay (
	input logic a,
	input logic b,
	input logic c,
	input logic d,
	input logic e,
	input logic f,
	input logic g,
	input logic h,
	input logic i,
	output logic y
);
	logic abcd, abcd_inv, efghi, efghi_inv;

	nand4_delay u1
	(
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.y(abcd)
	);

	nand5_delay u2
	(
		.a(e), 
		.b(f), 
		.c(g), 
		.d(h), 
		.e(i), 
		.y(efghi)
	);

		// not_abcd
	nand2_delay u3
	(
		.a(abcd), 
		.b(abcd), 
		.y(abcd_inv)
	);

		// not_efghi
	nand2_delay u4
	(
		.a(efghi), 
		.b(efghi), 
		.y(efghi_inv)
	);

		// not_abcd & not_efghi
	nand2_delay u5
	(
		.a(abcd_inv), 
		.b(efghi_inv), 
		.y(y)
	);

endmodule
