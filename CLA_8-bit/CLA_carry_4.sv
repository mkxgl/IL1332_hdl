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

  logic nand1_out;  
  logic nand2_out;
	logic nand3_out;
	logic nand4_out;

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
	.a(p4), 
	.b(p3), 
	.c(p2),
	.d(p1),
	.e(p0),
  .f(carry_in0),
  .y(carry_out)
); 

endmodule
