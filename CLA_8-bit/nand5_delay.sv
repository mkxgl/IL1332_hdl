module nand5_delay (
    input  logic a,
    input  logic b,
    input  logic c,
    input  logic d,
    input  logic e,
    output logic y
);
	logic abcd, abcd_inv;

    nand4_delay u1
    (
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d), 
        .y(abcd)
    );

    nand2_delay u2
    (
        .a(abcd), 
        .b(abcd), 
        .y(abcd_inv)
    );

    nand2_delay u3
    (
        .a(not_abcd), 
        .b(e), 
        .y(y)
    );

endmodule
