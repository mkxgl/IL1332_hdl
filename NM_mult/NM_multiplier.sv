module mult_NMbit #(parameter N=4, parameter M=5) 
(
	input logic [N-1:0] A,
	input logic [M-1:0] B,
	//output logic [(N-1)*(M-1):0]
	output logic [(N+M)-1:0] Prod
);

logic [N-1:0][M-1:0] prod_terms; // mult matrix N x M
logic [(N-1):0] A_temp;
logic [(N-1):0] B_temp;
logic [N-1:0] Sum[M-1:0];
logic carry_out[M-1:0];

// Generate block to create the four product terms
genvar x, y;
generate
	for (x = 0; x < N; ++x) begin : A_loop
		for (y = 0; y < M; ++y) begin : B_loop

		and2_delay u_and 
		(
			.a(A[x]),
			.b(B[y]),
			.y(prod_terms[y][x])
		);
		end
	end
endgenerate

assign Prod[0] = prod_terms[0][0];

// first sum init

	assign A_temp[N-1] = 1'b0;
	assign A_temp[(N-2):0] = prod_terms[0][(N-1):1];
	assign B_temp = prod_terms[1];

rca_Nbit_co #(N) u0
(
	.A(A_temp),
	.B(B_temp),
	.cin(1'b0),
	.Sum(Sum[0]),
	.co(carry_out[0])
);

// loop for RCAs
genvar i;
generate
	for (i = 1; i < M; ++i) begin : RCA_loop
		logic [N-1:0] A_temp_i;
        logic [N-1:0] B_temp_i;

		assign A_temp_i[N-1] = carry_out[i-1];
		assign A_temp_i[(N-2):0] = Sum[i-1][(N-1):1];
		assign Prod[i] = Sum[i-1][0];
		assign B_temp_i = prod_terms[i + 1];

		rca_Nbit_co #(N) uk 
		(
			.A(A_temp_i),
			.B(B_temp_i),
			.cin(1'b0),
			.Sum(Sum[i]),
			.co(carry_out[i]) 
		);
	end
endgenerate

assign Prod[(N+M)-2:(M-1)] = Sum[M-1];
assign Prod[(N+M)-1] = carry_out[M-1];

endmodule
