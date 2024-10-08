`timescale 1ns / 1ps
module parallel_comparator_8bit(
	input logic [7:0] A,
	input logic [7:0] B,
	output logic g,
	output logic l

	
);

	logic [3:0] greater_row0;
	logic [3:0] lesser_row0;
	logic [1:0] greater_row1;
	logic [1:0] lesser_row1;



// comparator row0
    genvar i;
    generate
        for (i = 0; i < 4; i++) begin : gen_comp0
            comparator_slice cs0 (
                .a0(A[i+i]),
                .b0(B[i+i]),
                .a1(A[i+i+1]),
                .b1(B[i+i+1]),
                .g(greater_row0[i]),
                .l(lesser_row0[i])
            );
        end
    endgenerate

// comparator row1
    genvar j;
    generate
        for (j = 0; j < 2; j++) begin : gen_comp1
            comparator_slice cs1 (
                .a0(greater_row0[j+j]),
                .b0(lesser_row0[j+j]),
                .a1(greater_row0[j+j+1]),
                .b1(lesser_row0[j+j+1]),
                .g(greater_row1[j]),
                .l(lesser_row1[j])
            );
        end
endgenerate
            comparator_slice cs2 (
                .a0(greater_row1[0]),
                .b0(lesser_row1[0]),
                .a1(greater_row1[1]),
                .b1(lesser_row1[1]),
                .g(g),
                .l(l)
            );
endmodule
