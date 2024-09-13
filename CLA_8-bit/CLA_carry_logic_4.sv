module CLA_carry_logic_4 
(
	input logic g4,
  input logic g3,
  input logic g2,
  input logic g1,
  input logic g0,
	input logic p4,
  input logic p3,
  input logic p2,
  input logic p1,
  input logic p0,
  input logic carry_in_0,
  output logic carry_out
);

  logic g4_inv;  
  logic p4_nand_g3;
	logic p4_nand_p3_nand_g2;
	logic p4_nand_p3_nand_p2_nand_g1;
	logic p4_nand_p3_nand_p2_nand_p1_nand_g0;
	logic p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0;

nand2_delay u1 
(
	.a(g4), 
	.b(g4), 
	.y(g4_inv)
); 

nand2_delay u2 
(
	.a(p4), 
	.b(g3), 
	.y(p4_nand_g3)
); 

nand3_delay u3 
(
	.a(p4), 
	.b(p3), 
	.c(g2),
	.y(p4_nand_p3_nand_g2)
); 

nand4_delay u4
(
	.a(p4),
	.b(p3),
	.c(p2),
	.d(g1),
	.y(p4_nand_p3_nand_p2_nand_g1)
);

nand5_delay u5 
(
	.a(p4), 
	.b(p3), 
	.c(p2),
	.d(p1),
	.e(g0),
  .y(p4_nand_p3_nand_p2_nand_p1_nand_g0)
); 

nand6_delay u6
( 
	.a(p4), 
	.b(p3), 
	.c(p2),
	.d(p1),
	.e(p0),
	.f(carry_in_0),
  .y(p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0)
); 

nand6_delay u7
( 
	.a(g4_inv), 
	.b(p4_nand_g3), 
	.c(p4_nand_p3_nand_g2),
	.d(p4_nand_p3_nand_p2_nand_g1),
	.e(p4_nand_p3_nand_p2_nand_p1_nand_g0),
	.f(p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0),
  .y(carry_out)
); 

endmodule