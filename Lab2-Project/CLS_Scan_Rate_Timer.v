`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    14:48:00 01/25/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    CLS_Scan_Rate_Timer
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v15.0
// Description:    CLS Scan Rate Timer
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module CLS_Scan_Rate_Timer
#(
	parameter CLK_RATE_HZ = 50000000  // Hz
)
(
	// Input Signals
	input [1:0] RATE_SELECT,
	
	// Output Signals
	output reg  SRT_TICK,
	
	// System Signals
	input CLK
);

	// Include Standard Functions header file (needed for bit_index())
	`include "StdFunctions.vh"

	//
	// Compute Parameter Values used by the rollover counters
	//
	
	// Set the scan rate frequency
	localparam SCAN_RATE_FASTER = 32; // Hz
	localparam SCAN_RATE_FAST   = 16; // Hz
	localparam SCAN_RATE_SLOW   =  8; // Hz
	localparam SCAN_RATE_SLOWER =  2; // Hz
	
	// Compute maximum number of ticks to set the counter reg width
	localparam SRT_TICKS_MAX = CLK_RATE_HZ / SCAN_RATE_SLOWER;

	localparam SRT_REG_WIDTH = bit_index(SRT_TICKS_MAX);
	
	// Compute number of ticks for each scan rate
	localparam [SRT_REG_WIDTH:0] SRT_TICKS_FASTER = 1.0 * CLK_RATE_HZ / SCAN_RATE_FASTER;
	localparam [SRT_REG_WIDTH:0] SRT_TICKS_FAST =   1.0 * CLK_RATE_HZ / SCAN_RATE_FAST;
	localparam [SRT_REG_WIDTH:0] SRT_TICKS_SLOW =   1.0 * CLK_RATE_HZ / SCAN_RATE_SLOW;
	localparam [SRT_REG_WIDTH:0] SRT_TICKS_SLOWER = 1.0 * CLK_RATE_HZ / SCAN_RATE_SLOWER;
	
	// Compute the rollover counter load values for each scan rate
	localparam [SRT_REG_WIDTH:0] SRT_FASTER_LOADVAL = {1'b1, {(SRT_REG_WIDTH){1'b0}}} - SRT_TICKS_FASTER + 1'b1;
	localparam [SRT_REG_WIDTH:0] SRT_FAST_LOADVAL   = {1'b1, {(SRT_REG_WIDTH){1'b0}}} - SRT_TICKS_FAST + 1'b1;
	localparam [SRT_REG_WIDTH:0] SRT_SLOW_LOADVAL   = {1'b1, {(SRT_REG_WIDTH){1'b0}}} - SRT_TICKS_SLOW + 1'b1;
	localparam [SRT_REG_WIDTH:0] SRT_SLOWER_LOADVAL = {1'b1, {(SRT_REG_WIDTH){1'b0}}} - SRT_TICKS_SLOWER + 1'b1;
	
	
	reg  [SRT_REG_WIDTH:0] srt_cnt_loadval;
	reg  [SRT_REG_WIDTH:0] srt_cnt_reg;
	wire                   srt_cnt_tick;
	
	// Initial register settings
	initial
	begin
		SRT_TICK = 1'b0;
		srt_cnt_loadval = SRT_FASTER_LOADVAL;
		srt_cnt_reg = SRT_FASTER_LOADVAL;
	end
	
	
	//!! Add Implementation Here !!


endmodule
