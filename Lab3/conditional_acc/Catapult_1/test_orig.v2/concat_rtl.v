
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
//  Generated date: Thu Nov  6 11:09:54 2025
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    test_orig_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module test_orig_core_core_fsm (
  clk, rst, core_wen, fsm_output, MAC_C_0_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input MAC_C_0_tr0;


  // FSM State Type Declaration for test_orig_core_core_fsm_1
  parameter
    core_rlp_C_0 = 2'd0,
    main_C_0 = 2'd1,
    MAC_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : test_orig_core_core_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 4'b0010;
        state_var_NS = MAC_C_0;
      end
      MAC_C_0 : begin
        fsm_output = 4'b0100;
        if ( MAC_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = MAC_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = main_C_0;
      end
      // core_rlp_C_0
      default : begin
        fsm_output = 4'b0001;
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
  wire [3:0] fsm_output;
  wire [4:0] MAC_acc_1_tmp;
  wire [5:0] nl_MAC_acc_1_tmp;
  wire MAC_if_mux_tmp;
  wire and_dcpl_2;
  reg MAC_stage_0;
  reg MAC_slc_valid_data_1_0_svs_1;
  reg MAC_i_asn_5_itm_1;
  reg MAC_stage_0_2;
  reg reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse;
  reg reg_b_in_rsci_irdy_core_psct_cse;
  reg [19:0] acc_sva;
  reg [127:0] a_data_sva;
  reg [127:0] b_data_sva;
  reg [15:0] valid_data_sva;
  reg [15:0] MAC_if_mul_itm_1;
  reg [3:0] MAC_i_4_0_sva_3_0;
  wire result_rsci_idat_mx0c1;
  wire [19:0] acc_sva_2;
  wire [20:0] nl_acc_sva_2;
  wire MAC_i_and_cse;
  wire valid_data_and_cse;

  wire[7:0] MAC_if_mux_1_nl;
  wire[7:0] MAC_if_mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_test_orig_core_core_fsm_inst_MAC_C_0_tr0;
  assign nl_test_orig_core_core_fsm_inst_MAC_C_0_tr0 = ~ MAC_stage_0;
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
      .result_rsci_oswt(reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse),
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
      .fsm_output(fsm_output),
      .MAC_C_0_tr0(nl_test_orig_core_core_fsm_inst_MAC_C_0_tr0[0:0])
    );
  assign MAC_i_and_cse = core_wen & MAC_stage_0;
  assign valid_data_and_cse = core_wen & (~ (fsm_output[2]));
  assign MAC_if_mux_tmp = MUX_s_1_16_2((valid_data_sva[0]), (valid_data_sva[1]),
      (valid_data_sva[2]), (valid_data_sva[3]), (valid_data_sva[4]), (valid_data_sva[5]),
      (valid_data_sva[6]), (valid_data_sva[7]), (valid_data_sva[8]), (valid_data_sva[9]),
      (valid_data_sva[10]), (valid_data_sva[11]), (valid_data_sva[12]), (valid_data_sva[13]),
      (valid_data_sva[14]), (valid_data_sva[15]), MAC_i_4_0_sva_3_0);
  assign nl_acc_sva_2 = acc_sva + conv_s2s_16_20(MAC_if_mul_itm_1);
  assign acc_sva_2 = nl_acc_sva_2[19:0];
  assign nl_MAC_acc_1_tmp = conv_u2s_4_5(MAC_i_4_0_sva_3_0) + 5'b00001;
  assign MAC_acc_1_tmp = nl_MAC_acc_1_tmp[4:0];
  assign and_dcpl_2 = (~ MAC_stage_0) & MAC_stage_0_2;
  assign result_rsci_idat_mx0c1 = and_dcpl_2 & (~ MAC_slc_valid_data_1_0_svs_1) &
      (fsm_output[2]);
  always @(posedge clk) begin
    if ( rst ) begin
      reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= 1'b0;
      reg_b_in_rsci_irdy_core_psct_cse <= 1'b0;
      MAC_stage_0 <= 1'b0;
      MAC_i_4_0_sva_3_0 <= 4'b0000;
      MAC_stage_0_2 <= 1'b0;
    end
    else if ( core_wen ) begin
      reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= (~ MAC_stage_0) & (fsm_output[2]);
      reg_b_in_rsci_irdy_core_psct_cse <= ~((fsm_output[2:1]!=2'b00));
      MAC_stage_0 <= ~((~(MAC_stage_0 & (~ (MAC_acc_1_tmp[4])))) & (fsm_output[2]));
      MAC_i_4_0_sva_3_0 <= MUX_v_4_2_2(4'b0000, (MAC_acc_1_tmp[3:0]), (fsm_output[2]));
      MAC_stage_0_2 <= fsm_output[2];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      result_rsci_idat <= 20'b00000000000000000000;
    end
    else if ( core_wen & ((and_dcpl_2 & MAC_slc_valid_data_1_0_svs_1 & (fsm_output[2]))
        | result_rsci_idat_mx0c1 | ((~ MAC_stage_0) & (~ MAC_stage_0_2) & (fsm_output[2])))
        ) begin
      result_rsci_idat <= MUX_v_20_2_2(acc_sva_2, acc_sva, result_rsci_idat_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      acc_sva <= 20'b00000000000000000000;
    end
    else if ( (~((~((~ MAC_i_asn_5_itm_1) & MAC_slc_valid_data_1_0_svs_1 & MAC_stage_0_2))
        & (fsm_output[2]))) & core_wen ) begin
      acc_sva <= MUX_v_20_2_2(20'b00000000000000000000, acc_sva_2, (fsm_output[2]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_if_mul_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen & MAC_stage_0 & MAC_if_mux_tmp ) begin
      MAC_if_mul_itm_1 <= conv_s2u_16_16($signed((MAC_if_mux_1_nl)) * $signed((MAC_if_mux_2_nl)));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_i_asn_5_itm_1 <= 1'b0;
      MAC_slc_valid_data_1_0_svs_1 <= 1'b0;
    end
    else if ( MAC_i_and_cse ) begin
      MAC_i_asn_5_itm_1 <= MAC_acc_1_tmp[4];
      MAC_slc_valid_data_1_0_svs_1 <= MAC_if_mux_tmp;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      valid_data_sva <= 16'b0000000000000000;
      a_data_sva <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      b_data_sva <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( valid_data_and_cse ) begin
      valid_data_sva <= valid_in_data_rsci_idat;
      a_data_sva <= a_in_rsci_idat_mxwt;
      b_data_sva <= b_in_rsci_idat_mxwt;
    end
  end
  assign MAC_if_mux_1_nl = MUX_v_8_16_2((a_data_sva[7:0]), (a_data_sva[15:8]), (a_data_sva[23:16]),
      (a_data_sva[31:24]), (a_data_sva[39:32]), (a_data_sva[47:40]), (a_data_sva[55:48]),
      (a_data_sva[63:56]), (a_data_sva[71:64]), (a_data_sva[79:72]), (a_data_sva[87:80]),
      (a_data_sva[95:88]), (a_data_sva[103:96]), (a_data_sva[111:104]), (a_data_sva[119:112]),
      (a_data_sva[127:120]), MAC_i_4_0_sva_3_0);
  assign MAC_if_mux_2_nl = MUX_v_8_16_2((b_data_sva[7:0]), (b_data_sva[15:8]), (b_data_sva[23:16]),
      (b_data_sva[31:24]), (b_data_sva[39:32]), (b_data_sva[47:40]), (b_data_sva[55:48]),
      (b_data_sva[63:56]), (b_data_sva[71:64]), (b_data_sva[79:72]), (b_data_sva[87:80]),
      (b_data_sva[95:88]), (b_data_sva[103:96]), (b_data_sva[111:104]), (b_data_sva[119:112]),
      (b_data_sva[127:120]), MAC_i_4_0_sva_3_0);

  function automatic [0:0] MUX_s_1_16_2;
    input [0:0] input_0;
    input [0:0] input_1;
    input [0:0] input_2;
    input [0:0] input_3;
    input [0:0] input_4;
    input [0:0] input_5;
    input [0:0] input_6;
    input [0:0] input_7;
    input [0:0] input_8;
    input [0:0] input_9;
    input [0:0] input_10;
    input [0:0] input_11;
    input [0:0] input_12;
    input [0:0] input_13;
    input [0:0] input_14;
    input [0:0] input_15;
    input [3:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = input_0;
      end
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0011 : begin
        result = input_3;
      end
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b0111 : begin
        result = input_7;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      4'b1011 : begin
        result = input_11;
      end
      4'b1100 : begin
        result = input_12;
      end
      4'b1101 : begin
        result = input_13;
      end
      4'b1110 : begin
        result = input_14;
      end
      default : begin
        result = input_15;
      end
    endcase
    MUX_s_1_16_2 = result;
  end
  endfunction


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


  function automatic [3:0] MUX_v_4_2_2;
    input [3:0] input_0;
    input [3:0] input_1;
    input [0:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_4_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_16_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [7:0] input_7;
    input [7:0] input_8;
    input [7:0] input_9;
    input [7:0] input_10;
    input [7:0] input_11;
    input [7:0] input_12;
    input [7:0] input_13;
    input [7:0] input_14;
    input [7:0] input_15;
    input [3:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = input_0;
      end
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0011 : begin
        result = input_3;
      end
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b0111 : begin
        result = input_7;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      4'b1011 : begin
        result = input_11;
      end
      4'b1100 : begin
        result = input_12;
      end
      4'b1101 : begin
        result = input_13;
      end
      4'b1110 : begin
        result = input_14;
      end
      default : begin
        result = input_15;
      end
    endcase
    MUX_v_8_16_2 = result;
  end
  endfunction


  function automatic [19:0] conv_s2s_16_20 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_20 = {{4{vector[15]}}, vector};
  end
  endfunction


  function automatic [15:0] conv_s2u_16_16 ;
    input [15:0]  vector ;
  begin
    conv_s2u_16_16 = vector;
  end
  endfunction


  function automatic [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 =  {1'b0, vector};
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



