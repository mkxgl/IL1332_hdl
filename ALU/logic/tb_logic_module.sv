`timescale 1ns / 1ps

module tb_logic_unit;

    // Inputs
    logic [7:0] x;
    logic [7:0] y;
    logic [1:0] s;

    // Output
    logic [15:0] z;

    // Instantiate the logic_unit
    logic_unit uut (
        .x(x),
        .y(y),
        .s(s),
        .z(z)
    );

    initial begin
        // Monitor the outputs
        $monitor("Time: %0t | x: %b | y: %b | s: %b | z: %b", $time, x, y, s, z);

        // Test case 1: AND operation
        x = 8'b11001100; y = 8'b10101010; s = 2'b00; #10;

        // Test case 2: OR operation
        x = 8'b11001100; y = 8'b10101010; s = 2'b01; #10;

        // Test case 3: NOT operation
        x = 8'b11001100; y = 8'b10101010; s = 2'b10; #10;

        // Test case 4: XOR operation
        x = 8'b11001100; y = 8'b10101010; s = 2'b11; #10;

        // Test case 5: Edge case (all ones)
        x = 8'b11111111; y = 8'b11111111; s = 2'b00; #10;  // AND
        x = 8'b11111111; y = 8'b11111111; s = 2'b01; #10;  // OR
        x = 8'b11111111; y = 8'b11111111; s = 2'b10; #10;  // NOT
        x = 8'b11111111; y = 8'b11111111; s = 2'b11; #10;  // XOR

        // Test case 6: Edge case (all zeros)
        x = 8'b00000000; y = 8'b00000000; s = 2'b00; #10;  // AND
        x = 8'b00000000; y = 8'b00000000; s = 2'b01; #10;  // OR
        x = 8'b00000000; y = 8'b00000000; s = 2'b10; #10;  // NOT
        x = 8'b00000000; y = 8'b00000000; s = 2'b11; #10;  // XOR

        // Finish simulation
        $finish;
    end

endmodule
