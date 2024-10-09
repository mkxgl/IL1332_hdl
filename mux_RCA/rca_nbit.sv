module rca_nbit #(parameter N = 6)(
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	input logic cin,	
	output logic [N-1:0] sum,
	output logic cout

);

	logic carry[N-1:0];


	// slice 0 sum logic
	mux_sum_logic u1(.a(A[0]), .b(B[0]), .c_in(cin), .sum(sum[0]) );

	// slice 0 carry out logic
	mux_carryOut_logic u2(.a(A[0]), .b(B[0]), .c_in(cin), .c_out(carry[0]) );
	// sum logic
	genvar i;
	generate
		for(i = 1; i<N; i++)
			begin : generate_sum
				mux_sum_logic sl(
					.a(A[i]),
					.b(B[i]),
					.c_in(carry[i-1]),
					.sum(sum[i])
				);
			end
		endgenerate

	// carry out logic
	genvar j;
	generate
		for(j = 1; j<N; j++)
			begin : generate_carry
				mux_carryOut_logic col(
						.a(A[j]),
						.b(B[j]),
						.c_in(carry[j-1]),
						.c_out(carry[j])
					);
				end
			endgenerate

	assign cout = carry[N-1];







endmodule
