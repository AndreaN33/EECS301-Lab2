onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TF_EECS301_Lab2_TopLevel/CLOCK_50
add wave -noupdate /TF_EECS301_Lab2_TopLevel/SW
add wave -noupdate -expand /TF_EECS301_Lab2_TopLevel/LEDR
add wave -noupdate -divider CLS_Scanner
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/pwm_timer_tick
add wave -noupdate -expand /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/pwm_channel_sigs
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/srt_tick
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/led_output_multiplexer/frame_pos_sync
add wave -noupdate -divider PWM_Interval_Timer
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/pwm_interval_timer/pwm_inv_count_reg
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/pwm_interval_timer/pwm_inv_tick
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/pwm_interval_timer/PWM_TICK
add wave -noupdate -divider PWM_Channel_0
add wave -noupdate {/TF_EECS301_Lab2_TopLevel/uut/cls_scanner/genblk1/PWM_Channels[0]/pwm_dutycycle_timer/pdc_count_reg}
add wave -noupdate {/TF_EECS301_Lab2_TopLevel/uut/cls_scanner/genblk1/PWM_Channels[0]/pwm_dutycycle_timer/PWM_OUT}
add wave -noupdate -divider LED_Output_Multiplexer
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/led_output_multiplexer/SRT_TICK
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/led_output_multiplexer/PWM_CHANNEL_SIGS
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/led_output_multiplexer/frame_pos
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/led_output_multiplexer/next_frame_pos
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/led_output_multiplexer/frame_pos_sync
add wave -noupdate /TF_EECS301_Lab2_TopLevel/uut/cls_scanner/led_output_multiplexer/LEDR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8594017902 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 435
configure wave -valuecolwidth 73
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {105 ms}
run 10 ms
