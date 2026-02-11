
//------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  assign idat = dat;
  assign rdy = irdy;
  assign ivld = vld;

endmodule


//------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_out_wait_v1 (dat, irdy, vld, idat, rdy, ivld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] dat;
  output             irdy;
  output             vld;
  input  [width-1:0] idat;
  input              rdy;
  input              ivld;

  wire   [width-1:0] dat;
  wire               irdy;
  wire               vld;

  assign dat = idat;
  assign irdy = rdy;
  assign vld = ivld;

endmodule



//------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_in_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_v1 (idat, dat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  input  [width-1:0] dat;

  wire   [width-1:0] idat;

  assign idat = dat;

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.4a/835166 Production Release
//  HLS Date:       Thu Sep  5 21:35:46 PDT 2019
// 
//  Generated by:   gel8580@finagle.wot.ece.northwestern.edu
//  Generated date: Thu Nov  6 11:24:41 2025
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module test_orig_core_core_fsm (
  clk, rst, core_wen, fsm_output
);
  input clk;
  input rst;
  input core_wen;
  output [1:0] fsm_output;
  reg [1:0] fsm_output;


  // FSM State Type Declaration for test_orig_core_core_fsm_1
  parameter
    core_rlp_C_0 = 1'd0,
    main_C_0 = 1'd1;

  reg [0:0] state_var;
  reg [0:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : test_orig_core_core_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 2'b10;
        state_var_NS = main_C_0;
      end
      // core_rlp_C_0
      default : begin
        fsm_output = 2'b01;
        state_var_NS = main_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= core_rlp_C_0;
    end
    else if ( core_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_staller
// ------------------------------------------------------------------


module test_orig_core_staller (
  clk, rst, core_wen, core_wten, a_in_rsci_wen_comp, b_in_rsci_wen_comp, result_rsci_wen_comp
);
  input clk;
  input rst;
  output core_wen;
  output core_wten;
  reg core_wten;
  input a_in_rsci_wen_comp;
  input b_in_rsci_wen_comp;
  input result_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign core_wen = a_in_rsci_wen_comp & b_in_rsci_wen_comp & result_rsci_wen_comp;
  always @(posedge clk) begin
    if ( rst ) begin
      core_wten <= 1'b0;
    end
    else begin
      core_wten <= ~ core_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
    (
  core_wten, valid_in_data_rsc_triosy_obj_iswt0, valid_in_data_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input valid_in_data_rsc_triosy_obj_iswt0;
  output valid_in_data_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign valid_in_data_rsc_triosy_obj_ld_core_sct = valid_in_data_rsc_triosy_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_result_rsci_result_wait_dp
// ------------------------------------------------------------------


module test_orig_core_result_rsci_result_wait_dp (
  clk, rst, result_rsci_oswt, result_rsci_wen_comp, result_rsci_biwt, result_rsci_bdwt,
      result_rsci_bcwt
);
  input clk;
  input rst;
  input result_rsci_oswt;
  output result_rsci_wen_comp;
  input result_rsci_biwt;
  input result_rsci_bdwt;
  output result_rsci_bcwt;
  reg result_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign result_rsci_wen_comp = (~ result_rsci_oswt) | result_rsci_biwt | result_rsci_bcwt;
  always @(posedge clk) begin
    if ( rst ) begin
      result_rsci_bcwt <= 1'b0;
    end
    else begin
      result_rsci_bcwt <= ~((~(result_rsci_bcwt | result_rsci_biwt)) | result_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_result_rsci_result_wait_ctrl
// ------------------------------------------------------------------


module test_orig_core_result_rsci_result_wait_ctrl (
  core_wen, result_rsci_oswt, result_rsci_irdy, result_rsci_biwt, result_rsci_bdwt,
      result_rsci_bcwt, result_rsci_ivld_core_sct
);
  input core_wen;
  input result_rsci_oswt;
  input result_rsci_irdy;
  output result_rsci_biwt;
  output result_rsci_bdwt;
  input result_rsci_bcwt;
  output result_rsci_ivld_core_sct;


  // Interconnect Declarations
  wire result_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign result_rsci_bdwt = result_rsci_oswt & core_wen;
  assign result_rsci_biwt = result_rsci_ogwt & result_rsci_irdy;
  assign result_rsci_ogwt = result_rsci_oswt & (~ result_rsci_bcwt);
  assign result_rsci_ivld_core_sct = result_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_b_in_rsci_b_in_wait_dp
// ------------------------------------------------------------------


module test_orig_core_b_in_rsci_b_in_wait_dp (
  clk, rst, b_in_rsci_oswt, b_in_rsci_wen_comp, b_in_rsci_idat_mxwt, b_in_rsci_biwt,
      b_in_rsci_bdwt, b_in_rsci_bcwt, b_in_rsci_idat
);
  input clk;
  input rst;
  input b_in_rsci_oswt;
  output b_in_rsci_wen_comp;
  output [127:0] b_in_rsci_idat_mxwt;
  input b_in_rsci_biwt;
  input b_in_rsci_bdwt;
  output b_in_rsci_bcwt;
  reg b_in_rsci_bcwt;
  input [127:0] b_in_rsci_idat;


  // Interconnect Declarations
  reg [127:0] b_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign b_in_rsci_wen_comp = (~ b_in_rsci_oswt) | b_in_rsci_biwt | b_in_rsci_bcwt;
  assign b_in_rsci_idat_mxwt = MUX_v_128_2_2(b_in_rsci_idat, b_in_rsci_idat_bfwt,
      b_in_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      b_in_rsci_bcwt <= 1'b0;
    end
    else begin
      b_in_rsci_bcwt <= ~((~(b_in_rsci_bcwt | b_in_rsci_biwt)) | b_in_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      b_in_rsci_idat_bfwt <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~ b_in_rsci_bcwt ) begin
      b_in_rsci_idat_bfwt <= b_in_rsci_idat_mxwt;
    end
  end

  function automatic [127:0] MUX_v_128_2_2;
    input [127:0] input_0;
    input [127:0] input_1;
    input [0:0] sel;
    reg [127:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_128_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_b_in_rsci_b_in_wait_ctrl
// ------------------------------------------------------------------


module test_orig_core_b_in_rsci_b_in_wait_ctrl (
  core_wen, b_in_rsci_oswt, b_in_rsci_biwt, b_in_rsci_bdwt, b_in_rsci_bcwt, b_in_rsci_irdy_core_sct,
      b_in_rsci_ivld
);
  input core_wen;
  input b_in_rsci_oswt;
  output b_in_rsci_biwt;
  output b_in_rsci_bdwt;
  input b_in_rsci_bcwt;
  output b_in_rsci_irdy_core_sct;
  input b_in_rsci_ivld;


  // Interconnect Declarations
  wire b_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign b_in_rsci_bdwt = b_in_rsci_oswt & core_wen;
  assign b_in_rsci_biwt = b_in_rsci_ogwt & b_in_rsci_ivld;
  assign b_in_rsci_ogwt = b_in_rsci_oswt & (~ b_in_rsci_bcwt);
  assign b_in_rsci_irdy_core_sct = b_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_a_in_rsci_a_in_wait_dp
// ------------------------------------------------------------------


module test_orig_core_a_in_rsci_a_in_wait_dp (
  clk, rst, a_in_rsci_oswt, a_in_rsci_wen_comp, a_in_rsci_idat_mxwt, a_in_rsci_biwt,
      a_in_rsci_bdwt, a_in_rsci_bcwt, a_in_rsci_idat
);
  input clk;
  input rst;
  input a_in_rsci_oswt;
  output a_in_rsci_wen_comp;
  output [127:0] a_in_rsci_idat_mxwt;
  input a_in_rsci_biwt;
  input a_in_rsci_bdwt;
  output a_in_rsci_bcwt;
  reg a_in_rsci_bcwt;
  input [127:0] a_in_rsci_idat;


  // Interconnect Declarations
  reg [127:0] a_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign a_in_rsci_wen_comp = (~ a_in_rsci_oswt) | a_in_rsci_biwt | a_in_rsci_bcwt;
  assign a_in_rsci_idat_mxwt = MUX_v_128_2_2(a_in_rsci_idat, a_in_rsci_idat_bfwt,
      a_in_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      a_in_rsci_bcwt <= 1'b0;
    end
    else begin
      a_in_rsci_bcwt <= ~((~(a_in_rsci_bcwt | a_in_rsci_biwt)) | a_in_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      a_in_rsci_idat_bfwt <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( ~ a_in_rsci_bcwt ) begin
      a_in_rsci_idat_bfwt <= a_in_rsci_idat_mxwt;
    end
  end

  function automatic [127:0] MUX_v_128_2_2;
    input [127:0] input_0;
    input [127:0] input_1;
    input [0:0] sel;
    reg [127:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_128_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_a_in_rsci_a_in_wait_ctrl
// ------------------------------------------------------------------


module test_orig_core_a_in_rsci_a_in_wait_ctrl (
  core_wen, a_in_rsci_oswt, a_in_rsci_biwt, a_in_rsci_bdwt, a_in_rsci_bcwt, a_in_rsci_irdy_core_sct,
      a_in_rsci_ivld
);
  input core_wen;
  input a_in_rsci_oswt;
  output a_in_rsci_biwt;
  output a_in_rsci_bdwt;
  input a_in_rsci_bcwt;
  output a_in_rsci_irdy_core_sct;
  input a_in_rsci_ivld;


  // Interconnect Declarations
  wire a_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign a_in_rsci_bdwt = a_in_rsci_oswt & core_wen;
  assign a_in_rsci_biwt = a_in_rsci_ogwt & a_in_rsci_ivld;
  assign a_in_rsci_ogwt = a_in_rsci_oswt & (~ a_in_rsci_bcwt);
  assign a_in_rsci_irdy_core_sct = a_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_valid_in_data_rsc_triosy_obj
// ------------------------------------------------------------------


module test_orig_core_valid_in_data_rsc_triosy_obj (
  valid_in_data_rsc_triosy_lz, core_wten, valid_in_data_rsc_triosy_obj_iswt0
);
  output valid_in_data_rsc_triosy_lz;
  input core_wten;
  input valid_in_data_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire valid_in_data_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) valid_in_data_rsc_triosy_obj (
      .ld(valid_in_data_rsc_triosy_obj_ld_core_sct),
      .lz(valid_in_data_rsc_triosy_lz)
    );
  test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
      test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .valid_in_data_rsc_triosy_obj_iswt0(valid_in_data_rsc_triosy_obj_iswt0),
      .valid_in_data_rsc_triosy_obj_ld_core_sct(valid_in_data_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_result_rsci
// ------------------------------------------------------------------


module test_orig_core_result_rsci (
  clk, rst, result_rsc_dat, result_rsc_vld, result_rsc_rdy, core_wen, result_rsci_oswt,
      result_rsci_wen_comp, result_rsci_idat
);
  input clk;
  input rst;
  output [19:0] result_rsc_dat;
  output result_rsc_vld;
  input result_rsc_rdy;
  input core_wen;
  input result_rsci_oswt;
  output result_rsci_wen_comp;
  input [19:0] result_rsci_idat;


  // Interconnect Declarations
  wire result_rsci_irdy;
  wire result_rsci_biwt;
  wire result_rsci_bdwt;
  wire result_rsci_bcwt;
  wire result_rsci_ivld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd4),
  .width(32'sd20)) result_rsci (
      .irdy(result_rsci_irdy),
      .ivld(result_rsci_ivld_core_sct),
      .idat(result_rsci_idat),
      .rdy(result_rsc_rdy),
      .vld(result_rsc_vld),
      .dat(result_rsc_dat)
    );
  test_orig_core_result_rsci_result_wait_ctrl test_orig_core_result_rsci_result_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .result_rsci_oswt(result_rsci_oswt),
      .result_rsci_irdy(result_rsci_irdy),
      .result_rsci_biwt(result_rsci_biwt),
      .result_rsci_bdwt(result_rsci_bdwt),
      .result_rsci_bcwt(result_rsci_bcwt),
      .result_rsci_ivld_core_sct(result_rsci_ivld_core_sct)
    );
  test_orig_core_result_rsci_result_wait_dp test_orig_core_result_rsci_result_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .result_rsci_oswt(result_rsci_oswt),
      .result_rsci_wen_comp(result_rsci_wen_comp),
      .result_rsci_biwt(result_rsci_biwt),
      .result_rsci_bdwt(result_rsci_bdwt),
      .result_rsci_bcwt(result_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_b_in_rsci
// ------------------------------------------------------------------


module test_orig_core_b_in_rsci (
  clk, rst, b_in_rsc_dat, b_in_rsc_vld, b_in_rsc_rdy, core_wen, b_in_rsci_oswt, b_in_rsci_wen_comp,
      b_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input [127:0] b_in_rsc_dat;
  input b_in_rsc_vld;
  output b_in_rsc_rdy;
  input core_wen;
  input b_in_rsci_oswt;
  output b_in_rsci_wen_comp;
  output [127:0] b_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire b_in_rsci_biwt;
  wire b_in_rsci_bdwt;
  wire b_in_rsci_bcwt;
  wire b_in_rsci_irdy_core_sct;
  wire b_in_rsci_ivld;
  wire [127:0] b_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd2),
  .width(32'sd128)) b_in_rsci (
      .rdy(b_in_rsc_rdy),
      .vld(b_in_rsc_vld),
      .dat(b_in_rsc_dat),
      .irdy(b_in_rsci_irdy_core_sct),
      .ivld(b_in_rsci_ivld),
      .idat(b_in_rsci_idat)
    );
  test_orig_core_b_in_rsci_b_in_wait_ctrl test_orig_core_b_in_rsci_b_in_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .b_in_rsci_oswt(b_in_rsci_oswt),
      .b_in_rsci_biwt(b_in_rsci_biwt),
      .b_in_rsci_bdwt(b_in_rsci_bdwt),
      .b_in_rsci_bcwt(b_in_rsci_bcwt),
      .b_in_rsci_irdy_core_sct(b_in_rsci_irdy_core_sct),
      .b_in_rsci_ivld(b_in_rsci_ivld)
    );
  test_orig_core_b_in_rsci_b_in_wait_dp test_orig_core_b_in_rsci_b_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .b_in_rsci_oswt(b_in_rsci_oswt),
      .b_in_rsci_wen_comp(b_in_rsci_wen_comp),
      .b_in_rsci_idat_mxwt(b_in_rsci_idat_mxwt),
      .b_in_rsci_biwt(b_in_rsci_biwt),
      .b_in_rsci_bdwt(b_in_rsci_bdwt),
      .b_in_rsci_bcwt(b_in_rsci_bcwt),
      .b_in_rsci_idat(b_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_a_in_rsci
// ------------------------------------------------------------------


module test_orig_core_a_in_rsci (
  clk, rst, a_in_rsc_dat, a_in_rsc_vld, a_in_rsc_rdy, core_wen, a_in_rsci_oswt, a_in_rsci_wen_comp,
      a_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input [127:0] a_in_rsc_dat;
  input a_in_rsc_vld;
  output a_in_rsc_rdy;
  input core_wen;
  input a_in_rsci_oswt;
  output a_in_rsci_wen_comp;
  output [127:0] a_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire a_in_rsci_biwt;
  wire a_in_rsci_bdwt;
  wire a_in_rsci_bcwt;
  wire a_in_rsci_irdy_core_sct;
  wire a_in_rsci_ivld;
  wire [127:0] a_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd128)) a_in_rsci (
      .rdy(a_in_rsc_rdy),
      .vld(a_in_rsc_vld),
      .dat(a_in_rsc_dat),
      .irdy(a_in_rsci_irdy_core_sct),
      .ivld(a_in_rsci_ivld),
      .idat(a_in_rsci_idat)
    );
  test_orig_core_a_in_rsci_a_in_wait_ctrl test_orig_core_a_in_rsci_a_in_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .a_in_rsci_oswt(a_in_rsci_oswt),
      .a_in_rsci_biwt(a_in_rsci_biwt),
      .a_in_rsci_bdwt(a_in_rsci_bdwt),
      .a_in_rsci_bcwt(a_in_rsci_bcwt),
      .a_in_rsci_irdy_core_sct(a_in_rsci_irdy_core_sct),
      .a_in_rsci_ivld(a_in_rsci_ivld)
    );
  test_orig_core_a_in_rsci_a_in_wait_dp test_orig_core_a_in_rsci_a_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .a_in_rsci_oswt(a_in_rsci_oswt),
      .a_in_rsci_wen_comp(a_in_rsci_wen_comp),
      .a_in_rsci_idat_mxwt(a_in_rsci_idat_mxwt),
      .a_in_rsci_biwt(a_in_rsci_biwt),
      .a_in_rsci_bdwt(a_in_rsci_bdwt),
      .a_in_rsci_bcwt(a_in_rsci_bcwt),
      .a_in_rsci_idat(a_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_core
// ------------------------------------------------------------------


module test_orig_core (
  clk, rst, a_in_rsc_dat, a_in_rsc_vld, a_in_rsc_rdy, b_in_rsc_dat, b_in_rsc_vld,
      b_in_rsc_rdy, valid_in_data_rsc_dat, valid_in_data_rsc_triosy_lz, result_rsc_dat,
      result_rsc_vld, result_rsc_rdy
);
  input clk;
  input rst;
  input [127:0] a_in_rsc_dat;
  input a_in_rsc_vld;
  output a_in_rsc_rdy;
  input [127:0] b_in_rsc_dat;
  input b_in_rsc_vld;
  output b_in_rsc_rdy;
  input [15:0] valid_in_data_rsc_dat;
  output valid_in_data_rsc_triosy_lz;
  output [19:0] result_rsc_dat;
  output result_rsc_vld;
  input result_rsc_rdy;


  // Interconnect Declarations
  wire core_wen;
  wire core_wten;
  wire a_in_rsci_wen_comp;
  wire [127:0] a_in_rsci_idat_mxwt;
  wire b_in_rsci_wen_comp;
  wire [127:0] b_in_rsci_idat_mxwt;
  wire [15:0] valid_in_data_rsci_idat;
  wire result_rsci_wen_comp;
  reg [19:0] result_rsci_idat;
  wire [1:0] fsm_output;
  wire or_dcpl_2;
  wire or_dcpl_3;
  wire and_dcpl_4;
  wire and_dcpl_10;
  wire or_dcpl_4;
  wire or_dcpl_5;
  wire or_dcpl_7;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire and_dcpl_30;
  wire and_dcpl_38;
  wire or_dcpl_10;
  wire and_dcpl_46;
  wire or_dcpl_11;
  wire and_dcpl_55;
  wire and_dcpl_59;
  wire or_dcpl_13;
  wire or_dcpl_14;
  wire or_dcpl_15;
  wire and_dcpl_79;
  wire or_dcpl_18;
  wire or_dcpl_21;
  wire and_dcpl_92;
  reg MAC_16_slc_valid_data_1_0_1_itm_3;
  reg MAC_16_slc_valid_data_1_0_itm_7;
  reg main_stage_0_8;
  reg MAC_14_slc_valid_data_1_0_1_itm_2;
  reg MAC_14_slc_valid_data_1_0_itm_6;
  reg main_stage_0_7;
  reg MAC_15_slc_valid_data_1_0_1_itm_2;
  reg MAC_16_slc_valid_data_1_0_1_itm_2;
  reg MAC_15_slc_valid_data_1_0_itm_6;
  reg MAC_16_slc_valid_data_1_0_itm_6;
  reg main_stage_0_6;
  reg MAC_12_slc_valid_data_1_0_1_itm_1;
  reg MAC_12_slc_valid_data_1_0_itm_5;
  reg MAC_13_slc_valid_data_1_0_1_itm_1;
  reg MAC_15_slc_valid_data_1_0_1_itm_1;
  reg MAC_14_slc_valid_data_1_0_1_itm_1;
  reg MAC_14_slc_valid_data_1_0_itm_5;
  reg MAC_16_slc_valid_data_1_0_1_itm_1;
  reg MAC_13_slc_valid_data_1_0_itm_5;
  reg MAC_16_slc_valid_data_1_0_itm_5;
  reg MAC_15_slc_valid_data_1_0_itm_5;
  reg [8:0] valid_data_sva_4_15_7;
  reg MAC_10_slc_valid_data_1_0_itm_4;
  reg MAC_11_slc_valid_data_1_0_itm_4;
  reg main_stage_0_5;
  reg MAC_16_slc_valid_data_1_0_itm_4;
  reg MAC_15_slc_valid_data_1_0_itm_4;
  reg MAC_14_slc_valid_data_1_0_itm_4;
  reg MAC_13_slc_valid_data_1_0_itm_4;
  reg MAC_12_slc_valid_data_1_0_itm_4;
  reg [10:0] valid_data_sva_3_15_5;
  reg main_stage_0_4;
  reg MAC_16_slc_valid_data_1_0_itm_3;
  reg MAC_15_slc_valid_data_1_0_itm_3;
  reg MAC_14_slc_valid_data_1_0_itm_3;
  reg MAC_13_slc_valid_data_1_0_itm_3;
  reg MAC_12_slc_valid_data_1_0_itm_3;
  reg MAC_11_slc_valid_data_1_0_itm_3;
  reg MAC_10_slc_valid_data_1_0_itm_3;
  reg MAC_8_slc_valid_data_1_0_itm_3;
  reg MAC_9_slc_valid_data_1_0_itm_3;
  reg [12:0] valid_data_sva_2_15_3;
  reg main_stage_0_3;
  reg [14:0] valid_data_sva_1_15_1;
  reg main_stage_0_9;
  reg MAC_16_slc_valid_data_1_0_1_itm_4;
  reg MAC_15_slc_valid_data_1_0_1_itm_3;
  reg MAC_13_slc_valid_data_1_0_1_itm_2;
  reg MAC_11_slc_valid_data_1_0_1_itm_1;
  reg MAC_14_slc_valid_data_1_0_1_itm_3;
  reg MAC_12_slc_valid_data_1_0_1_itm_2;
  reg MAC_10_slc_valid_data_1_0_1_itm_1;
  reg reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse;
  reg reg_result_rsci_ivld_core_psct_cse;
  reg reg_b_in_rsci_irdy_core_psct_cse;
  reg [19:0] acc_lpi_1_dfm_1;
  reg [19:0] acc_lpi_1_dfm_2_1;
  reg [19:0] acc_lpi_1_dfm_4_1;
  reg [19:0] acc_lpi_1_dfm_6_1;
  reg [19:0] acc_lpi_1_dfm_8_1;
  reg [19:0] acc_lpi_1_dfm_10_1;
  reg [19:0] acc_lpi_1_dfm_12_1;
  reg [19:0] acc_lpi_1_dfm_14_1;
  reg [15:0] MAC_2_if_mul_itm_1;
  reg [15:0] MAC_3_if_mul_itm_1;
  reg [15:0] MAC_4_if_mul_itm_1;
  reg [15:0] MAC_4_if_mul_itm_2;
  reg [15:0] MAC_5_if_mul_itm_1;
  reg [15:0] MAC_5_if_mul_itm_2;
  reg [15:0] MAC_6_if_mul_itm_1;
  reg [15:0] MAC_6_if_mul_itm_2;
  reg [15:0] MAC_6_if_mul_itm_3;
  reg [15:0] MAC_7_if_mul_itm_1;
  reg [15:0] MAC_7_if_mul_itm_2;
  reg [15:0] MAC_7_if_mul_itm_3;
  reg [15:0] MAC_8_if_mul_itm_1;
  reg [15:0] MAC_8_if_mul_itm_2;
  reg [15:0] MAC_8_if_mul_itm_3;
  reg [15:0] MAC_8_if_mul_itm_4;
  reg [15:0] MAC_9_if_mul_itm_1;
  reg [15:0] MAC_9_if_mul_itm_2;
  reg [15:0] MAC_9_if_mul_itm_3;
  reg [15:0] MAC_9_if_mul_itm_4;
  reg [15:0] MAC_10_if_mul_itm_1;
  reg [15:0] MAC_10_if_mul_itm_2;
  reg [15:0] MAC_10_if_mul_itm_3;
  reg [15:0] MAC_10_if_mul_itm_4;
  reg [15:0] MAC_10_if_mul_itm_5;
  reg [15:0] MAC_11_if_mul_itm_1;
  reg [15:0] MAC_11_if_mul_itm_2;
  reg [15:0] MAC_11_if_mul_itm_3;
  reg [15:0] MAC_11_if_mul_itm_4;
  reg [15:0] MAC_11_if_mul_itm_5;
  reg [15:0] MAC_12_if_mul_itm_1;
  reg [15:0] MAC_12_if_mul_itm_2;
  reg [15:0] MAC_12_if_mul_itm_3;
  reg [15:0] MAC_12_if_mul_itm_4;
  reg [15:0] MAC_12_if_mul_itm_5;
  reg [15:0] MAC_12_if_mul_itm_6;
  reg [15:0] MAC_13_if_mul_itm_1;
  reg [15:0] MAC_13_if_mul_itm_2;
  reg [15:0] MAC_13_if_mul_itm_3;
  reg [15:0] MAC_13_if_mul_itm_4;
  reg [15:0] MAC_13_if_mul_itm_5;
  reg [15:0] MAC_13_if_mul_itm_6;
  reg [15:0] MAC_14_if_mul_itm_1;
  reg [15:0] MAC_14_if_mul_itm_2;
  reg [15:0] MAC_14_if_mul_itm_3;
  reg [15:0] MAC_14_if_mul_itm_4;
  reg [15:0] MAC_14_if_mul_itm_5;
  reg [15:0] MAC_14_if_mul_itm_6;
  reg [15:0] MAC_14_if_mul_itm_7;
  reg [15:0] MAC_15_if_mul_itm_1;
  reg [15:0] MAC_15_if_mul_itm_2;
  reg [15:0] MAC_15_if_mul_itm_3;
  reg [15:0] MAC_15_if_mul_itm_4;
  reg [15:0] MAC_15_if_mul_itm_5;
  reg [15:0] MAC_15_if_mul_itm_6;
  reg [15:0] MAC_15_if_mul_itm_7;
  reg [15:0] MAC_16_if_mul_itm_1;
  reg [15:0] MAC_16_if_mul_itm_2;
  reg [15:0] MAC_16_if_mul_itm_3;
  reg [15:0] MAC_16_if_mul_itm_4;
  reg [15:0] MAC_16_if_mul_itm_5;
  reg [15:0] MAC_16_if_mul_itm_6;
  reg [15:0] MAC_16_if_mul_itm_7;
  reg [15:0] MAC_16_if_mul_itm_8;
  wire [19:0] acc_lpi_1_dfm_13_mx0;
  wire [19:0] acc_lpi_1_dfm_11_mx0;
  wire [19:0] acc_lpi_1_dfm_9_mx0;
  wire [19:0] acc_lpi_1_dfm_7_mx0;
  wire [19:0] acc_lpi_1_dfm_5_mx0;
  wire [19:0] acc_lpi_1_dfm_3_mx0;
  wire [19:0] acc_lpi_1_dfm_1_mx0;
  wire MAC_if_and_7_cse;
  wire MAC_if_and_9_cse;
  wire MAC_if_and_11_cse;
  wire MAC_if_and_13_cse;
  wire MAC_if_and_15_cse;
  wire MAC_if_and_6_cse;

  wire[19:0] MAC_16_if_acc_nl;
  wire[20:0] nl_MAC_16_if_acc_nl;
  wire[0:0] and_184_nl;
  wire[18:0] MAC_15_if_acc_nl;
  wire[19:0] nl_MAC_15_if_acc_nl;
  wire[18:0] MAC_13_if_acc_nl;
  wire[19:0] nl_MAC_13_if_acc_nl;
  wire[18:0] MAC_11_if_acc_nl;
  wire[19:0] nl_MAC_11_if_acc_nl;
  wire[18:0] MAC_9_if_acc_nl;
  wire[19:0] nl_MAC_9_if_acc_nl;
  wire[17:0] MAC_7_if_acc_nl;
  wire[18:0] nl_MAC_7_if_acc_nl;
  wire[17:0] MAC_5_if_acc_nl;
  wire[18:0] nl_MAC_5_if_acc_nl;
  wire[16:0] MAC_3_if_acc_nl;
  wire[17:0] nl_MAC_3_if_acc_nl;
  wire[15:0] MAC_1_if_mul_nl;
  wire[18:0] MAC_14_if_acc_nl;
  wire[19:0] nl_MAC_14_if_acc_nl;
  wire[18:0] MAC_12_if_acc_nl;
  wire[19:0] nl_MAC_12_if_acc_nl;
  wire[18:0] MAC_10_if_acc_nl;
  wire[19:0] nl_MAC_10_if_acc_nl;
  wire[18:0] MAC_8_if_acc_nl;
  wire[19:0] nl_MAC_8_if_acc_nl;
  wire[17:0] MAC_6_if_acc_nl;
  wire[18:0] nl_MAC_6_if_acc_nl;
  wire[17:0] MAC_4_if_acc_nl;
  wire[18:0] nl_MAC_4_if_acc_nl;
  wire[16:0] MAC_2_if_acc_nl;
  wire[17:0] nl_MAC_2_if_acc_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd16)) valid_in_data_rsci (
      .dat(valid_in_data_rsc_dat),
      .idat(valid_in_data_rsci_idat)
    );
  test_orig_core_a_in_rsci test_orig_core_a_in_rsci_inst (
      .clk(clk),
      .rst(rst),
      .a_in_rsc_dat(a_in_rsc_dat),
      .a_in_rsc_vld(a_in_rsc_vld),
      .a_in_rsc_rdy(a_in_rsc_rdy),
      .core_wen(core_wen),
      .a_in_rsci_oswt(reg_b_in_rsci_irdy_core_psct_cse),
      .a_in_rsci_wen_comp(a_in_rsci_wen_comp),
      .a_in_rsci_idat_mxwt(a_in_rsci_idat_mxwt)
    );
  test_orig_core_b_in_rsci test_orig_core_b_in_rsci_inst (
      .clk(clk),
      .rst(rst),
      .b_in_rsc_dat(b_in_rsc_dat),
      .b_in_rsc_vld(b_in_rsc_vld),
      .b_in_rsc_rdy(b_in_rsc_rdy),
      .core_wen(core_wen),
      .b_in_rsci_oswt(reg_b_in_rsci_irdy_core_psct_cse),
      .b_in_rsci_wen_comp(b_in_rsci_wen_comp),
      .b_in_rsci_idat_mxwt(b_in_rsci_idat_mxwt)
    );
  test_orig_core_result_rsci test_orig_core_result_rsci_inst (
      .clk(clk),
      .rst(rst),
      .result_rsc_dat(result_rsc_dat),
      .result_rsc_vld(result_rsc_vld),
      .result_rsc_rdy(result_rsc_rdy),
      .core_wen(core_wen),
      .result_rsci_oswt(reg_result_rsci_ivld_core_psct_cse),
      .result_rsci_wen_comp(result_rsci_wen_comp),
      .result_rsci_idat(result_rsci_idat)
    );
  test_orig_core_valid_in_data_rsc_triosy_obj test_orig_core_valid_in_data_rsc_triosy_obj_inst
      (
      .valid_in_data_rsc_triosy_lz(valid_in_data_rsc_triosy_lz),
      .core_wten(core_wten),
      .valid_in_data_rsc_triosy_obj_iswt0(reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse)
    );
  test_orig_core_staller test_orig_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .a_in_rsci_wen_comp(a_in_rsci_wen_comp),
      .b_in_rsci_wen_comp(b_in_rsci_wen_comp),
      .result_rsci_wen_comp(result_rsci_wen_comp)
    );
  test_orig_core_core_fsm test_orig_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output)
    );
  assign MAC_if_and_6_cse = core_wen & main_stage_0_7;
  assign MAC_if_and_7_cse = core_wen & main_stage_0_6;
  assign MAC_if_and_9_cse = core_wen & main_stage_0_5;
  assign MAC_if_and_11_cse = core_wen & main_stage_0_4;
  assign MAC_if_and_13_cse = core_wen & main_stage_0_3;
  assign MAC_if_and_15_cse = core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse;
  assign nl_MAC_14_if_acc_nl = (acc_lpi_1_dfm_12_1[18:0]) + conv_s2s_16_19(MAC_14_if_mul_itm_7);
  assign MAC_14_if_acc_nl = nl_MAC_14_if_acc_nl[18:0];
  assign acc_lpi_1_dfm_13_mx0 = MUX_v_20_2_2(acc_lpi_1_dfm_12_1, (signext_20_19(MAC_14_if_acc_nl)),
      MAC_14_slc_valid_data_1_0_1_itm_3);
  assign nl_MAC_12_if_acc_nl = (acc_lpi_1_dfm_10_1[18:0]) + conv_s2s_16_19(MAC_12_if_mul_itm_6);
  assign MAC_12_if_acc_nl = nl_MAC_12_if_acc_nl[18:0];
  assign acc_lpi_1_dfm_11_mx0 = MUX_v_20_2_2(acc_lpi_1_dfm_10_1, (signext_20_19(MAC_12_if_acc_nl)),
      MAC_12_slc_valid_data_1_0_1_itm_2);
  assign nl_MAC_10_if_acc_nl = (acc_lpi_1_dfm_8_1[18:0]) + conv_s2s_16_19(MAC_10_if_mul_itm_5);
  assign MAC_10_if_acc_nl = nl_MAC_10_if_acc_nl[18:0];
  assign acc_lpi_1_dfm_9_mx0 = MUX_v_20_2_2(acc_lpi_1_dfm_8_1, (signext_20_19(MAC_10_if_acc_nl)),
      MAC_10_slc_valid_data_1_0_1_itm_1);
  assign nl_MAC_8_if_acc_nl = conv_s2s_18_19(acc_lpi_1_dfm_6_1[17:0]) + conv_s2s_16_19(MAC_8_if_mul_itm_4);
  assign MAC_8_if_acc_nl = nl_MAC_8_if_acc_nl[18:0];
  assign acc_lpi_1_dfm_7_mx0 = MUX_v_20_2_2(acc_lpi_1_dfm_6_1, (signext_20_19(MAC_8_if_acc_nl)),
      valid_data_sva_4_15_7[0]);
  assign nl_MAC_6_if_acc_nl = (acc_lpi_1_dfm_4_1[17:0]) + conv_s2s_16_18(MAC_6_if_mul_itm_3);
  assign MAC_6_if_acc_nl = nl_MAC_6_if_acc_nl[17:0];
  assign acc_lpi_1_dfm_5_mx0 = MUX_v_20_2_2(acc_lpi_1_dfm_4_1, (signext_20_18(MAC_6_if_acc_nl)),
      valid_data_sva_3_15_5[0]);
  assign nl_MAC_4_if_acc_nl = conv_s2s_17_18(acc_lpi_1_dfm_2_1[16:0]) + conv_s2s_16_18(MAC_4_if_mul_itm_2);
  assign MAC_4_if_acc_nl = nl_MAC_4_if_acc_nl[17:0];
  assign acc_lpi_1_dfm_3_mx0 = MUX_v_20_2_2(acc_lpi_1_dfm_2_1, (signext_20_18(MAC_4_if_acc_nl)),
      valid_data_sva_2_15_3[0]);
  assign nl_MAC_2_if_acc_nl = conv_s2s_16_17(acc_lpi_1_dfm_1[15:0]) + conv_s2s_16_17(MAC_2_if_mul_itm_1);
  assign MAC_2_if_acc_nl = nl_MAC_2_if_acc_nl[16:0];
  assign acc_lpi_1_dfm_1_mx0 = MUX_v_20_2_2(acc_lpi_1_dfm_1, (signext_20_17(MAC_2_if_acc_nl)),
      valid_data_sva_1_15_1[0]);
  assign or_dcpl_2 = MAC_15_slc_valid_data_1_0_itm_6 | (~ MAC_15_slc_valid_data_1_0_1_itm_2);
  assign or_dcpl_3 = MAC_16_slc_valid_data_1_0_itm_6 | (~ MAC_16_slc_valid_data_1_0_1_itm_2);
  assign and_dcpl_4 = or_dcpl_3 & or_dcpl_2;
  assign and_dcpl_10 = or_dcpl_3 & main_stage_0_7;
  assign or_dcpl_4 = MAC_13_slc_valid_data_1_0_itm_5 | (~ MAC_13_slc_valid_data_1_0_1_itm_1);
  assign or_dcpl_5 = MAC_15_slc_valid_data_1_0_itm_5 | (~ MAC_15_slc_valid_data_1_0_1_itm_1);
  assign or_dcpl_7 = MAC_16_slc_valid_data_1_0_itm_5 | (~ MAC_16_slc_valid_data_1_0_1_itm_1);
  assign and_dcpl_17 = or_dcpl_7 & (MAC_14_slc_valid_data_1_0_itm_5 | (~ MAC_14_slc_valid_data_1_0_1_itm_1));
  assign and_dcpl_18 = and_dcpl_17 & or_dcpl_5;
  assign and_dcpl_30 = or_dcpl_7 & main_stage_0_6;
  assign and_dcpl_38 = (MAC_11_slc_valid_data_1_0_itm_4 | (~ (valid_data_sva_4_15_7[3])))
      & main_stage_0_5;
  assign or_dcpl_10 = MAC_16_slc_valid_data_1_0_itm_4 | (~ (valid_data_sva_4_15_7[8]));
  assign and_dcpl_46 = or_dcpl_10 & main_stage_0_5;
  assign or_dcpl_11 = MAC_15_slc_valid_data_1_0_itm_4 | (~ (valid_data_sva_4_15_7[7]));
  assign and_dcpl_55 = (MAC_14_slc_valid_data_1_0_itm_4 | (~ (valid_data_sva_4_15_7[6])))
      & or_dcpl_10;
  assign and_dcpl_59 = and_dcpl_55 & or_dcpl_11;
  assign or_dcpl_13 = MAC_13_slc_valid_data_1_0_itm_4 | (~ (valid_data_sva_4_15_7[5]));
  assign or_dcpl_14 = MAC_16_slc_valid_data_1_0_itm_3 | (~ (valid_data_sva_3_15_5[10]));
  assign or_dcpl_15 = (~ (valid_data_sva_3_15_5[9])) | MAC_15_slc_valid_data_1_0_itm_3;
  assign and_dcpl_79 = (MAC_14_slc_valid_data_1_0_itm_3 | (~ (valid_data_sva_3_15_5[8])))
      & or_dcpl_14 & or_dcpl_15;
  assign or_dcpl_18 = MAC_11_slc_valid_data_1_0_itm_3 | (~ (valid_data_sva_3_15_5[5]));
  assign or_dcpl_21 = MAC_10_slc_valid_data_1_0_itm_3 | (~ (valid_data_sva_3_15_5[4]));
  assign and_dcpl_92 = or_dcpl_21 & (MAC_9_slc_valid_data_1_0_itm_3 | (~ (valid_data_sva_3_15_5[3])))
      & or_dcpl_18;
  always @(posedge clk) begin
    if ( rst ) begin
      reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= 1'b0;
      reg_result_rsci_ivld_core_psct_cse <= 1'b0;
      reg_b_in_rsci_irdy_core_psct_cse <= 1'b0;
      main_stage_0_3 <= 1'b0;
      main_stage_0_4 <= 1'b0;
      main_stage_0_5 <= 1'b0;
      main_stage_0_6 <= 1'b0;
      main_stage_0_7 <= 1'b0;
      main_stage_0_8 <= 1'b0;
      main_stage_0_9 <= 1'b0;
      acc_lpi_1_dfm_10_1 <= 20'b00000000000000000000;
      acc_lpi_1_dfm_1 <= 20'b00000000000000000000;
      valid_data_sva_1_15_1 <= 15'b000000000000000;
    end
    else if ( core_wen ) begin
      reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= fsm_output[1];
      reg_result_rsci_ivld_core_psct_cse <= main_stage_0_9;
      reg_b_in_rsci_irdy_core_psct_cse <= 1'b1;
      main_stage_0_3 <= reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse;
      main_stage_0_4 <= main_stage_0_3;
      main_stage_0_5 <= main_stage_0_4;
      main_stage_0_6 <= main_stage_0_5;
      main_stage_0_7 <= main_stage_0_6;
      main_stage_0_8 <= main_stage_0_7;
      main_stage_0_9 <= main_stage_0_8;
      acc_lpi_1_dfm_10_1 <= MUX_v_20_2_2(acc_lpi_1_dfm_9_mx0, (signext_20_19(MAC_11_if_acc_nl)),
          MAC_11_slc_valid_data_1_0_1_itm_1);
      acc_lpi_1_dfm_1 <= MUX_v_20_2_2(20'b00000000000000000000, (signext_20_16(MAC_1_if_mul_nl)),
          (valid_in_data_rsci_idat[0]));
      valid_data_sva_1_15_1 <= valid_in_data_rsci_idat[15:1];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      result_rsci_idat <= 20'b00000000000000000000;
    end
    else if ( core_wen & main_stage_0_9 ) begin
      result_rsci_idat <= MUX_v_20_2_2((MAC_16_if_acc_nl), acc_lpi_1_dfm_14_1, and_184_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      acc_lpi_1_dfm_14_1 <= 20'b00000000000000000000;
    end
    else if ( core_wen & (MAC_16_slc_valid_data_1_0_itm_7 | (~ MAC_16_slc_valid_data_1_0_1_itm_3))
        & main_stage_0_8 ) begin
      acc_lpi_1_dfm_14_1 <= MUX_v_20_2_2(acc_lpi_1_dfm_13_mx0, (signext_20_19(MAC_15_if_acc_nl)),
          MAC_15_slc_valid_data_1_0_1_itm_3);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_8 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_8 & MAC_16_slc_valid_data_1_0_itm_7 & MAC_16_slc_valid_data_1_0_1_itm_3
        ) begin
      MAC_16_if_mul_itm_8 <= MAC_16_if_mul_itm_7;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_slc_valid_data_1_0_1_itm_4 <= 1'b0;
    end
    else if ( core_wen & main_stage_0_8 ) begin
      MAC_16_slc_valid_data_1_0_1_itm_4 <= MAC_16_slc_valid_data_1_0_1_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      acc_lpi_1_dfm_12_1 <= 20'b00000000000000000000;
    end
    else if ( core_wen & and_dcpl_4 & (MAC_14_slc_valid_data_1_0_itm_6 | (~ MAC_14_slc_valid_data_1_0_1_itm_2))
        & main_stage_0_7 ) begin
      acc_lpi_1_dfm_12_1 <= MUX_v_20_2_2(acc_lpi_1_dfm_11_mx0, (signext_20_19(MAC_13_if_acc_nl)),
          MAC_13_slc_valid_data_1_0_1_itm_2);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_if_mul_itm_7 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_4 & main_stage_0_7 & MAC_14_slc_valid_data_1_0_itm_6
        & MAC_14_slc_valid_data_1_0_1_itm_2 ) begin
      MAC_14_if_mul_itm_7 <= MAC_14_if_mul_itm_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_if_mul_itm_7 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_10 & MAC_15_slc_valid_data_1_0_itm_6 & MAC_15_slc_valid_data_1_0_1_itm_2
        ) begin
      MAC_15_if_mul_itm_7 <= MAC_15_if_mul_itm_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_slc_valid_data_1_0_1_itm_3 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_10 ) begin
      MAC_15_slc_valid_data_1_0_1_itm_3 <= MAC_15_slc_valid_data_1_0_1_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_slc_valid_data_1_0_1_itm_3 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_10 & or_dcpl_2 ) begin
      MAC_14_slc_valid_data_1_0_1_itm_3 <= MAC_14_slc_valid_data_1_0_1_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_slc_valid_data_1_0_itm_7 <= 1'b0;
      MAC_16_slc_valid_data_1_0_1_itm_3 <= 1'b0;
    end
    else if ( MAC_if_and_6_cse ) begin
      MAC_16_slc_valid_data_1_0_itm_7 <= MAC_16_slc_valid_data_1_0_itm_6;
      MAC_16_slc_valid_data_1_0_1_itm_3 <= MAC_16_slc_valid_data_1_0_1_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_slc_valid_data_1_0_itm_6 <= 1'b0;
      MAC_14_slc_valid_data_1_0_itm_6 <= 1'b0;
      MAC_16_slc_valid_data_1_0_itm_6 <= 1'b0;
      MAC_16_slc_valid_data_1_0_1_itm_2 <= 1'b0;
    end
    else if ( MAC_if_and_7_cse ) begin
      MAC_15_slc_valid_data_1_0_itm_6 <= MAC_15_slc_valid_data_1_0_itm_5;
      MAC_14_slc_valid_data_1_0_itm_6 <= MAC_14_slc_valid_data_1_0_itm_5;
      MAC_16_slc_valid_data_1_0_itm_6 <= MAC_16_slc_valid_data_1_0_itm_5;
      MAC_16_slc_valid_data_1_0_1_itm_2 <= MAC_16_slc_valid_data_1_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_slc_valid_data_1_0_itm_5 <= 1'b0;
      MAC_12_slc_valid_data_1_0_itm_5 <= 1'b0;
      MAC_15_slc_valid_data_1_0_itm_5 <= 1'b0;
      MAC_14_slc_valid_data_1_0_itm_5 <= 1'b0;
      MAC_11_slc_valid_data_1_0_1_itm_1 <= 1'b0;
      MAC_16_slc_valid_data_1_0_itm_5 <= 1'b0;
      MAC_16_slc_valid_data_1_0_1_itm_1 <= 1'b0;
    end
    else if ( MAC_if_and_9_cse ) begin
      MAC_13_slc_valid_data_1_0_itm_5 <= MAC_13_slc_valid_data_1_0_itm_4;
      MAC_12_slc_valid_data_1_0_itm_5 <= MAC_12_slc_valid_data_1_0_itm_4;
      MAC_15_slc_valid_data_1_0_itm_5 <= MAC_15_slc_valid_data_1_0_itm_4;
      MAC_14_slc_valid_data_1_0_itm_5 <= MAC_14_slc_valid_data_1_0_itm_4;
      MAC_11_slc_valid_data_1_0_1_itm_1 <= valid_data_sva_4_15_7[3];
      MAC_16_slc_valid_data_1_0_itm_5 <= MAC_16_slc_valid_data_1_0_itm_4;
      MAC_16_slc_valid_data_1_0_1_itm_1 <= valid_data_sva_4_15_7[8];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_11_slc_valid_data_1_0_itm_4 <= 1'b0;
      MAC_10_slc_valid_data_1_0_itm_4 <= 1'b0;
      MAC_13_slc_valid_data_1_0_itm_4 <= 1'b0;
      MAC_12_slc_valid_data_1_0_itm_4 <= 1'b0;
      MAC_15_slc_valid_data_1_0_itm_4 <= 1'b0;
      MAC_14_slc_valid_data_1_0_itm_4 <= 1'b0;
      valid_data_sva_4_15_7 <= 9'b000000000;
      MAC_16_slc_valid_data_1_0_itm_4 <= 1'b0;
    end
    else if ( MAC_if_and_11_cse ) begin
      MAC_11_slc_valid_data_1_0_itm_4 <= MAC_11_slc_valid_data_1_0_itm_3;
      MAC_10_slc_valid_data_1_0_itm_4 <= MAC_10_slc_valid_data_1_0_itm_3;
      MAC_13_slc_valid_data_1_0_itm_4 <= MAC_13_slc_valid_data_1_0_itm_3;
      MAC_12_slc_valid_data_1_0_itm_4 <= MAC_12_slc_valid_data_1_0_itm_3;
      MAC_15_slc_valid_data_1_0_itm_4 <= MAC_15_slc_valid_data_1_0_itm_3;
      MAC_14_slc_valid_data_1_0_itm_4 <= MAC_14_slc_valid_data_1_0_itm_3;
      valid_data_sva_4_15_7 <= valid_data_sva_3_15_5[10:2];
      MAC_16_slc_valid_data_1_0_itm_4 <= MAC_16_slc_valid_data_1_0_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_9_slc_valid_data_1_0_itm_3 <= 1'b0;
      MAC_8_slc_valid_data_1_0_itm_3 <= 1'b0;
      MAC_11_slc_valid_data_1_0_itm_3 <= 1'b0;
      MAC_10_slc_valid_data_1_0_itm_3 <= 1'b0;
      MAC_13_slc_valid_data_1_0_itm_3 <= 1'b0;
      MAC_12_slc_valid_data_1_0_itm_3 <= 1'b0;
      MAC_15_slc_valid_data_1_0_itm_3 <= 1'b0;
      MAC_14_slc_valid_data_1_0_itm_3 <= 1'b0;
      acc_lpi_1_dfm_4_1 <= 20'b00000000000000000000;
      valid_data_sva_3_15_5 <= 11'b00000000000;
      MAC_16_slc_valid_data_1_0_itm_3 <= 1'b0;
    end
    else if ( MAC_if_and_13_cse ) begin
      MAC_9_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[5];
      MAC_8_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[4];
      MAC_11_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[7];
      MAC_10_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[6];
      MAC_13_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[9];
      MAC_12_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[8];
      MAC_15_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[11];
      MAC_14_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[10];
      acc_lpi_1_dfm_4_1 <= MUX_v_20_2_2(acc_lpi_1_dfm_3_mx0, (signext_20_18(MAC_5_if_acc_nl)),
          valid_data_sva_2_15_3[1]);
      valid_data_sva_3_15_5 <= valid_data_sva_2_15_3[12:2];
      MAC_16_slc_valid_data_1_0_itm_3 <= valid_data_sva_2_15_3[12];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_7 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_7 & MAC_16_slc_valid_data_1_0_itm_6 & MAC_16_slc_valid_data_1_0_1_itm_2
        ) begin
      MAC_16_if_mul_itm_7 <= MAC_16_if_mul_itm_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_if_mul_itm_6 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_18 & or_dcpl_4 & main_stage_0_6 & MAC_12_slc_valid_data_1_0_1_itm_1
        & MAC_12_slc_valid_data_1_0_itm_5 ) begin
      MAC_12_if_mul_itm_6 <= MAC_12_if_mul_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_if_mul_itm_6 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_18 & main_stage_0_6 & MAC_13_slc_valid_data_1_0_itm_5
        & MAC_13_slc_valid_data_1_0_1_itm_1 ) begin
      MAC_13_if_mul_itm_6 <= MAC_13_if_mul_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_slc_valid_data_1_0_1_itm_2 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_17 & or_dcpl_5 & main_stage_0_6 ) begin
      MAC_13_slc_valid_data_1_0_1_itm_2 <= MAC_13_slc_valid_data_1_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_slc_valid_data_1_0_1_itm_2 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_18 & or_dcpl_4 & main_stage_0_6 ) begin
      MAC_12_slc_valid_data_1_0_1_itm_2 <= MAC_12_slc_valid_data_1_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_6 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_6 & MAC_16_slc_valid_data_1_0_itm_5 & MAC_16_slc_valid_data_1_0_1_itm_1
        ) begin
      MAC_16_if_mul_itm_6 <= MAC_16_if_mul_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_slc_valid_data_1_0_1_itm_2 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_30 ) begin
      MAC_15_slc_valid_data_1_0_1_itm_2 <= MAC_15_slc_valid_data_1_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_if_mul_itm_6 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_30 & MAC_15_slc_valid_data_1_0_itm_5 & MAC_15_slc_valid_data_1_0_1_itm_1
        ) begin
      MAC_15_if_mul_itm_6 <= MAC_15_if_mul_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_slc_valid_data_1_0_1_itm_2 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_30 & or_dcpl_5 ) begin
      MAC_14_slc_valid_data_1_0_1_itm_2 <= MAC_14_slc_valid_data_1_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_if_mul_itm_6 <= 16'b0000000000000000;
    end
    else if ( core_wen & or_dcpl_7 & main_stage_0_6 & MAC_14_slc_valid_data_1_0_itm_5
        & or_dcpl_5 & MAC_14_slc_valid_data_1_0_1_itm_1 ) begin
      MAC_14_if_mul_itm_6 <= MAC_14_if_mul_itm_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      acc_lpi_1_dfm_8_1 <= 20'b00000000000000000000;
    end
    else if ( core_wen & and_dcpl_38 & (MAC_10_slc_valid_data_1_0_itm_4 | (~ (valid_data_sva_4_15_7[2])))
        ) begin
      acc_lpi_1_dfm_8_1 <= MUX_v_20_2_2(acc_lpi_1_dfm_7_mx0, (signext_20_19(MAC_9_if_acc_nl)),
          valid_data_sva_4_15_7[1]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_10_if_mul_itm_5 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_38 & MAC_10_slc_valid_data_1_0_itm_4 & (valid_data_sva_4_15_7[2])
        ) begin
      MAC_10_if_mul_itm_5 <= MAC_10_if_mul_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_11_if_mul_itm_5 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_5 & MAC_11_slc_valid_data_1_0_itm_4 & (valid_data_sva_4_15_7[3])
        ) begin
      MAC_11_if_mul_itm_5 <= MAC_11_if_mul_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_10_slc_valid_data_1_0_1_itm_1 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_38 ) begin
      MAC_10_slc_valid_data_1_0_1_itm_1 <= valid_data_sva_4_15_7[2];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_5 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_5 & MAC_16_slc_valid_data_1_0_itm_4 & (valid_data_sva_4_15_7[8])
        ) begin
      MAC_16_if_mul_itm_5 <= MAC_16_if_mul_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_slc_valid_data_1_0_1_itm_1 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_46 ) begin
      MAC_15_slc_valid_data_1_0_1_itm_1 <= valid_data_sva_4_15_7[7];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_if_mul_itm_5 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_46 & MAC_15_slc_valid_data_1_0_itm_4 & (valid_data_sva_4_15_7[7])
        ) begin
      MAC_15_if_mul_itm_5 <= MAC_15_if_mul_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_slc_valid_data_1_0_1_itm_1 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_46 & or_dcpl_11 ) begin
      MAC_14_slc_valid_data_1_0_1_itm_1 <= valid_data_sva_4_15_7[6];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_if_mul_itm_5 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_5 & MAC_14_slc_valid_data_1_0_itm_4 & or_dcpl_10
        & or_dcpl_11 & (valid_data_sva_4_15_7[6]) ) begin
      MAC_14_if_mul_itm_5 <= MAC_14_if_mul_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_slc_valid_data_1_0_1_itm_1 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_55 & or_dcpl_11 & main_stage_0_5 ) begin
      MAC_13_slc_valid_data_1_0_1_itm_1 <= valid_data_sva_4_15_7[5];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_if_mul_itm_5 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_59 & main_stage_0_5 & MAC_13_slc_valid_data_1_0_itm_4
        & (valid_data_sva_4_15_7[5]) ) begin
      MAC_13_if_mul_itm_5 <= MAC_13_if_mul_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_slc_valid_data_1_0_1_itm_1 <= 1'b0;
    end
    else if ( core_wen & and_dcpl_59 & or_dcpl_13 & main_stage_0_5 ) begin
      MAC_12_slc_valid_data_1_0_1_itm_1 <= valid_data_sva_4_15_7[4];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_if_mul_itm_5 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_59 & or_dcpl_13 & main_stage_0_5 & (valid_data_sva_4_15_7[4])
        & MAC_12_slc_valid_data_1_0_itm_4 ) begin
      MAC_12_if_mul_itm_5 <= MAC_12_if_mul_itm_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_4 & MAC_16_slc_valid_data_1_0_itm_3 & (valid_data_sva_3_15_5[10])
        ) begin
      MAC_16_if_mul_itm_4 <= MAC_16_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & or_dcpl_14 & main_stage_0_4 & (valid_data_sva_3_15_5[9])
        & MAC_15_slc_valid_data_1_0_itm_3 ) begin
      MAC_15_if_mul_itm_4 <= MAC_15_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_4 & MAC_14_slc_valid_data_1_0_itm_3 & or_dcpl_14
        & or_dcpl_15 & (valid_data_sva_3_15_5[8]) ) begin
      MAC_14_if_mul_itm_4 <= MAC_14_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_79 & main_stage_0_4 & MAC_13_slc_valid_data_1_0_itm_3
        & (valid_data_sva_3_15_5[7]) ) begin
      MAC_13_if_mul_itm_4 <= MAC_13_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_79 & (MAC_13_slc_valid_data_1_0_itm_3 | (~ (valid_data_sva_3_15_5[7])))
        & main_stage_0_4 & (valid_data_sva_3_15_5[6]) & MAC_12_slc_valid_data_1_0_itm_3
        ) begin
      MAC_12_if_mul_itm_4 <= MAC_12_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_11_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_4 & MAC_11_slc_valid_data_1_0_itm_3 & (valid_data_sva_3_15_5[5])
        ) begin
      MAC_11_if_mul_itm_4 <= MAC_11_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_10_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_4 & MAC_10_slc_valid_data_1_0_itm_3 & (valid_data_sva_3_15_5[4])
        & or_dcpl_18 ) begin
      MAC_10_if_mul_itm_4 <= MAC_10_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      acc_lpi_1_dfm_6_1 <= 20'b00000000000000000000;
    end
    else if ( core_wen & and_dcpl_92 & (MAC_8_slc_valid_data_1_0_itm_3 | (~ (valid_data_sva_3_15_5[2])))
        & main_stage_0_4 ) begin
      acc_lpi_1_dfm_6_1 <= MUX_v_20_2_2(acc_lpi_1_dfm_5_mx0, (signext_20_18(MAC_7_if_acc_nl)),
          valid_data_sva_3_15_5[1]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_8_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & and_dcpl_92 & main_stage_0_4 & MAC_8_slc_valid_data_1_0_itm_3
        & (valid_data_sva_3_15_5[2]) ) begin
      MAC_8_if_mul_itm_4 <= MAC_8_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_9_if_mul_itm_4 <= 16'b0000000000000000;
    end
    else if ( core_wen & or_dcpl_21 & main_stage_0_4 & MAC_9_slc_valid_data_1_0_itm_3
        & or_dcpl_18 & (valid_data_sva_3_15_5[3]) ) begin
      MAC_9_if_mul_itm_4 <= MAC_9_if_mul_itm_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_6_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[2]) ) begin
      MAC_6_if_mul_itm_3 <= MAC_6_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_7_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[3]) ) begin
      MAC_7_if_mul_itm_3 <= MAC_7_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[12]) ) begin
      MAC_16_if_mul_itm_3 <= MAC_16_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[11]) ) begin
      MAC_15_if_mul_itm_3 <= MAC_15_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[10]) ) begin
      MAC_14_if_mul_itm_3 <= MAC_14_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[9]) ) begin
      MAC_13_if_mul_itm_3 <= MAC_13_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[8]) ) begin
      MAC_12_if_mul_itm_3 <= MAC_12_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_11_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[7]) ) begin
      MAC_11_if_mul_itm_3 <= MAC_11_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_10_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[6]) ) begin
      MAC_10_if_mul_itm_3 <= MAC_10_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_9_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[5]) ) begin
      MAC_9_if_mul_itm_3 <= MAC_9_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_8_if_mul_itm_3 <= 16'b0000000000000000;
    end
    else if ( core_wen & main_stage_0_3 & (valid_data_sva_2_15_3[4]) ) begin
      MAC_8_if_mul_itm_3 <= MAC_8_if_mul_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      acc_lpi_1_dfm_2_1 <= 20'b00000000000000000000;
      valid_data_sva_2_15_3 <= 13'b0000000000000;
    end
    else if ( MAC_if_and_15_cse ) begin
      acc_lpi_1_dfm_2_1 <= MUX_v_20_2_2(acc_lpi_1_dfm_1_mx0, (signext_20_17(MAC_3_if_acc_nl)),
          valid_data_sva_1_15_1[1]);
      valid_data_sva_2_15_3 <= valid_data_sva_1_15_1[14:2];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_4_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[2])
        ) begin
      MAC_4_if_mul_itm_2 <= MAC_4_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_5_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[3])
        ) begin
      MAC_5_if_mul_itm_2 <= MAC_5_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[14])
        ) begin
      MAC_16_if_mul_itm_2 <= MAC_16_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[13])
        ) begin
      MAC_15_if_mul_itm_2 <= MAC_15_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[12])
        ) begin
      MAC_14_if_mul_itm_2 <= MAC_14_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[11])
        ) begin
      MAC_13_if_mul_itm_2 <= MAC_13_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[10])
        ) begin
      MAC_12_if_mul_itm_2 <= MAC_12_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_11_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[9])
        ) begin
      MAC_11_if_mul_itm_2 <= MAC_11_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_10_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[8])
        ) begin
      MAC_10_if_mul_itm_2 <= MAC_10_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_9_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[7])
        ) begin
      MAC_9_if_mul_itm_2 <= MAC_9_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_8_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[6])
        ) begin
      MAC_8_if_mul_itm_2 <= MAC_8_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_7_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[5])
        ) begin
      MAC_7_if_mul_itm_2 <= MAC_7_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_6_if_mul_itm_2 <= 16'b0000000000000000;
    end
    else if ( core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse & (valid_data_sva_1_15_1[4])
        ) begin
      MAC_6_if_mul_itm_2 <= MAC_6_if_mul_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_2_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[1]) ) begin
      MAC_2_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[15:8])) *
          $signed((b_in_rsci_idat_mxwt[15:8])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_3_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[2]) ) begin
      MAC_3_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[23:16]))
          * $signed((b_in_rsci_idat_mxwt[23:16])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_16_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[15]) ) begin
      MAC_16_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[127:120]))
          * $signed((b_in_rsci_idat_mxwt[127:120])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_15_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[14]) ) begin
      MAC_15_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[119:112]))
          * $signed((b_in_rsci_idat_mxwt[119:112])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_14_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[13]) ) begin
      MAC_14_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[111:104]))
          * $signed((b_in_rsci_idat_mxwt[111:104])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_13_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[12]) ) begin
      MAC_13_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[103:96]))
          * $signed((b_in_rsci_idat_mxwt[103:96])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_12_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[11]) ) begin
      MAC_12_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[95:88]))
          * $signed((b_in_rsci_idat_mxwt[95:88])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_11_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[10]) ) begin
      MAC_11_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[87:80]))
          * $signed((b_in_rsci_idat_mxwt[87:80])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_10_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[9]) ) begin
      MAC_10_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[79:72]))
          * $signed((b_in_rsci_idat_mxwt[79:72])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_9_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[8]) ) begin
      MAC_9_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[71:64]))
          * $signed((b_in_rsci_idat_mxwt[71:64])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_8_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[7]) ) begin
      MAC_8_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[63:56]))
          * $signed((b_in_rsci_idat_mxwt[63:56])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_7_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[6]) ) begin
      MAC_7_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[55:48]))
          * $signed((b_in_rsci_idat_mxwt[55:48])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_6_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[5]) ) begin
      MAC_6_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[47:40]))
          * $signed((b_in_rsci_idat_mxwt[47:40])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_5_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[4]) ) begin
      MAC_5_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[39:32]))
          * $signed((b_in_rsci_idat_mxwt[39:32])));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_4_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & (valid_in_data_rsci_idat[3]) ) begin
      MAC_4_if_mul_itm_1 <= conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[31:24]))
          * $signed((b_in_rsci_idat_mxwt[31:24])));
    end
  end
  assign nl_MAC_11_if_acc_nl = (acc_lpi_1_dfm_9_mx0[18:0]) + conv_s2s_16_19(MAC_11_if_mul_itm_5);
  assign MAC_11_if_acc_nl = nl_MAC_11_if_acc_nl[18:0];
  assign MAC_1_if_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[7:0])) * $signed((b_in_rsci_idat_mxwt[7:0])));
  assign nl_MAC_16_if_acc_nl = conv_s2s_19_20(acc_lpi_1_dfm_14_1[18:0]) + conv_s2s_16_20(MAC_16_if_mul_itm_8);
  assign MAC_16_if_acc_nl = nl_MAC_16_if_acc_nl[19:0];
  assign and_184_nl = main_stage_0_9 & (~ MAC_16_slc_valid_data_1_0_1_itm_4);
  assign nl_MAC_15_if_acc_nl = (acc_lpi_1_dfm_13_mx0[18:0]) + conv_s2s_16_19(MAC_15_if_mul_itm_7);
  assign MAC_15_if_acc_nl = nl_MAC_15_if_acc_nl[18:0];
  assign nl_MAC_13_if_acc_nl = (acc_lpi_1_dfm_11_mx0[18:0]) + conv_s2s_16_19(MAC_13_if_mul_itm_6);
  assign MAC_13_if_acc_nl = nl_MAC_13_if_acc_nl[18:0];
  assign nl_MAC_5_if_acc_nl = (acc_lpi_1_dfm_3_mx0[17:0]) + conv_s2s_16_18(MAC_5_if_mul_itm_2);
  assign MAC_5_if_acc_nl = nl_MAC_5_if_acc_nl[17:0];
  assign nl_MAC_9_if_acc_nl = (acc_lpi_1_dfm_7_mx0[18:0]) + conv_s2s_16_19(MAC_9_if_mul_itm_4);
  assign MAC_9_if_acc_nl = nl_MAC_9_if_acc_nl[18:0];
  assign nl_MAC_7_if_acc_nl = (acc_lpi_1_dfm_5_mx0[17:0]) + conv_s2s_16_18(MAC_7_if_mul_itm_3);
  assign MAC_7_if_acc_nl = nl_MAC_7_if_acc_nl[17:0];
  assign nl_MAC_3_if_acc_nl = (acc_lpi_1_dfm_1_mx0[16:0]) + conv_s2s_16_17(MAC_3_if_mul_itm_1);
  assign MAC_3_if_acc_nl = nl_MAC_3_if_acc_nl[16:0];

  function automatic [19:0] MUX_v_20_2_2;
    input [19:0] input_0;
    input [19:0] input_1;
    input [0:0] sel;
    reg [19:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_20_2_2 = result;
  end
  endfunction


  function automatic [19:0] signext_20_16;
    input [15:0] vector;
  begin
    signext_20_16= {{4{vector[15]}}, vector};
  end
  endfunction


  function automatic [19:0] signext_20_17;
    input [16:0] vector;
  begin
    signext_20_17= {{3{vector[16]}}, vector};
  end
  endfunction


  function automatic [19:0] signext_20_18;
    input [17:0] vector;
  begin
    signext_20_18= {{2{vector[17]}}, vector};
  end
  endfunction


  function automatic [19:0] signext_20_19;
    input [18:0] vector;
  begin
    signext_20_19= {{1{vector[18]}}, vector};
  end
  endfunction


  function automatic [16:0] conv_s2s_16_17 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_17 = {vector[15], vector};
  end
  endfunction


  function automatic [17:0] conv_s2s_16_18 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_18 = {{2{vector[15]}}, vector};
  end
  endfunction


  function automatic [18:0] conv_s2s_16_19 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_19 = {{3{vector[15]}}, vector};
  end
  endfunction


  function automatic [19:0] conv_s2s_16_20 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_20 = {{4{vector[15]}}, vector};
  end
  endfunction


  function automatic [17:0] conv_s2s_17_18 ;
    input [16:0]  vector ;
  begin
    conv_s2s_17_18 = {vector[16], vector};
  end
  endfunction


  function automatic [18:0] conv_s2s_18_19 ;
    input [17:0]  vector ;
  begin
    conv_s2s_18_19 = {vector[17], vector};
  end
  endfunction


  function automatic [19:0] conv_s2s_19_20 ;
    input [18:0]  vector ;
  begin
    conv_s2s_19_20 = {vector[18], vector};
  end
  endfunction


  function automatic [15:0] conv_s2u_16_16 ;
    input [15:0]  vector ;
  begin
    conv_s2u_16_16 = vector;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig_struct
// ------------------------------------------------------------------


module test_orig_struct (
  clk, rst, a_in_rsc_dat_data, a_in_rsc_vld, a_in_rsc_rdy, b_in_rsc_dat_data, b_in_rsc_vld,
      b_in_rsc_rdy, valid_in_data_rsc_dat, valid_in_data_rsc_triosy_lz, result_rsc_dat,
      result_rsc_vld, result_rsc_rdy
);
  input clk;
  input rst;
  input [127:0] a_in_rsc_dat_data;
  input a_in_rsc_vld;
  output a_in_rsc_rdy;
  input [127:0] b_in_rsc_dat_data;
  input b_in_rsc_vld;
  output b_in_rsc_rdy;
  input [15:0] valid_in_data_rsc_dat;
  output valid_in_data_rsc_triosy_lz;
  output [19:0] result_rsc_dat;
  output result_rsc_vld;
  input result_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  test_orig_core test_orig_core_inst (
      .clk(clk),
      .rst(rst),
      .a_in_rsc_dat(a_in_rsc_dat_data),
      .a_in_rsc_vld(a_in_rsc_vld),
      .a_in_rsc_rdy(a_in_rsc_rdy),
      .b_in_rsc_dat(b_in_rsc_dat_data),
      .b_in_rsc_vld(b_in_rsc_vld),
      .b_in_rsc_rdy(b_in_rsc_rdy),
      .valid_in_data_rsc_dat(valid_in_data_rsc_dat),
      .valid_in_data_rsc_triosy_lz(valid_in_data_rsc_triosy_lz),
      .result_rsc_dat(result_rsc_dat),
      .result_rsc_vld(result_rsc_vld),
      .result_rsc_rdy(result_rsc_rdy)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_orig
// ------------------------------------------------------------------


module test_orig (
  clk, rst, a_in_rsc_dat, a_in_rsc_vld, a_in_rsc_rdy, b_in_rsc_dat, b_in_rsc_vld,
      b_in_rsc_rdy, valid_in_data_rsc_dat, valid_in_data_rsc_triosy_lz, result_rsc_dat,
      result_rsc_vld, result_rsc_rdy
);
  input clk;
  input rst;
  input [127:0] a_in_rsc_dat;
  input a_in_rsc_vld;
  output a_in_rsc_rdy;
  input [127:0] b_in_rsc_dat;
  input b_in_rsc_vld;
  output b_in_rsc_rdy;
  input [15:0] valid_in_data_rsc_dat;
  output valid_in_data_rsc_triosy_lz;
  output [19:0] result_rsc_dat;
  output result_rsc_vld;
  input result_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  test_orig_struct test_orig_struct_inst (
      .clk(clk),
      .rst(rst),
      .a_in_rsc_dat_data(a_in_rsc_dat),
      .a_in_rsc_vld(a_in_rsc_vld),
      .a_in_rsc_rdy(a_in_rsc_rdy),
      .b_in_rsc_dat_data(b_in_rsc_dat),
      .b_in_rsc_vld(b_in_rsc_vld),
      .b_in_rsc_rdy(b_in_rsc_rdy),
      .valid_in_data_rsc_dat(valid_in_data_rsc_dat),
      .valid_in_data_rsc_triosy_lz(valid_in_data_rsc_triosy_lz),
      .result_rsc_dat(result_rsc_dat),
      .result_rsc_vld(result_rsc_vld),
      .result_rsc_rdy(result_rsc_rdy)
    );
endmodule



