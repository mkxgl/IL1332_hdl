
`timescale 1ns / 1ps
module alu_tb;
    // Declare testbench variables
	logic [1:0] m;
	logic [1:0] s;
    	logic  [7:0] X; 
   	logic  [7:0] Y;
    	logic  [15:0] Z;
    

    
    // int x, y;

    // Instantiate the Device Under Test (DUT)
    alu uut 
    (
        .m(m),
	.s(s),
        .X(X),
	.Y(Y),
        .Z(Z)
    );

	initial begin
		// arithmetic module test
			s[0] = 0;
			s[1] = 0;

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

		// Shifter module test
			s[0] = 1;
			s[1] = 0;
		// shift left msb is dropped lsb = input_left = 0
			X = 0'b11111111;
			Y = 0'b11111111;
			m[0] = 0;
			m[1] = 0;
			#100ns;
			// shift right lsb is dropped, msb = input_right = 1
			X = 0'b11111111;
			Y = 0'b11111111;
			m[0] = 1;
			m[1] = 0;
			#100ns;
			// rotate left
			X = 0'b11110000;
			Y = 0'b11110000;
			m[0] = 0;
			m[1] = 1;
			#100ns;
			// rotate right
			X = 0'b00001111;
			Y = 0'b00001111;
			m[0] = 1;
			m[1] = 1;
			#100ns;	
			X = 0'b11111111;
			Y = 0'b11111111;
			m[0] = 0;
			m[1] = 0;
			#100ns;



		// Comparator module test
			s[0] = 0;
			s[1] = 1;

			X = 255;
     			Y = 0;
     			#100;

     			X = 144;
     			Y = 88;
     			#100;

    			X = 88;
     			Y = 88;
     			#100;

     			X = 0;
     			Y = 1;
     			#100;


		// Logic module test
			s[0] = 1;
			s[1] = 1;

        // Test case 1: AND operation
        X = 8'b11001100; Y = 8'b10101010; m = 2'b00; #100;

        // Test case 2: OR operation
        X = 8'b11001100; Y = 8'b10101010; m = 2'b01; #100;

        // Test case 3: NOT operation
        X = 8'b11001100; Y = 8'b10101010; m = 2'b10; #100;

        // Test case 4: XOR operation
        X = 8'b11001100; Y = 8'b10101010; m = 2'b11; #100;

        // Test case 5: Edge case (all ones)
        X = 8'b11111111; Y = 8'b11111111; m = 2'b00; #100;  // AND
        X = 8'b11111111; Y = 8'b11111111; m = 2'b01; #100;  // OR
        X = 8'b11111111; Y = 8'b11111111; m = 2'b10; #100;  // NOT
        X = 8'b11111111; Y = 8'b11111111; m = 2'b11; #100;  // XOR

        // Test case 6: Edge case (all zeros)
        X = 8'b00000000; Y = 8'b00000000; s = 2'b00; #100;  // AND
        X = 8'b00000000; Y = 8'b00000000; s = 2'b01; #100;  // OR
        X = 8'b00000000; Y = 8'b00000000; s = 2'b10; #100;  // NOT
        X = 8'b00000000; Y = 8'b00000000; s = 2'b11; #100;  // XOR

		$stop;
	end
endmodule
