module CLA_carry_logic_0 
(
  input logic p0,
  input logic g0,
  input logic carry_in_0,
  output logic carry_out
);
	logic p0_nand_carry_in_0;  
  logic g0_inv;  


  nand2_delay u1 
	(
	  .a(p0), 
	  .b(carry_in_0), 
	  .y(p0_nand_carry_in_0)
	); 

  nand2_delay u2 
  (
	  .a(g0), 
	  .b(g0), 
    .y(g0_inv)
	); 

  nand2_delay u3  
  (
	  .a(p0_nand_carry_in_0), 
    .b(g0_inv), 
		.y(carry_out)
	); 

endmodule
