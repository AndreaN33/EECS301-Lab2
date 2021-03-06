`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    14:48:00 01/25/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    CLS_Scanner_Module
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    CLS Scanner Module
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module CLS_Scanner_Module
#(
	parameter CLK_RATE_HZ = 50000000  // 50 MHz
)
(
	// Input Signals
	input  [1:0] RATE_SELECT,
	
	// Output Signals
	output [9:0] LEDR,
	
	// System Signals
	input CLK
);

	localparam PWM_DUTY_RATE = 1000; // 1 kHz
	
	//
	// LED Scan Rate Timer
	//
	wire   srt_tick;
	
	CLS_Scan_Rate_Timer 
	#(
		.CLK_RATE_HZ( CLK_RATE_HZ )
	)
	scan_rate_timer
	(
		// Input Signals
		.RATE_SELECT( RATE_SELECT ),
		
		// Output Signals
		.SRT_TICK( srt_tick ),
		
		// System Signals
		.CLK( CLK )
	);
	
	
	///////////////////////////////////////////////////////
	//
	// PWM Channels
	//
	// Generate 10 PWM Channels, synchronized to the same frequency,
	//  with fixed duty cycles ramping from full-on to full-off.
	//	
	
	//
	// PWM Interval Timer
	//
	wire pwm_timer_tick;
	
	CLS_PWM_Interval_Timer
	#(
		.CLK_RATE_HZ( CLK_RATE_HZ ), // Hz
		.DUTY_RATE_HZ( PWM_DUTY_RATE ) // Hz
	)
	pwm_interval_timer
	(
		// Output Signals
		.PWM_TICK( pwm_timer_tick ),
		
		// System Signals
		.CLK( CLK )
	);
	
	
	//
	// Verify in simulaiton that the generated PWM Interval period matches 
	//   the rate defined by the PWM_DUTY_RATE parameter.
	//
	specify
	
		specparam tPERIOD = (1.0 / PWM_DUTY_RATE) * 1000000000.0; // ns
	
		$period( posedge pwm_timer_tick, tPERIOD );
		
	endspecify

	
	//
	// Generate Simulation warning messages for common mistakes
	//
	always @(pwm_timer_tick)
	begin
		if (pwm_timer_tick === 1'bX)
		begin
			$display ("WARNING: pwm_timer_tick value is unknown (RED)! Check the CLS_PWM_Interval_Timer module.");
			$display ("         Remember to initialize any counter registers using the computed LOADVAL values.");
		end
	end
	
	
	//
	// PWM Duty Cycle Timer (one per LED channel)
	// 
	// Note: A generate block is used here to simplify instantiating 10
	//       instances of the same module.
	//
	localparam [7*10-1:0] PWM_DutyCycle_List = { 7'd100, 7'd50, 7'd25, 7'd20, 7'd16, 7'd12, 7'd8, 7'd4, 7'd2, 7'd0 };
	
	wire [9:0] pwm_channel_sigs;
	
	genvar i;  // General purpose variable used by generate for loops
	
	generate
	begin
	
		for (i=0; i < 10; i=i+1)
		begin : PWM_Channels
		
			//
			// PWM Duty Cycle Timer
			//
			CLS_PWM_DutyCycle_Timer
			#(
				.CLK_RATE_HZ( CLK_RATE_HZ ), // MHz
				.DUTY_RATE_HZ( PWM_DUTY_RATE ), // Hz
				.DUTY_PERCENT( PWM_DutyCycle_List[7*i +:7] ) // Cycle On-time %
			)
			pwm_dutycycle_timer
			(
				// Input Signals
				.PWM_INTERVAL_TICK( pwm_timer_tick ),
				
				// Output Signals
				.PWM_OUT( pwm_channel_sigs[i] ),
				
				// System Signals
				.CLK( CLK )
			);
	
		end
		
	end
	endgenerate
	
	
	//
	// LED Output Multiplexer
	//
	
	//!! Add CLS_LED_Output_Multiplexer instantiation here !!
	wire [9:0] pwm_out;
	
	CLS_LED_Output_Multiplexer led_output_multiplexer
	(
		//input signals
		.PWM_CHANNEL_SIGS(pwm_channel_sigs),
		.PWM_TIMER_TICK(pwm_timer_tick),
		.SRT_TICK(srt_tick),
		.CLK(CLK),
		
		//output signals
		.LEDR(LEDR)
	);
	
	
	
	
endmodule
