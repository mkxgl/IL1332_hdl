`timescale 1ns / 1ps
module tb_parallel_comparator_8bit;

   
   
   logic [7:0] A;
   logic [7:0] B;
   logic         g, l;

  // Instantiate the comparator
   parallel_comparator_8bit uut (
    .A(A),
    .B(B),
    .g(g),
    .l(l)   
  );

 

  initial begin
     A = 255;
     B = 0;
     #30;

     A = 144;
     B = 88;
     #30;

     A = 88;
     B = 88;
     #30;

     A = 0;
     B = 1;
     #30;

    $stop;
  end

endmodule
