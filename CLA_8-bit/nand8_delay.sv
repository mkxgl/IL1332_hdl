module nand8_delay (
	input logic a,
	input logic b,
	input logic c,
	input logic d,
	input logic e,
	input logic f,
	input logic g,
	input logic h,
	output logic y
);
	logic abcd, abcd_inv, efgh, efgh_inv;

	nand4_delay u1
	(
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.y(abcd)
	);

	nand4_delay u2
	(
		.a(e), 
		.b(f), 
		.c(g), 
		.d(h), 
		.y(efgh)
	);

		// not_abcd
	nand2_delay u3
	(
		.a(abcd), 
		.b(abcd), 
		.y(abcd_inv)
	);

		// not_efgh
	nand2_delay u4
	(
		.a(efgh), 
		.b(efgh), 
		.y(efgh_inv)
	);

		// not_abcd & not_efgh
	nand2_delay u5
	(
		.a(abcd_inv), 
		.b(efgh_inv), 
		.y(y)
	);

endmodule
