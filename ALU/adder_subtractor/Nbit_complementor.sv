`timescale 1ns / 1ps
module Nbit_complementor #(parameter N=8)
(
	input [N-1:0] B,
	input cin,
	output [N-1:0] Y
);

	genvar i;
	generate
		for(i = 0; i<N; i++) begin : xor_slice 
				xor2_delay xn(
					.a(cin),
					.b(B[i]),
					.y(Y[i])
				);
			end
		endgenerate

endmodule
