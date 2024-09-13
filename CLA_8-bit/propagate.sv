module propagate_logic 
  (
    input logic a,
    input logic b,
    output logic p
  );

  logic a_inv;  
  logic b_inv;  

  nand2_delay u1 
  (
	  .a(a), 
	  .b(a), 
    .y(a_inv)
	); 

  nand2_delay u2 
  (
	  .a(b), 
	  .b(b), 
    .y(b_inv)
	); 

  nand2_delay u3 
  (
    .a(a_inv), 
    .b(b_inv), 
	  .y(p)
	); 
  
endmodule
