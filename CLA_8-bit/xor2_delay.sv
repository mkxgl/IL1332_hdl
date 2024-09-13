module xor2_delay 
( 
	input logic a, 
	input logic b, 
	output logic y
); 

logic a_nand_b, a_nand(a_nand_b), b_nand(a_nand_b);

nand2_delay u1 
(
    .a(a), 
    .b(b), 
    .y(a_nand_b)
);

nand2_delay u2 
(
  .a(a), 
  .b(a_nand_b), 
  .y(a_nand(a_nand_b))
);

nand2_delay u3 
(
  .a(b), 
  .b(a_nand_b), 
  .y(b_nand(a_nand_b))
);

nand2_delay u4 
(
  .a(a_nand(a_nand_b)), 
  .b(b_nand(a_nand_b)), 
  .y(y)
);

endmodule
