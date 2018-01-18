`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    14:48:00 01/25/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    CLS_PWM_DutyCycle_Timer
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v15.0
// Description:    PWM Channel Bank
//                 8 PWM Channels, synchronized together
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module CLS_PWM_DutyCycle_Timer
#(
	parameter CLK_RATE_HZ = 50000000, // Hz
	parameter DUTY_RATE_HZ = 1000,    // Hz
	parameter DUTY_PERCENT = 50       // Cycle On-time %	
)
(
	// Input Signals
	input PWM_INTERVAL_TICK,
	
	// Output Signals
	output reg PWM_OUT,
	
	// System Signals
	input CLK
);

	// Include Standard Functions header file (needed for bit_index())
	`include "StdFunctions.vh"

	// Initial register settings
	initial
	begin
		PWM_OUT = 1'b0;
	end

	//!! Add Implementation Here !!

endmodule
