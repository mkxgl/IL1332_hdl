`timescale 1ns / 1ps
module Nbit_complementor_tb;

	parameter N = 8;
	logic [N-1:0] B; // B 
	logic cin;
	logic [N-1:0] Y;  // Output

	Nbit_complementor #N dut(
		.B(B),
		.cin(cin),
		.Y(Y)
		);

 // Initial block for stimulus generation
    initial begin
        // Display header
        //$display("A\t\tB\t\tProd");
        //$monitor("%b\t\t%b\t\t%b", x0, x1, s,f);

        // Test case 1
        B = 8'b00111100; // 3
	cin=0;
        #100; // Wait for 10 time units

        // Test case 2
        B = 8'b01010101; // 5
	cin=1;
        #100;

        // Test case 3
        B = 8'b11111111; // 15
	cin = 0;
        #100;

        // Test case 4
        B = 8'b00000000; // 10
        cin = 1; // 1
        #100;

        // Test case 4
        B = 8'b11111111; // 10
        cin = 0; // 1
        #100;

        // Add more test cases as needed

        // Finish simulation
        $stop;
    end

endmodule
