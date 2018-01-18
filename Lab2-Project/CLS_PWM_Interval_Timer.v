`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    00:35:00 01/25/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    CLS_PWM_Interval_Timer
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v15.0
// Description:    PWM Interval Timer
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module CLS_PWM_Interval_Timer
#(
	parameter CLK_RATE_HZ = 50000000, // Hz
	parameter DUTY_RATE_HZ = 1000     // Hz
)
(
	// Output Signals
	output reg PWM_TICK,
	
	// System Signals
	input CLK
);

	// Include Standard Functions header file (needed for bit_index())
	`include "StdFunctions.vh"
	
	// Initial Parameters
	initial
	begin
		PWM_TICK <= 1'b0;
	end

	//!! Add Implementation Here !!
	
endmodule
