`timescale 1ns / 1ps
module Nbit_4to1_demux_tb;

	parameter N = 8;
	logic [N-1:0] I;
	logic [N-1:0] X0; // Output x0
        logic [N-1:0] X1; // Output x1 
	logic [N-1:0] X2; // Output x2 
	logic [N-1:0] X3; // Output x3 
	logic [1:0] s;
	

	Nbit_4to1_demux #N dut(
		.I(I),
		.X0(X0),
		.X1(X1),
		.X2(X2),
		.X3(X3),
		.s(s)
		);

 // Initial block for stimulus generation
		initial begin
			I = 255;
			s[0] = 0;
			s[1] = 0;
			#10ns;
			I = 1;
			s[0] = 1;
			s[1] = 0;
			#10ns;
			I = 0;
			s[0] = 0;
			s[1] = 1;
			#10ns;
			I = 66;
			s[0] = 1;
			s[1] = 1;
			#10ns;
			I = 126;
			s[0] = 0;
			s[1] = 0;
			#10ns;
			I = 221;
			s[0] = 1;
			s[1] = 0;
			#10ns;
			I = 80;
			s[0] = 0;
			s[1] = 1;
			#10ns;
			I = 178;
			s[0] = 1;
			s[1] = 1;
			#10ns;
		
		
			$stop;
	end



endmodule
