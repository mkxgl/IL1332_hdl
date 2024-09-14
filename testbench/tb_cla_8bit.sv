//`timescale 1ns / 1ps

module tb_cla_8bit;
    // Declare testbench variables
    parameter N = 8; // 8 bit
    logic signed [7:0] A; 
    logic signed [7:0] B;
    logic signed [8:0] S;
    
    // int x, y;

    // Instantiate the Device Under Test (DUT)
    cla_8bit uut 
    (
        .A(A),
        .B(B),
        .S(S)
    );

    // TB logic
    initial begin
        $display("Starting 8-bit CLA Testbench");
        $display("===================================");
    
        // test all combos
           
        for (int i = -128; i < 128; ++i) // -127:128 are the values for 8-bits
        begin
            for (int j = -128; j < 128; ++j) 
            begin
                A = i;
                B = j;
                #20ns; // delay for calculation
                $display("%4t:  A = %d, B = %d, Sum = %d", $time, A, B, S);
            end
        end


        // testing unique cases
        //task test_case (input signed [(N-1):0 testA, input signed [(N-1):0] testB);
            //begin
               // A = testA;
               // B = testB;
               // #20;
               // $display("%4t:  A = %d, B = %d, Sum = %d", $time, A, B, S);
           // end
       // endtask

        // womp womp testing minimal values, expecting overflow cause -128 + 128 my friends
        //$display("Test: A = -128, B = -128 (Expecting overflow)");
        //test_case(-128, -128);

        // maximum values, overflow
        //$display("Test: A = 127, B = 127 (Expecting overflow)");
        //test_case(127, 127);

        // 0 result
        //$display("Test: A = -1, B = 1 (Expecting 0)");
        //test_case(-1, 1);

        //$display("Test: A = 127, B = -127 (Expecting 0)");
        //test_case(127, -127);

        // Simple overflows
        //$display("Test: A = 127, B = 1 (Expecting overflow)");
        //test_case(127, 1);

        //$display("Test: A = -128, B = -1 (Expecting overflow)");
        //test_case(-128, -1);

        // Test case: A = -128, B = 0 (No overflow, result should be -128)
        //$display("Test: A = -128, B = 0 (Expecting -128)");
        //test_case(-128, 0);

        $display("Test completed");
        $stop;
    end

endmodule
