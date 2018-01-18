`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    00:09:00 01/25/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    EECS301_Lab2_TopLevel
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v15.0
// Description:    EECS301 Lab2 Top Level File
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module EECS301_Lab2_TopLevel
(
	// Clock Signals
	input         CLOCK_50,

	// LED Signals
	output  [9:0] LEDR,
	
	// 7-Segment Display Signals (Active-Low)
	output  [6:0] HEX0,
	output  [6:0] HEX1,
	output  [6:0] HEX2,
	output  [6:0] HEX3,
	output  [6:0] HEX4,
	output  [6:0] HEX5,

	// Button Signals (Active-Low)
	input   [3:0] KEY,
	
	// Switch Signals
	input   [1:0] SW
);

	localparam CLOCK_50_RATE = 50000000; // 50 MHz 
	
	
	//
	// Hardcode 7-Segment Display Off
	//
	assign HEX0 = |KEY ? 7'h7F : 7'h00;
	assign HEX1 = |KEY ? 7'h7F : 7'h00;
	assign HEX2 = |KEY ? 7'h7F : 7'h00;
	assign HEX3 = |KEY ? 7'h7F : 7'h00;
	assign HEX4 = |KEY ? 7'h7F : 7'h00;
	assign HEX5 = |KEY ? 7'h7F : 7'h00;
	

	//
	// Synchronize Switch Signals to System Clock
	//
	reg [1:0] rate_select;
	
	always @(posedge CLOCK_50)
	begin
		rate_select <= SW;
	end

	
	//
	// Cyclon LED Scanner
	//
	CLS_Scanner_Module 
	#(
		.CLK_RATE_HZ( CLOCK_50_RATE )
	)
	cls_scanner
	(
		// Input Signals
		.RATE_SELECT( rate_select ),
		
		// Output Signals
		.LEDR( LEDR ),
		
		// System Signals
		.CLK( CLOCK_50 )
	);
	
	
	//
	// Verify clock inputs match defined rate parameters for simulation
	//
	specify
	
		// Verify CLOCK_50 Timing
		specparam
			tPER_CLK = (1.0 / CLOCK_50_RATE) * 1000000000.0, // ns
			tHI_CLK = tPER_CLK / 2,
			tLO_CLK = tPER_CLK / 2;
	
		$period( posedge CLOCK_50, tPER_CLK );
		$width( posedge CLOCK_50, tHI_CLK );
		$width( negedge CLOCK_50, tLO_CLK );

	endspecify
	
endmodule
