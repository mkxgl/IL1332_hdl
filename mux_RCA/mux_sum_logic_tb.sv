module mux_sum_logic_tb;
	logic a;
	logic b;
	logic c_in;
	logic sum;

	mux_sum_logic dut(.a(a), .b(b), .sum(sum), .c_in(c_in));

	// Clock generation
	initial begin
		// Iterate through all combinations of a, b, sum, c_in
		for (integer i = 0; i < 8; i = i + 1) begin
			{a, b, c_in }= i; // Assign binary value of 'i' to a, b, c_in
			#15ns;  // Wait for 10 time units for each combination
		end

		$stop; // Stop simulation
	end
endmodule
