module logic_unit
(
	input logic [7:0] x,
	input logic [7:0] y,
	// no m signal since its all 11 for all logical operations 
	input logic [1:0] s,
	output logic [15:0] z
);

always @(*) begin
	case (logic_operation)
		2'b00 = x & y;
		2'b01 = x | y;
		2'b10 = ~x | ~y; //?? condition? if =/= 0 only?
		2'b11 = x ^ y;
		default : z = 16'b0;
	endcase
end
