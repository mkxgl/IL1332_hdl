module Nbit_4to1_demux#(parameter N=5)(
	
	input [N-1:0] I,
	input [1:0] s,
	output [N-1:0] X0,
	output [N-1:0] X1,
	output [N-1:0] X2,
	output [N-1:0] X3

);

genvar i;
	generate
		for(i=0; i<N; ++i) begin : demux_4to1_slice
			demux_4to1_slice sn(.i(I[i]),
						.s(s),
						.x0(X0[i]),
						.x1(X1[i]),
						.x2(X2[i]),
						.x3(X3[i])
						);
		end
	endgenerate
endmodule
