module generate_logic 
  (
    input logic a,
    input logic b,
    output logic g
  );
    logic a_nand_b;  

  nand2_delay u1 // NANDing A and B
  (
	  .a(a), 
	  .b(b), 
    .y(a_nand_b)
	); 

  nand2_delay u2 // inverting the nand output to get the "A and B" function for generate
  (
	  .a(a_nand_b), 
	  .b(a_nand_b), 
	  .y(g)
	); 

endmodule
