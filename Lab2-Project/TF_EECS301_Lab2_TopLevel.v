`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    22:22:00 08/30/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    TF_EECS301_Lab2_TopLevel
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    EECS301 Lab2 Top Level Testbench
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module TF_EECS301_Lab2_TopLevel();

	// Signal Declarations
	reg  [3:0] KEY;
	reg  [1:0] SW;
	wire [9:0] LEDR;
	wire [6:0] HEX0;
	wire [6:0] HEX1;
	wire [6:0] HEX2;
	wire [6:0] HEX3;
	wire [6:0] HEX4;
	wire [6:0] HEX5;

	
	//
	// System Clock Emulation
	//
	// Toggle the CLOCK_50 signal every 10 ns to create to 50MHz clock signal
	//
	localparam CLK_RATE_HZ = 50000000; // Hz
	localparam CLK_HALF_PER = ((1.0 / CLK_RATE_HZ) * 1000000000.0) / 2.0; // ns
	
	reg        CLOCK_50;
	
	initial
	begin
		CLOCK_50 = 1'b0;
		forever #(CLK_HALF_PER) CLOCK_50 = ~CLOCK_50;
	end


	//
	// Unit Under Test: EECS301_Lab2_TopLevel
	//
	EECS301_Lab2_TopLevel uut
	(
		// Clock Signals
		.CLOCK_50( CLOCK_50 ),

		// LED Signals
		.LEDR( LEDR ),
		
		// 7-Segment Display Signals (Active-Low)
		.HEX0( HEX0 ),
		.HEX1( HEX1 ),
		.HEX2( HEX2 ),
		.HEX3( HEX3 ),
		.HEX4( HEX4 ),
		.HEX5( HEX5 ),

		// Button Signals (Active-Low)
		.KEY( KEY ),
		
		// Switch Signals
		.SW( SW )
	);

	
	
	//
	// Test Stimulus
	//
	
	initial
	begin
	
		// Initialize Signals
		KEY = 4'hF;
		SW = 2'h0;	
	
		// Delay for system to stabilize (in lieu of a Reset)
		#1000; // 1 us
		
		
		/////////////////////////////////////////////////////
		//
		// Start Testing
		//

		SW = 2'h3;
		
	end
	
endmodule
