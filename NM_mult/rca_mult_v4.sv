module mult_NMbit #(parameter N=4, parameter M=5) 
(
	input logic [N-1:0] A,
	input logic [M-1:0] B,
	//output logic [(N-1)*(M-1):0]
	output logic [(N+M)-1:0] Prod
);

logic [(M-1):0][(N-1):0] prod_terms; // mult matrix N x M
logic [(M-2):0][(N-1):0] A_temp;
logic [(M-2):0][(N-1):0] B_temp;
logic [(M-2):0][(N-1):0]Sum;
logic carry_out [(M-2):0];

// Generate block to create the MxN product terms fill the matrix row by row
genvar x, y;
generate
	for (x = 0; x < M; ++x) begin : B_loop
		for (y = 0; y < N; ++y) begin : A_loop

		and2_delay u_and 
		(
			.b(B[x]),
			.a(A[y]),
			.y(prod_terms[x][y])
		);
		end
	end
endgenerate

assign Prod[0] = prod_terms [0][0];

// first sum init

	assign A_temp [0][N-1] = 1'b0; 
	assign A_temp [0][(N-2):0] = prod_terms [0][(N-1):1]; 
	assign B_temp [0]= prod_terms [1];

rca_Nbit_co #(N) u0
(
	.A(A_temp[0]), 
	.B(B_temp[0]), 
	.cin(1'b0),
	.Sum(Sum[0]),
	.co(carry_out[0])
);

// loop for RCAs
genvar k;
generate
	for (k = 1; k < M-1; ++k) begin : RCA_loop
		assign A_temp [k][N-1] = carry_out [k-1];
		assign A_temp [k][(N-2):0] = Sum [k-1][(N-1):1];
		assign Prod [k] = Sum [k-1][0];
		assign B_temp [k]= prod_terms [k + 1];

		rca_Nbit_co #(N) uk 
		(
			.A(A_temp[k]),
			.B(B_temp[k]),
			.cin(1'b0),
			.Sum(Sum[k]),
			.co(carry_out[k]) 
		);
	end
endgenerate

assign Prod [(N+M)-2:(M-1)] = Sum [M-2];
assign Prod [(N+M)-1] = carry_out [M-2];

endmodule
