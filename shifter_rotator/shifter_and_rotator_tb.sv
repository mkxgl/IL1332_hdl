module shifter_and_rotator_tb;
	logic [7:0]x;
	logic [7:0]y;
	logic [1:0] select;

	shifter_and_rotator dut(.x(x), .y(y), .select(select) );

		initial begin
			// shift left msb is dropped lsb = input_left = 0
			x = 0'b11111111;
			select[0] = 0;
			select[1] = 0;
			#100ns;
			// shift right lsb is dropped, msb = input_right = 1
			x = 0'b11111111;
			select[0] = 1;
			select[1] = 0;
			#100ns;
			// rotate left
			x = 0'b11110000;
			select[0] = 0;
			select[1] = 1;
			#100ns;
			// rotate right
			x = 0'b00001111;
			select[0] = 1;
			select[1] = 1;
			#100ns;	
			x = 0'b11111111;
			select[0] = 0;
			select[1] = 0;
			#100ns;
			
		
		
			$stop;
	end



endmodule
