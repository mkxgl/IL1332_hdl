module sum_logic 
(
  input logic a,
  input logic b,
  input logic carry_in,
  output logic s
);

  logic a_xor_b;  

xor2_delay u1 
(
	.a(a), 
	.b(b), 
  .y(a_xor_b)
); 

xor2_delay u2 
(
  .a(a_xor_b), 
  .b(carry_in), 
  .y(s)
); 

endmodule
