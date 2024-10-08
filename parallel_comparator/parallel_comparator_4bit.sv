`timescale 1ns / 1ps
module parallel_comparator_4bit(
	input logic [3:0] A,
	input logic [3:0] B,
	output logic g,
	output logic l

	
);

	logic [1:0] greater_row0;
	logic [1:0] lesser_row0;



    genvar i;
    generate
        for (i = 0; i < 2; i++) begin : gen_comp
            comparator_slice cs (
                .a0(A[i+i]),
                .b0(B[i+i]),
                .a1(A[i+i+1]),
                .b1(B[i+i+1]),
                .g(greater_row0[i]),
                .l(lesser_row0[i])
            );
        end
    endgenerate

            comparator_slice cs1 (
                .a0(greater_row0[0]),
                .b0(lesser_row0[0]),
                .a1(greater_row0[1]),
                .b1(lesser_row0[1]),
                .g(g),
                .l(l)
            );
endmodule