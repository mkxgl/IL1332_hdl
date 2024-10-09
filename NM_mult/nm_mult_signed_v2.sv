module mult_NMbit #(parameter N=4, parameter M=5) 
(
	input logic [N-1:0] A,
	input logic [M-1:0] B,
	output logic [(N+M)-1:0] Prod
);

logic [(M-1):0][(N-1):0] prod_terms; // mult matrix N x M
logic [(M-2):0][(N-1):0] A_temp;
logic [(M-2):0][(N-1):0] B_temp;
logic [(M-2):0][(N-1):0] Sum;
logic carry_out [(M-2):0];

//sign bits of A and B inputs as well as axorb result
logic sign_A;
logic sign_B;
logic sign_AxorB; //this will be used for a xor b to check if exclusively one is neg
logic [(N+M)-1:0] unsign_Prod; //product is unsigned

//This is to check if A or B is negative, and then doing the xor operation
assign sign_A = A[N-1];
assign sign_B = B[M-1];
assign sign_AxorB = sign_A ^ sign_B; // if this is 1, then the result will be neg

// loop: if MSB A == 1: sign_A till unsigned_A 2s complement
always @(*) begin
	if (sign_A == 1) begin
		A = ~A + 1;
	end
// loop: if MSB A == 1: sign_A till unsigned_A 2s complement
	if (sign_B == 1) begin
		B = ~B + 1;
	end
end

// Generate block to create the four product terms
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

//assign Prod[0] = prod_terms[0][0];
assign unsign_Prod[0] = prod_terms[0][0];


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

//assign Prod[(N+M)-2:(M-1)] = Sum[M-1];
//assign Prod[(N+M)-1] = carry_out[M-1];
assign Prod [(N+M)-2:(M-1)] = Sum [M-2];
assign Prod [(N+M)-1] = carry_out [M-2];

//Now in the end, if A XOR B == 1, then we'll apply 2's complement to the result to make it neg
always @(*) begin
	if (sign_AxorB == 1) begin
		Prod = ~unsign_Prod + 1; // Two's complement if A xor B == 1
	end
	else
		Prod = unsign_Prod; //If A xor B != 1, then unsigned product remains the same number
	end

endmodule
