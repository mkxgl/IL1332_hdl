`timescale 1ns / 1ps

module cla_sub_8bit_tb;
    // Declare testbench variables
    logic signed [7:0] A; 
    logic signed [7:0] B;
    logic signed [8:0] S;
    logic sub;

    
    // int x, y;

    // Instantiate the Device Under Test (DUT)
    cla_sub_8bit uut 
    (
        .a(A),
        .b_input(B),
	.sub(sub),
        .sum(S)
    );

	initial begin
		A = 0;
		B = 0;
		sub = 0;
		#100ns;
		A = 120;
		B = 122;
		sub = 1;
		#100ns;
		A = 0;
		B = 100;
		sub = 1;
		#100ns;
		A = 55;
		B = 45;
		sub = 0;
		#100ns;
		A = 126;
		B = 126;
		sub = 0;
		#100ns;
		A = 30;
		B = 30;
		sub = 1;
		#100ns;

		$stop;
	end
endmodule

