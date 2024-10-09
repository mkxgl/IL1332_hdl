//`timescale 1ns / 1ps

module rca_nbit_tb;
    // Declare testbench variables
	parameter N = 6;
	logic signed [N-1:0] A, B;
	logic signed [N-1:0] sum;
	logic cin;
	logic cout;
	


    // Instantiate the Device Under Test (DUT)
    //rca_Nbit_delay #(N) dut_rca (
//        .A(A),
//        .B(B),
//	.cin(1'b0),
//        .Sum(Sum_rca)
//    );

        // Instantiate the Device Under Test (DUT)
    rca_nbit dut (
        .A(A),
        .B(B),
	.cin(cin),
        .sum(sum),
	.cout(cout)
    );
	assign cin = 1'b0;

    // Initial block to start the simulation
    initial begin
        $display("Starting Ripple Carry Adder Testbench");

        // Apply test vectors
       
       for (integer x = -8; (x <= 7) ; x = x+1 )
       begin
            for (integer y = -8; (y <= 7) ; y = y+1 ) 
            begin
                A = x;
                B = y;
                #100ns;
            end
        end

        $display("Test completed");
        $stop;
    end

endmodule
