`timescale 1ns / 1ps

module tb_mult_NMbit;

    // Parameters
    parameter N = 4; // Bit width for A
    parameter M = 5; // Bit width for B

    // Testbench signals
    logic [N-1:0] A; // Input A
    logic [M-1:0] B; // Input B
    logic [(N + M - 1):0] Prod; // Output Product

    // Instantiate the multiplier
    mult_NMbit #(N, M) uut (
        .A(A),
        .B(B),
        .Prod(Prod)
    );

    // Initial block for stimulus generation
    initial begin
        // Display header
        $display("A\t\tB\t\tProd");
        $monitor("%b\t\t%b\t\t%b", A, B, Prod);

        // Test case 1
        A = 4'b0011; // 3
        B = 5'b00010; // 2
        #10; // Wait for 10 time units

        // Test case 2
        A = 4'b0101; // 5
        B = 5'b00101; // 5
        #10;

        // Test case 3
        A = 4'b1111; // 15
        B = 5'b00011; // 3
        #10;

        // Test case 4
        A = 4'b1010; // 10
        B = 5'b00001; // 1
        #10;

        // Test case 5
        A = 4'b0000; // 0
        B = 5'b11111; // 31
        #10;

        // Add more test cases as needed

        // Finish simulation
        $finish;
    end

endmodule