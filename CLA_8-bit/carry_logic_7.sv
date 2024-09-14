module CLA_carry_logic_7
(
  
  input logic g7, 
  input logic g6,  
  input logic g5,
  input logic g4,
  input logic g3,
  input logic g2,
  input logic g1,
  input logic g0,
  input logic p7,
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

  logic g7_inv;  
  logic p7_nand_g6;
	logic p7_nand_p6_nand_g5;
	logic p7_nand_p6_nand_p5_nand_g4;
	logic p7_nand_p6_nand_p5_nand_p4_nand_g3;
  logic p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_g2;
  logic p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_g1;
  logic p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0;
  logic p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0;

nand2_delay u1 
(
  .a(g7), 
  .b(g7), 
  .y(g7_inv)
); 

nand2_delay u2 
(
  .a(p7), 
  .b(g6), 
  .y(p7_nand_g6)
); 

nand3_delay u3 
(
  .a(p7), 
  .b(p6), 
  .c(g5),
  .y(p7_nand_p6_nand_g5)
); 

nand4_delay u4
(
  .a(p7),
  .b(p6),
  .c(p5),
  .d(g4),
  .y(p7_nand_p6_nand_p5_nand_g4)
);

nand5_delay u5 
(
  .a(p7), 
  .b(p6), 
  .c(p5),
  .d(p4),
  .e(g3),
  .y(p7_nand_p6_nand_p5_nand_p4_nand_g3)
); 

nand6_delay u6
(
  .a(p7), 
  .b(p6), 
  .c(p5),
  .d(p4),
  .e(p3),
  .f(g2),
  .y(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_g2)
); 
  
nand7_delay u7
(
  .a(p7), 
  .b(p6), 
  .c(p5),
  .d(p4),
  .e(p3),
  .f(p2),
  .g(g1),
  .y(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_g1)
); 

nand8_delay u7
(
  .a(p7), 
  .b(p6), 
  .c(p5),
  .d(p4),
  .e(p3),
  .f(p2),
  .g(p1),
  .h(g0),
  .y(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0)
); 

nand9_delay u8
(
  .a(p7), 
  .b(p6), 
  .c(p5),
  .d(p4),
  .e(p3),
  .f(p2),
  .g(p1),
  .h(p0),
  .i(carry_in_0),
  .y(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0)
);

nand9_delay u9
(
  .a(g7_inv), 
  .b(p7_nand_g6), 
  .c(p7_nand_p6_nand_g5),
  .d(p7_nand_p6_nand_p5_nand_g4),
  .e(p7_nand_p6_nand_p5_nand_p4_nand_g3),
  .f(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_g2),
  .g(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_g1),
  .h(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_g0),
  .i(p7_nand_p6_nand_p5_nand_p4_nand_p3_nand_p2_nand_p1_nand_p0_nand_carry_in_0),
  .y(carry_out)
);

endmodule
