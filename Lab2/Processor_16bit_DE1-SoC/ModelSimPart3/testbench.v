`timescale 1ns / 1ps

module testbench ( );

	parameter CLOCK_PERIOD = 20;

	reg [0:0] KEY;
	reg [9:0] SW;
	reg CLOCK_50;
	wire [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	wire [9:0] LEDR;	

	initial begin
		CLOCK_50 <= 1'b0;
	end // initial
	always @ (*)
	begin : Clock_Generator
		#((CLOCK_PERIOD) / 2) CLOCK_50 <= ~CLOCK_50;
	end

	initial begin
		SW[9] <= 1'b0; KEY[0] <= 1'b0;
		#20 SW[9] <= 1'b1; KEY[0] <= 1'b1;
		#40 SW[0] <= 1'b1; 

	end // initial


	part3 U1 (KEY, SW, CLOCK_50, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, LEDR);

endmodule
