`timescale 1ns / 1ps
module Nbit_complementor #(parameter N=8)
(
	input [N-1:0] B, // 8 bit number lets say 0010 1100
	input cin, // 0?
	output [N-1:0] Y
);
	
	genvar i;
	generate
		for(i = 0; i < N; i++) begin : xor_slice 
			xor2_delay xn
			(
				.a(cin), // 1
				.b(B[i]), // 0010 1100
				.y(Y[i]) // 1101 0011
			);
			end
		endgenerate

endmodule
