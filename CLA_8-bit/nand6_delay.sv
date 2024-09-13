module nand6_delay (
	input logic a,
	input logic b,
	input logic c,
	input logic d,
	input logic e,
	input logic f,
	output logic out
);
	logic abc, abc_inv, def, def_inv;

	nand3_delay u1
	(
		.a(a), 
		.b(b), 
		.c(c), 
		.y(abc)
	);

	nand3_delay u2
	(
		.a(d), 
		.b(e), 
		.c(f), 
		.y(def)
	);

	nand2_delay u3
	(
		.a(abc), 
		.b(abc), 
		.y(abc_inv)
	);

	nand2_delay u4
	(
		.a(def), 
		.b(def), 
		.y(def_inv)
	);

	nand2_delay u5
	(
		.a(abc_inv), 
		.b(def_inv), 
		.y(y)
	);

endmodule