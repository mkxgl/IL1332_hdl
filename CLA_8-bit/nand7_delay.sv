module nand7_delay (
	input logic a,
	input logic b,
	input logic c,
	input logic d,
	input logic e,
	input logic f,
	input logic g,
	output logic y
);
	logic abcd, abcd_inv, efg, efg_inv;

	nand4_delay u1
	(
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.y(abcd)
	);

	nand3_delay u2
	(
		.a(e), 
		.b(f), 
		.c(g), 
		.y(efg)
	);

		// not_abcd
	nand2_delay u3
	(
		.a(abcd), 
		.b(abcd), 
		.y(abcd_inv)
	);

		// not_efg
	nand2_delay u4
	(
		.a(efg), 
		.b(efg), 
		.y(efg_inv)
	);

		// not_abcd & not_efg
	nand2_delay u5
	(
		.a(abcd_inv), 
		.b(efg_inv), 
		.y(y)
	);

endmodule
