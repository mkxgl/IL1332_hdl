module logic_unit
(
	input logic [7:0] X,
	input logic [7:0] Y,
	input logic [1:0] s,
	output logic [15:0] Z
);

		// LOGIC OPERATIONS //
	logic [7:0] and_result;
	logic [7:0] nand_result;
	logic [7:0] or_result;
	logic [7:0] not_X;
	logic [7:0] not_X_result;
	logic [7:0] not_Y;
	logic [7:0] not_Y_result;
	logic [7:0] xor_result;
		
	genvar i;
	// AND
	generate
		for (i = 0; i < 8; ++i) begin: and_operation
			nand2_delay nand_X_Y
			(
				.a(X[i]),
				.b(Y[i]),
				.y(nand_result[i])
			);

			nand2_delay not_nand
			(
				.a(nand_result[i]),
				.b(nand_result[i]),
				.y(and_result[i])
			);
		end
	endgenerate

	// OR
	generate
		for (i = 0; i < 8; ++i) begin: or_operation
			nand2_delay not_X2
			(
				.a(X[i]),
				.b(x[i]),
				.y(not_X_result[i])
			);

			nand2_delay not_Y2
			(
				.a(Y[i]),
				.b(Y[i]),
				.y(not_Y_result[i])
			);

			nand2_delay nand_notX_noty
			(
				.a(not_X_result[i]),
				.b(not_Y_result[i]),
				.y(or_result[i])
			);
		end
	endgenerate	

	// NOT X
	generate
		for (i = 0; i < 8; ++i) begin: not_X_operation
			nand2_delay not_X
			(
				.a(X[i]),
				.b(X[i]),
				.y(not_X[i])
			);
		end
	endgenerate	

	// NOT Y
	generate
		for (i = 0; i < 8; ++i) begin: not_Y_operation
			nand2_delay not_Y
			(
				.a(Y[i]),
				.b(Y[i]),
				.y(not_Y[i])
			);
		end
	endgenerate

	// XOR
	generate
		for (i = 0; i < 8; ++i) begin: xor_operation
	        	xor2_delay xor_gate
			(
				.a(X[i]), 
				.b(Y[i]), 
				.y(xor_result[i])
			);
	        end
	endgenerate
		
	always @(*) begin
		case (s) // we sign extend these bad boys with {8{}
		2'b00: z = {{8{and_result[7]}}, and_result};
	        2'b01: z = {{8{or_result[7]}}, or_result};
		2'b10: z = {not_X, not_Y};	// Concatenated NOT x with NOT y
	        2'b11: z = {{8{xor_result[7]}}, xor_result};
		default : z = 16'b0;
		endcase
	end
endmodule : logic_unit
