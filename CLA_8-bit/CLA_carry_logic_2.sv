module CLA_carry_logic_2 
(
	input logic g2,
	input logic g1,
	input logic g0,
	input logic p2,
    input logic p1,
    input logic p0,
    input logic carry_in_0,
    output logic carry_out
);

  	logic g2_inv;  
  	logic p2_nand_g1;
	logic p2_nand_p1_nand_g0;
	logic p2_nand_p1_nand_p0_nand_carry_in_0;

nand2_delay u1 
(
	.a(g2), 
	.b(g2), 
	.y(g2_inv)
); 

nand2_delay u2 
(
	.a(p2), 
	.b(g1), 
	.y(p2_nand_g1)
); 

nand3_delay u3 
(
	.a(p2), 
	.b(p1), 
	.c(g0),
	.y(p2_nand_p1_nand_g0)
); 

nand4_delay u4
(
	.a(p2),
	.b(p1),
	.c(p0),
	.d(carry_in_0),
	.y(p2_nand_p1_nand_p0_nand_carry_in_0)
);

nand4_delay u5 
(
	.a(g2_inv), 
	.b(p2_nand_g1), 
	.c(p2_nand_p1_nand_g0),
	.d(p2_nand_p1_nand_p0_nand_carry_in_0),
	.y(carry_out)
); 

endmodule
