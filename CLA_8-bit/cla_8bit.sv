module CLA_8bit
(
	input logic [7:0] A,
	input logic [7:0] B,
	output logic [8:0] S
);

	logic [7:0] P, G;
	logic [8:0] C;

	genvar i;
	generate
		for (i = 0; i < 8; ++i)
			begin: generate_PL
				propagate_logic pl
				(
					.a(A[i]),
					.b(B[i]),
					.p(P[i])
				);
			end
	endgenerate

	genvar j;
	generate
		for (j = 0; j < 8; ++j)
			begin: generate_GL
				generate_logic gl
				(
					.a(A[j]),
					.b(B[j]),
					.g(G[j])
				);
			end
	endgenerate

	genvar k;
	generate
		for (k = 0; k < 8; ++k)
			begin: generate_SL
				sum_logic sl
				(
					.a(A[k]),
					.b(B[k]),
					.carry_in(C[k])
					.s(S[k])
				);
			end
	endgenerate

	// Slice 0
	assign C[0] = 1'b0;

	// Slice 1
	CLA_carry_logic_0 cl0 
	(
		.p0(P[0]), 
		.g0(G[0]), 
		.carry_in_0(1'b0),
		.carry_out(C[1])
	);

	// Slice 2
	CLA_carry_logic_1 cl1 
	(
		.p0(P[0]),
		.g0(G[0]),
		.p1(P[1]),
		.g1(G[1]),
		.carry_in_0(C[1]),
		.carry_out(C[2])
	);

	// Slice 3
	CLA_carry_logic_2 cl2
	(
		.p0(P[0]),
		.g0(G[0]),
		.p1(P[1]),
		.g1(G[1]),
		.p2(P[2]),
		.g2(G[2]),
		.carry_in_0(C[2]),
		.carry_out(C[3])
	);

	// Slice 4
	CLA_carry_logic_3 cl3 
	(
		.p0(P[0]),
		.g0(G[0]),
		.p1(P[1]),
		.g1(G[1]),
		.p2(P[2]),
		.g2(G[2]),
		.p3(P[3]),
		.g3(G[3]),
		.carry_in_0(C[3]),
		.carry_out(C[4])
	);

	// Slice 5
	CLA_carry_logic_4 cl4
	(
		.p0(P[0]),
		.g0(G[0]),
		.p1(P[1]),
		.g1(G[1]),
		.p2(P[2]),
		.g2(G[2]),
		.p3(P[3]),
		.g3(G[3]),
		.p4(P[4]),
		.g4(G[4]),
		.carry_in_0(C[4]),
		.carry_out(C[5])
	);

	// Slice 6
	CLA_carry_logic_5 cl5 
	(
		.g0(G[0]),
		.p1(P[1]),
		.g1(G[1]),
		.p2(P[2]),
		.g2(G[2]),
		.p3(P[3]),
		.g3(G[3]),
		.p4(P[4]),
		.g4(G[4]),
		.p5(P[5]),
		.g5(G[5]),
		.carry_in_0(C[5]),
		.carry_out(C[6])
	);

	// Slice 7
	CLA_carry_logic_6 cl6 
	(
		.g0(G[0]),
		.p1(P[1]),
		.g1(G[1]),
		.p2(P[2]),
		.g2(G[2]),
		.p3(P[3]),
		.g3(G[3]),
		.p4(P[4]),
		.g4(G[4]),
		.p5(P[5]),
		.g5(G[5]),
		.p6(P[6]),
		.g6(G[6]),
		.carry_in_0(C[6]),
		.carry_out(C[7])
	);

	// Slice 8 with sign extension
	CLA_carry_logic_7 cl7 
	(
		.g0(G[0]),
		.p1(P[1]),
		.g1(G[1]),
		.p2(P[2]),
		.g2(G[2]),
		.p3(P[3]),
		.g3(G[3]),
		.p4(P[4]),
		.g4(G[4]),
		.p5(P[5]),
		.g5(G[5]),
		.p6(P[6]),
		.g6(G[6]),
		.p7(P[7]),
		.g7(G[7]),
		.carry_in_0(C[7]),
		.carry_out(C[8])
	);

endmodule
