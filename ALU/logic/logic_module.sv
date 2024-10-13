module logic_unit
(
	input logic [7:0] x,
	input logic [7:0] y,
	// no m signal since its all 11 for all logical operations 
	input logic [1:0] s,
	output logic [15:0] z
);

		// LOGIC OPERATIONS //
	logic [7:0] and_result;
	logic [7:0] nand_result;
	logic [7:0] or_result;
	logic [7:0] not_x;
	logic [7:0] not_x_result;
	logic [7:0] not_y;
	logic [7:0] not_y_result;
	logic [7:0] xor_result;
		
	genvar i;
	// AND
	generate
		for (i = 0; i < 8; ++i) begin: and_operation
			nand2_delay nand_x_y
			(
				.a(x[i]),
				.b(y[i]),
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
			nand2_delay not_x2
			(
				.a(x[i]),
				.b(x[i]),
				.y(not_x_result[i])
			);

			nand2_delay not_y2
			(
				.a(y[i]),
				.b(y[i]),
				.y(not_y_result[i])
			);

			nand2_delay nand_notx_noty
			(
				.a(not_x_result[i]),
				.b(not_y_result[i]),
				.y(or_result[i])
			);
		end
	endgenerate	

	// NOT X
	generate
		for (i = 0; i < 8; ++i) begin: not_x_operation
			nand2_delay not_x
			(
				.a(x[i]),
				.b(x[i]),
				.y(not_x[i])
			);
		end
	endgenerate	

	// NOT Y
	generate
		for (i = 0; i < 8; ++i) begin: not_y_operation
			nand2_delay not_y
			(
				.a(y[i]),
				.b(y[i]),
				.y(not_y[i])
			);
		end
	endgenerate

	// XOR
	generate
		for (i = 0; i < 8; ++i) begin: xor_operation
	        	xor2_delay xor_gate
			(
				.a(x[i]), 
				.b(y[i]), 
				.y(xor_result[i])
			);
	        end
	endgenerate
		
	always @(*) begin
		case (s) // we sign extend these bad boys with {8{}
			2'b00: z = {{8{and_result[7]}}, and_result};
	        2'b01: z = {{8{or_result[7]}}, or_result};
	        2'b10: z = {not_x, not_y};	// Concatenated NOT x with NOT y
	        2'b11: z = {{8{xor_result[7]}}, xor_result};
		default : z = 16'b0;
		endcase
	end
endmodule : logic_unit
