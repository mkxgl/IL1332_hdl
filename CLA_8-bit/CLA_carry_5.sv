module CLA_carry_logic_5 
(
	input logic g5,
  input logic g4,
  input logic g3,
  input logic g2,
  input logic g1,
  input logic g0,
	input logic p5,
  input logic p4,
  input logic p3,
  input logic p2,
  input logic p1,
  input logic p0,
  input logic carry_in_0,
  output logic carry_out
);

  logic g5_inv;  
  logic p5_nand_g4;
	logic p5_nand_p4_nand_g3;
	logic p5_nand_p4_nand_p3_nand_g2;
	logic p5_nand_p4_nand_p3_nand_p2_nand_g1;
  logic p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0;

nand2_delay u1 
(
  .a(g5), 
  .b(g5), 
  .y(g5_inv)
); 

nand2_delay u2 
(
  .a(p5), 
  .b(g4), 
  .y(p5_nand_g4)
); 

nand3_delay u3 
(
  .a(p5), 
  .b(p4), 
  .c(g3),
  .y(p5_nand_p4_nand_g3)
); 

nand4_delay u4
(
  .a(p5),
  .b(p4),
  .c(p3),
  .d(g2),
  .y(p5_nand_p4_nand_p3_nand_g2)
);

nand5_delay u5 
(
  .a(p5), 
  .b(p4), 
  .c(p3),
  .d(p2),
  .e(g1),
  .y(p5_nand_p4_nand_p3_nand_p2_nand_g1)
); 

nand6_delay u6
(
  .a(p5), 
  .b(p4), 
  .c(p3),
  .d(p2),
  .e(p1),
  .f(g0),
  .y(p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0)
); 
  
nand7_delay u7
(
  .a(p5), 
  .b(p4), 
  .c(p3),
  .d(p2),
  .e(p1),
  .f(p0),
  .g(carry_in_0)
  .y(carry_out)
); 

endmodule
