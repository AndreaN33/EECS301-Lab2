`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Andrea Norris
// 
// Create Date:    14:27:00 01/31/2018 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    CLS_LED_Output_Multiplexer
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v15.0
// Description:    CLS LED Output Multiplexer
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module CLS_LED_Output_Multiplexer(

	// Include Standard Functions header file (needed for bit_index())
	//include "StdFunctions.vh"

	//input signals
	input SRT_TICK,
	input PWM_TIMER_TICK,
	input [9:0] PWM_CHANNEL_SIGS,
	input CLK,

	//output signals
	output reg [9:0] LEDR
);

	//internal signals
	reg [4:0] next_frame_pos;
	reg [4:0] frame_pos;
	reg [4:0] frame_pos_sync;

	
	//
	initial 
		 begin
		 LEDR <= 10'h000;
		 next_frame_pos <= 5'h00;
		 frame_pos <= 5'h00;
		 frame_pos_sync <= 5'h00;
		 end
	//lookup table for 18-Position Grey Code counter
	//wire [4:0]  grey_code;
	//reg [17:0]  next_frame_pos;

	always @* //should maybe be SRT_TICK??
	begin
			case(frame_pos)
			
				5'b00000 : next_frame_pos <= 5'b00001;
				5'b00001 : next_frame_pos <= 5'b00011;
				5'b00011 : next_frame_pos <= 5'b00010;
				5'b00010 : next_frame_pos <= 5'b00110;
				5'b00110 : next_frame_pos <= 5'b00111;
				5'b00111 : next_frame_pos <= 5'b00101;
				5'b00101 : next_frame_pos <= 5'b00100;
				5'b00100 : next_frame_pos <= 5'b01100;
				5'b01100 : next_frame_pos <= 5'b11100;
				5'b11100 : next_frame_pos <= 5'b10100;
				5'b10100 : next_frame_pos <= 5'b10101;
				5'b10101 : next_frame_pos <= 5'b10111;
				5'b10111 : next_frame_pos <= 5'b10110;
				5'b10110 : next_frame_pos <= 5'b10010;
				5'b10010 : next_frame_pos <= 5'b10011;
				5'b10011 : next_frame_pos <= 5'b10001;
				5'b10001 : next_frame_pos <= 5'b10000;
				5'b10000 : next_frame_pos <= 5'b00000; //after this is redundant
				5'b11111 : next_frame_pos <= 5'b00000;
				5'b11110 : next_frame_pos <= 5'b00000;
				5'b11101 : next_frame_pos <= 5'b00000;
				5'b11011 : next_frame_pos <= 5'b00000;
				5'b11000 : next_frame_pos <= 5'b00000;
				5'b01111 : next_frame_pos <= 5'b00000;
				5'b01000 : next_frame_pos <= 5'b00000;
				5'b01001 : next_frame_pos <= 5'b00000;
				5'b01010 : next_frame_pos <= 5'b00000;
				5'b01011 : next_frame_pos <= 5'b00000;
				5'b01101 : next_frame_pos <= 5'b00000;
				5'b01110 : next_frame_pos <= 5'b00000;
				5'b11001 : next_frame_pos <= 5'b00000;
				5'b11010 : next_frame_pos <= 5'b00000;
			endcase
	end

	//Register 1 Implementation
	always @(posedge CLK)
	begin
		if(SRT_TICK)
		frame_pos <= next_frame_pos;
	end

	//register 2 Implementation
	always @(posedge CLK)
	begin
	if(PWM_TIMER_TICK)
		frame_pos_sync <= frame_pos;
	end

	//multiplexer
	//selection done by frame_pos_sync

	wire [9:0] pchs = PWM_CHANNEL_SIGS;

	always @(posedge CLK)
	begin
			case(frame_pos_sync)
			
					5'b00000 : LEDR <= {pchs[9], pchs[8], pchs[7], pchs[6], pchs[5], pchs[4], pchs[3], pchs[2], pchs[1], pchs[0]};
					5'b00001 : LEDR <= {pchs[8], pchs[9], pchs[6], pchs[5], pchs[4], pchs[3], pchs[2], pchs[1], pchs[0], pchs[0]};
					5'b00011 : LEDR <= {pchs[7], pchs[8], pchs[9], pchs[4], pchs[3], pchs[2], pchs[1], pchs[0], pchs[0], pchs[0]};
					5'b00010 : LEDR <= {pchs[6], pchs[7], pchs[8], pchs[9], pchs[2], pchs[1], pchs[0], pchs[0], pchs[0], pchs[0]};
					5'b00110 : LEDR <= {pchs[5], pchs[6], pchs[7], pchs[8], pchs[9], pchs[0], pchs[0], pchs[0], pchs[0], pchs[0]};
					5'b00111 : LEDR <= {pchs[4], pchs[5], pchs[6], pchs[7], pchs[8], pchs[9], pchs[0], pchs[0], pchs[0], pchs[0]};
					5'b00101 : LEDR <= {pchs[3], pchs[4], pchs[5], pchs[6], pchs[7], pchs[8], pchs[9], pchs[0], pchs[0], pchs[0]};
					5'b00100 : LEDR <= {pchs[2], pchs[3], pchs[4], pchs[5], pchs[6], pchs[7], pchs[8], pchs[9], pchs[0], pchs[0]};
					5'b01100 : LEDR <= {pchs[1], pchs[2], pchs[3], pchs[4], pchs[5], pchs[6], pchs[7], pchs[8], pchs[9], pchs[0]};
					5'b11100 : LEDR <= {pchs[0], pchs[1], pchs[2], pchs[3], pchs[4], pchs[5], pchs[6], pchs[7], pchs[8], pchs[9]};
					5'b10100 : LEDR <= {pchs[0], pchs[0], pchs[1], pchs[2], pchs[3], pchs[4], pchs[5], pchs[6], pchs[9], pchs[8]};
					5'b10101 : LEDR <= {pchs[0], pchs[0], pchs[0], pchs[1], pchs[2], pchs[3], pchs[4], pchs[9], pchs[8], pchs[7]};
					5'b10111 : LEDR <= {pchs[0], pchs[0], pchs[0], pchs[0], pchs[1], pchs[2], pchs[9], pchs[8], pchs[7], pchs[6]};
					5'b10110 : LEDR <= {pchs[0], pchs[0], pchs[0], pchs[0], pchs[0], pchs[9], pchs[8], pchs[7], pchs[6], pchs[5]};
					5'b10010 : LEDR <= {pchs[0], pchs[0], pchs[0], pchs[0], pchs[9], pchs[8], pchs[7], pchs[6], pchs[5], pchs[4]};
					5'b10011 : LEDR <= {pchs[0], pchs[0], pchs[0], pchs[9], pchs[8], pchs[7], pchs[6], pchs[5], pchs[4], pchs[3]};
					5'b10001 : LEDR <= {pchs[0], pchs[0], pchs[9], pchs[8], pchs[7], pchs[6], pchs[5], pchs[4], pchs[3], pchs[2]};
					5'b10000 : LEDR <= {pchs[0], pchs[9], pchs[8], pchs[7], pchs[6], pchs[5], pchs[4], pchs[3], pchs[2], pchs[1]};
					
				endcase
	end

	
endmodule
