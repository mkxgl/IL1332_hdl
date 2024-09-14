module CLA_carry_logic_3 
(
	input logic g3,
 	input logic g2,
	input logic g1,
  	input logic g0,
	input logic p3,
	input logic p2,
	input logic p1,
 	input logic p0,
  	input logic carry_in_0,
  	output logic carry_out
);

  	logic g3_inv;  
  	logic p3_nand_g2;
	logic p3_nand_p2_nand_g1;
	logic p3_nand_p2_nand_p1_nand_g0;
	logic p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0;

nand2_delay u1 
(
	.a(g3), 
	.b(g3), 
	.y(g3_inv)
); 

nand2_delay u2 
(
	.a(p3), 
	.b(g2), 
	.y(p3_nand_g2)
); 

nand3_delay u3 
(
	.a(p3), 
	.b(p2), 
	.c(g1),
	.y(p3_nand_p2_nand_g1)
); 

nand4_delay u4
(
	.a(p3),
	.b(p2),
	.c(p1),
	.d(g0),
	.y(p3_nand_p2_nand_p1_nand_g0)
);
	

nand5_delay u5
(
	.a(p3),
	.b(p2),
	.c(p1),
	.d(p0),
	.e(ci0),
	.y(p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0)
);

nand5_delay u6 
(
	.a(g3_inv), 
	.b(p3_nand_g2), 
	.c(p3_nand_p2_nand_g1),
	.d(p3_nand_p2_nand_p1_nand_g0),
	.e(p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0),
	.y(carry_out)
); 

endmodule
