module nand4_delay
(
	input logic a,
	input logic b,
	input logic c,
	input logic d,
	output logic y
);
	assign #1.5ns y = ~(a & b & c & d);

endmodule
