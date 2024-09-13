module nand3_delay
(
	input logic a,
	input logic b,
	input logic c,
	output logic y
);
	assign #1.25ns y = ~(a & b & c);

endmodule