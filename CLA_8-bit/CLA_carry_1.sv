module CLA_carry_logic_1 
(
  input logic g1,
  input logic p1,
  input logic p0,
  input logic g0,
  input logic carry_in0,
  output logic carry_out
);

  logic g1_inv;  
  logic p1_nand_g0;
	logic p1_nand_p0_nand_carry_in0;

nand2_delay u1 
(
	.a(g1), 
	.b(g1), 
	.y(g1_inv)
); 

nand2_delay u2 
(
	.a(p1), 
	.b(g0), 
	.y(p1_nand_g0)
); 

nand3_delay u3 
(
	.a(p1), 
	.b(p0), 
	.c(carry_in0),
	.y(p1_nand_p0_nand_carry_in0)
); 

nand_3 u4 
(
	.a(g1_inv), 
	.b(p1_nand_g0), 
	.c(p1_nand_p0_nand_carry_in0),
	.y(carry_out)
); 

endmodule
