`timescale 1ns / 1ps
module Nbit_complementor #(parameter N=8)
(
	input [N-1:0] B, // 8 bit number lets say 0010 1100
	input cin,
	output [N-1:0] Y // 2s complement, should be 1101 0100
);

	genvar i;
	generate
		for(i = 0; i < N; i++) begin : xor_slice 
				xor2_delay xn(
					.a(cin),
					.b(B[i]),
					.y(Y[i])
				);
			end
		endgenerate

endmodule
