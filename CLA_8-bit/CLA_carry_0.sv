module CLA_carry_logic_0 
(
  input logic p0,
  input logic g0,
  input logic carry_in0,
  output logic carry_out0
);

    logic p0_nand_carry_in0;  
    logic g0_inv;  


  nand_2 u1 
  (
	  .a(p0), 
	  .b(ci0), 
	  .y(p0_nand_carry_in0)
	); 

  nand_2 u2 
  (
	  .a(g0), 
	  .b(g0), 
    .y(g0_inv)
	); 

  nand_2 u3  
  (
	  .a(p0_nand_carry_in0), 
    .b(g0_inv), 
    .y(carry_out0)
	); 

endmodule
