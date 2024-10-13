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
	logic [7:0] or_result;
	logic [7:0] not_x;
	logic [7:0] not_y;
	logic [7:0] xor_result;
	
genvar i;
// AND
generate
	for (i = 0; i < 8; ++i) begin: and_operation
		nand2_delay nand_x_y
		(
			.a(x[i]),
			.b(y[i]),
			.y(out[i])
		);

		nand2_delay not_nand
		(
			.a(out[i]),
			.b(out[i]),
			.y(and_result[i])
		);
	end
endgenerate

// OR
generate
	for (i = 0; i < 8; ++i) begin: or_operation
		nand2_delay not_x
		(
			.a(x[i]),
			.b(x[i]),
			.y(out_x[i])
		);

		nand2_delay not_y
		(
			.a(y[i]),
			.b(y[i]),
			.y(out_y[i])
		);

		nand2_delay nand_notx_noty
		(
			.a(not_x[i]),
			.b(not_y[i]),
			.y(or_result[i])
		);
	end
endgenerate	

// NOT X
generate
	for (i = 0; i < 8; ++i) begin: not_x
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
	for (i = 0; i < 8; ++i) begin: not_y
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
	case (logic_operation)
		2'b00 = and_operation;
		2'b01 = or_operation;
		2'b10 = {not_x, not_y}; // concatenated not x with not y
		2'b11 = xor_operation;
		default : z = 16'b0;
	endcase
end
