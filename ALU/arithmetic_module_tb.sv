`timescale 1ns / 1ps
module arithmetic_module_tb;
    // Declare testbench variables
	logic [1:0] m;
    	logic  [7:0] X; 
   	logic  [7:0] Y;
    	logic  [15:0] Z;
    

    
    // int x, y;

    // Instantiate the Device Under Test (DUT)
    arithmetic_module uut 
    (
        .m(m),
        .X(X),
	.Y(Y),
        .Z(Z)
    );

	initial begin
		X = 100;
		Y = 12;
		m[0] = 1'b0;
		m[1] = 1'b0;
		#250ns;
		X = 120;
		Y = 120;
		m[0] = 1'b0;
		m[1] = 1'b0;
		#150ns;

		X = 10;
		Y = 20;
		m[0] = 1'b0;
		m[1] = 1'b0;
		#150ns;

		X = 55;
		Y = 45;
		m[0] = 1'b0;
		m[1] = 1'b0;
		#170ns;

		X = 100;
		Y = 12;
		m[0] = 1'b0;
		m[1] = 1'b0;
		#250ns;

		X = 10;
		Y = 0;
		m[0] = 1'b1;
		m[1] = 1'b0;
		#100ns;

		

		X = 50;
		Y = 25;
		m = 1;
		#100ns;

		X = 10;
		Y = 0;
		m[0] = 1'b1;
		m[1] = 1'b0;
		#100ns;

		X = 255;
		Y = 1;
		m = 2;
		#100ns;

		X = 0;
		Y = 0;
		m = 0;
		#100ns;

		X = 0;
		Y = 0;
		m = 1;
		#100ns;

		X = 3;
		Y = 5;
		m = 2;
		#100ns;

		$stop;
	end
endmodule

