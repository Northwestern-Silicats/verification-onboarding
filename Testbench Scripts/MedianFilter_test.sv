`timescale 1ns/10ps
import pixel_pkg::*;

module median_pixel_filter_test;
	// inputs
	logic clk, rst, start_i, pixel_valid_i;
	pixel_t pixel_i;
	// outputs
	logic done_o, pixel_valid_o;
	pixel_t pixel_o;

median_filter dut(.clk(clk), .rst(rst), .start_i(start_i), .pixel_valid_i(pixel_valid_i), .pixel_i(pixel_i), .done_o(done_o), .pixel_valid_o(pixel_valid_o), .pixel_o(pixel_o)); 

	always begin // create the clock signal used for the tests
		#1 clk = ~clk; // clk switches from 0 to 1 every 1 ns
	end
	
	localparam int total_pixels = dut.IMAGE_LEN * dut.IMAGE_HEIGHT; // accesses parameters defined in DUT
	logic [23:0] image_mem [0:total_pixels-1]; // left brackets correspond to index in the array; can be ascending or descending

	int i; // int can also be used in testbenches to setup more complex tests, including for loops
	initial begin
		clk = 0;
		rst = 0;
		start_i = 0;
		pixel_valid_i = 0;
		pixel_i = '0; // make sure to replace all the smart quotes so it compiles!
		$readmemh("image_pixels.hex", image_mem);

		@(posedge clk); // an alternative timing method that automatically waits for rising clk edge
		rst = 1; 
		@(posedge clk);
		rst = 0; // ends test of reset functionality after 1 clock cycle
				
		start_i = 1;
		@(posedge clk);
		start_i = 0; // turns off start_i since dut moves to compute state
		for (i = 0; i < total_pixels; i++) begin
			pixel_i <= pixel_t'(image_mem[i]); // uses a static cast ['(...)] to convert 24bit hex string into RGB inputs
			pixel_valid_i <= 1;
			@(posedge clk); // inserting this at the end allows for data to be sampled right after previous rising edge, avoiding 1-cycle gap
		end

		pixel_valid_i <= 0;
		pixel_i <= '0; // not strictly necessary, but keeps testing clear

		if (!done_o) begin
			@(posedge done_o); //intentional hang to wait until dut is done
		end
		#5 // extra time to more clearly separate results
		$finish;
	end

	// separate initial block to (potentially) save hex results as they run
	// if you’ve taken CS211, this may look similar to C
	integer out_file;
	initial begin
		out_file = $fopen("image_output.hex", "w");
		forever begin
			@(posedge clk);
			if (pixel_valid_o) begin
				$fwrite(out_file, "%02h%02h%02h\n", pixel_o.r, pixel_o.g, pixel_o.b);
			end
		end
	end
endmodule
