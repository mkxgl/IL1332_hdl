module carry_logic_6
(
  input logic g6,  
  input logic g5,
  input logic g4,
  input logic g3,
  input logic g2,
  input logic g1,
  input logic g0,
  input logic p6,
	input logic p5,
  input logic p4,
  input logic p3,
  input logic p2,
  input logic p1,
  input logic p0,
  input logic carry_in_0,
  output logic carry_out
);

  logic g6_inv;  
  logic p6_nand_g5;
	logic p6_nand_p5_nand_g4;
	logic p6_nand_p5_nand_p4_nand_g3;
	logic p6_nand_p5_nand_p4_nand_p3_nand_g2;
  logic p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_g1;
  logic p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0;
  logic p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0;

nand2_delay u1 
(
  .a(g6), 
  .b(g6), 
  .y(g6_inv)
); 

nand2_delay u2 
(
  .a(p6), 
  .b(g5), 
  .y(p6_nand_g5)
); 

nand3_delay u3 
(
  .a(p6), 
  .b(p5), 
  .c(g4),
  .y(p6_nand_p5_nand_g4)
); 

nand4_delay u4
(
  .a(p6),
  .b(p5),
  .c(p4),
  .d(g3),
  .y(p6_nand_p5_nand_p4_nand_g3)
);

nand5_delay u5 
(
  .a(p6), 
  .b(p5), 
  .c(p4),
  .d(p3),
  .e(g2),
  .y(p6_nand_p5_nand_p4_nand_p3_nand_g2)
); 

nand6_delay u6
(
  .a(p6), 
  .b(p5), 
  .c(p4),
  .d(p3),
  .e(p2),
  .f(g1),
  .y(p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_g1)
); 
  
nand7_delay u7
(
  .a(p6), 
  .b(p5), 
  .c(p4),
  .d(p3),
  .e(p2),
  .f(p1),
  .g(g0),
  .y(p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0)
); 

nand8_delay u8
(
  .a(p6), 
  .b(p5), 
  .c(p4),
  .d(p3),
  .e(p2),
  .f(p1),
  .g(p0),
  .h(carry_in_0),
  .y(p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0)
); 

nand8_delay u9
(
  .a(g6_inv), 
  .b(p6_nand_g5), 
  .c(p6_nand_p5_nand_g4),
  .d(p6_nand_p5_nand_p4_nand_g3),
  .e(p6_nand_p5_nand_p4_nand_p3_nand_g2),
  .f(p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_g1),
  .g(p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0),
  .h(p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0),
  .y(carry_out)
);

endmodule
