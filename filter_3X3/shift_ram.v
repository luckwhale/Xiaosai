// megafunction wizard: %Shift register (RAM-based)%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTSHIFT_TAPS 

// ============================================================
// File Name: shift_ram.v
// Megafunction Name(s):
// 			ALTSHIFT_TAPS
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 17.1.0 Build 590 10/25/2017 SJ Lite Edition
// ************************************************************


//Copyright (C) 2017  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module shift_ram (
	clock,
	shiftin,
	shiftout,
	taps);

	input	  clock;
	input	[7:0]  shiftin;
	output	[7:0]  shiftout;
	output	[23:0]  taps;

	wire [7:0] sub_wire0;
	wire [23:0] sub_wire1;
	wire [7:0] shiftout = sub_wire0[7:0];
	wire [23:0] taps = sub_wire1[23:0];

	altshift_taps	ALTSHIFT_TAPS_component (
				.clock (clock),
				.shiftin (shiftin),
				.shiftout (sub_wire0),
				.taps (sub_wire1)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.sclr ()
				// synopsys translate_on
				);
	defparam
		ALTSHIFT_TAPS_component.intended_device_family = "Cyclone 10 LP",
		ALTSHIFT_TAPS_component.lpm_hint = "RAM_BLOCK_TYPE=AUTO",
		ALTSHIFT_TAPS_component.lpm_type = "altshift_taps",
		ALTSHIFT_TAPS_component.number_of_taps = 3,
		ALTSHIFT_TAPS_component.tap_distance = 64,
		ALTSHIFT_TAPS_component.width = 8;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "0"
// Retrieval info: PRIVATE: CLKEN NUMERIC "0"
// Retrieval info: PRIVATE: GROUP_TAPS NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone 10 LP"
// Retrieval info: PRIVATE: NUMBER_OF_TAPS NUMERIC "3"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "3"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: TAP_DISTANCE NUMERIC "64"
// Retrieval info: PRIVATE: WIDTH NUMERIC "8"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone 10 LP"
// Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=AUTO"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
// Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "3"
// Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "64"
// Retrieval info: CONSTANT: WIDTH NUMERIC "8"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: shiftin 0 0 8 0 INPUT NODEFVAL "shiftin[7..0]"
// Retrieval info: USED_PORT: shiftout 0 0 8 0 OUTPUT NODEFVAL "shiftout[7..0]"
// Retrieval info: USED_PORT: taps 0 0 24 0 OUTPUT NODEFVAL "taps[23..0]"
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @shiftin 0 0 8 0 shiftin 0 0 8 0
// Retrieval info: CONNECT: shiftout 0 0 8 0 @shiftout 0 0 8 0
// Retrieval info: CONNECT: taps 0 0 24 0 @taps 0 0 24 0
// Retrieval info: GEN_FILE: TYPE_NORMAL shift_ram.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL shift_ram.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL shift_ram.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL shift_ram.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL shift_ram_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL shift_ram_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL shift_ram_syn.v TRUE
// Retrieval info: LIB_FILE: altera_mf
