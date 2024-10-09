`timescale 1ns / 1ps
module tb_demux_4to1_slice;
	logic x0;
	logic x1;
	logic x2;
	logic x3;
	logic [1:0] s;
	logic i;

	demux_4to1_slice dut(.x0(x0), .x1(x1), .x2(x2), .x3(x3), .s(s), .i(i) );

		initial begin
			i = 1;
			s[0] = 0;
			s[1] = 0;
			#10ns;
			i = 1;
			s[0] = 1;
			s[1] = 0;
			#10ns;
			i = 1;
			s[0] = 0;
			s[1] = 1;
			#10ns;
			i = 1;
			s[0] = 1;
			s[1] = 1;
			#10ns;
			i = 0;
			s[0] = 0;
			s[1] = 0;
			#10ns;
			i = 0;
			s[0] = 1;
			s[1] = 0;
			#10ns;
			i = 0;
			s[0] = 0;
			s[1] = 1;
			#10ns;
			i = 0;
			s[0] = 1;
			s[1] = 1;
			#10ns;
		
		
			$stop;
	end



endmodule
