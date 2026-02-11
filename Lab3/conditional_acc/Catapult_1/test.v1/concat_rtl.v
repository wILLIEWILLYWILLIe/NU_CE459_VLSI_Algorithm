
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
//  Generated date: Thu Nov  6 11:26:04 2025
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    test_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module test_core_core_fsm (
  clk, rst, core_wen, fsm_output
);
  input clk;
  input rst;
  input core_wen;
  output [1:0] fsm_output;
  reg [1:0] fsm_output;


  // FSM State Type Declaration for test_core_core_fsm_1
  parameter
    core_rlp_C_0 = 1'd0,
    main_C_0 = 1'd1;

  reg [0:0] state_var;
  reg [0:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : test_core_core_fsm_1
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
//  Design Unit:    test_core_staller
// ------------------------------------------------------------------


module test_core_staller (
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
//  Design Unit:    test_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module test_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
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
//  Design Unit:    test_core_result_rsci_result_wait_dp
// ------------------------------------------------------------------


module test_core_result_rsci_result_wait_dp (
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
//  Design Unit:    test_core_result_rsci_result_wait_ctrl
// ------------------------------------------------------------------


module test_core_result_rsci_result_wait_ctrl (
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
//  Design Unit:    test_core_b_in_rsci_b_in_wait_dp
// ------------------------------------------------------------------


module test_core_b_in_rsci_b_in_wait_dp (
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
//  Design Unit:    test_core_b_in_rsci_b_in_wait_ctrl
// ------------------------------------------------------------------


module test_core_b_in_rsci_b_in_wait_ctrl (
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
//  Design Unit:    test_core_a_in_rsci_a_in_wait_dp
// ------------------------------------------------------------------


module test_core_a_in_rsci_a_in_wait_dp (
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
//  Design Unit:    test_core_a_in_rsci_a_in_wait_ctrl
// ------------------------------------------------------------------


module test_core_a_in_rsci_a_in_wait_ctrl (
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
//  Design Unit:    test_core_valid_in_data_rsc_triosy_obj
// ------------------------------------------------------------------


module test_core_valid_in_data_rsc_triosy_obj (
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
  test_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl test_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .valid_in_data_rsc_triosy_obj_iswt0(valid_in_data_rsc_triosy_obj_iswt0),
      .valid_in_data_rsc_triosy_obj_ld_core_sct(valid_in_data_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    test_core_result_rsci
// ------------------------------------------------------------------


module test_core_result_rsci (
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
  test_core_result_rsci_result_wait_ctrl test_core_result_rsci_result_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .result_rsci_oswt(result_rsci_oswt),
      .result_rsci_irdy(result_rsci_irdy),
      .result_rsci_biwt(result_rsci_biwt),
      .result_rsci_bdwt(result_rsci_bdwt),
      .result_rsci_bcwt(result_rsci_bcwt),
      .result_rsci_ivld_core_sct(result_rsci_ivld_core_sct)
    );
  test_core_result_rsci_result_wait_dp test_core_result_rsci_result_wait_dp_inst
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
//  Design Unit:    test_core_b_in_rsci
// ------------------------------------------------------------------


module test_core_b_in_rsci (
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
  test_core_b_in_rsci_b_in_wait_ctrl test_core_b_in_rsci_b_in_wait_ctrl_inst (
      .core_wen(core_wen),
      .b_in_rsci_oswt(b_in_rsci_oswt),
      .b_in_rsci_biwt(b_in_rsci_biwt),
      .b_in_rsci_bdwt(b_in_rsci_bdwt),
      .b_in_rsci_bcwt(b_in_rsci_bcwt),
      .b_in_rsci_irdy_core_sct(b_in_rsci_irdy_core_sct),
      .b_in_rsci_ivld(b_in_rsci_ivld)
    );
  test_core_b_in_rsci_b_in_wait_dp test_core_b_in_rsci_b_in_wait_dp_inst (
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
//  Design Unit:    test_core_a_in_rsci
// ------------------------------------------------------------------


module test_core_a_in_rsci (
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
  test_core_a_in_rsci_a_in_wait_ctrl test_core_a_in_rsci_a_in_wait_ctrl_inst (
      .core_wen(core_wen),
      .a_in_rsci_oswt(a_in_rsci_oswt),
      .a_in_rsci_biwt(a_in_rsci_biwt),
      .a_in_rsci_bdwt(a_in_rsci_bdwt),
      .a_in_rsci_bcwt(a_in_rsci_bcwt),
      .a_in_rsci_irdy_core_sct(a_in_rsci_irdy_core_sct),
      .a_in_rsci_ivld(a_in_rsci_ivld)
    );
  test_core_a_in_rsci_a_in_wait_dp test_core_a_in_rsci_a_in_wait_dp_inst (
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
//  Design Unit:    test_core
// ------------------------------------------------------------------


module test_core (
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
  wire [21:0] nl_result_rsci_idat;
  wire [1:0] fsm_output;
  reg main_stage_0_3;
  reg reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse;
  reg reg_result_rsci_ivld_core_psct_cse;
  reg reg_b_in_rsci_irdy_core_psct_cse;
  reg [15:0] MAC_MAC_and_14_itm_1;
  reg [15:0] MAC_MAC_and_15_itm_1;
  reg [15:0] MAC_MAC_and_12_itm_1;
  reg [15:0] MAC_MAC_and_13_itm_1;
  reg [17:0] MAC_acc_20_itm_1;
  wire [19:0] nl_MAC_acc_20_itm_1;
  reg [15:0] MAC_MAC_and_10_itm_1;
  reg [15:0] MAC_MAC_and_11_itm_1;
  reg [15:0] MAC_MAC_and_8_itm_1;
  reg [15:0] MAC_MAC_and_9_itm_1;
  reg [17:0] MAC_acc_19_itm_1;
  wire [19:0] nl_MAC_acc_19_itm_1;
  reg [15:0] MAC_MAC_and_6_itm_1;
  reg [15:0] MAC_MAC_and_7_itm_1;
  reg [15:0] MAC_MAC_and_4_itm_1;
  reg [15:0] MAC_MAC_and_5_itm_1;
  reg [17:0] MAC_acc_18_itm_1;
  wire [19:0] nl_MAC_acc_18_itm_1;
  reg [15:0] MAC_MAC_and_2_itm_1;
  reg [15:0] MAC_MAC_and_3_itm_1;
  reg [15:0] MAC_MAC_and_itm_1;
  reg [15:0] MAC_MAC_and_1_itm_1;
  reg [17:0] MAC_acc_21_itm_1;
  wire [19:0] nl_MAC_acc_21_itm_1;
  wire MAC_and_cse;

  wire[15:0] MAC_3_qif_mul_nl;
  wire[15:0] MAC_4_qif_mul_nl;
  wire[15:0] MAC_1_qif_mul_nl;
  wire[15:0] MAC_2_qif_mul_nl;
  wire[15:0] MAC_7_qif_mul_nl;
  wire[15:0] MAC_8_qif_mul_nl;
  wire[15:0] MAC_5_qif_mul_nl;
  wire[15:0] MAC_6_qif_mul_nl;
  wire[15:0] MAC_11_qif_mul_nl;
  wire[15:0] MAC_12_qif_mul_nl;
  wire[15:0] MAC_9_qif_mul_nl;
  wire[15:0] MAC_10_qif_mul_nl;
  wire[15:0] MAC_15_qif_mul_nl;
  wire[15:0] MAC_16_qif_mul_nl;
  wire[15:0] MAC_13_qif_mul_nl;
  wire[15:0] MAC_14_qif_mul_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd16)) valid_in_data_rsci (
      .dat(valid_in_data_rsc_dat),
      .idat(valid_in_data_rsci_idat)
    );
  test_core_a_in_rsci test_core_a_in_rsci_inst (
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
  test_core_b_in_rsci test_core_b_in_rsci_inst (
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
  test_core_result_rsci test_core_result_rsci_inst (
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
  test_core_valid_in_data_rsc_triosy_obj test_core_valid_in_data_rsc_triosy_obj_inst
      (
      .valid_in_data_rsc_triosy_lz(valid_in_data_rsc_triosy_lz),
      .core_wten(core_wten),
      .valid_in_data_rsc_triosy_obj_iswt0(reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse)
    );
  test_core_staller test_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .core_wten(core_wten),
      .a_in_rsci_wen_comp(a_in_rsci_wen_comp),
      .b_in_rsci_wen_comp(b_in_rsci_wen_comp),
      .result_rsci_wen_comp(result_rsci_wen_comp)
    );
  test_core_core_fsm test_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output)
    );
  assign MAC_and_cse = core_wen & reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse;
  always @(posedge clk) begin
    if ( rst ) begin
      reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= 1'b0;
      reg_result_rsci_ivld_core_psct_cse <= 1'b0;
      reg_b_in_rsci_irdy_core_psct_cse <= 1'b0;
      main_stage_0_3 <= 1'b0;
      MAC_MAC_and_2_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_3_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_1_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_6_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_7_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_4_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_5_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_10_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_11_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_8_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_9_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_14_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_15_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_12_itm_1 <= 16'b0000000000000000;
      MAC_MAC_and_13_itm_1 <= 16'b0000000000000000;
    end
    else if ( core_wen ) begin
      reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= fsm_output[1];
      reg_result_rsci_ivld_core_psct_cse <= main_stage_0_3;
      reg_b_in_rsci_irdy_core_psct_cse <= 1'b1;
      main_stage_0_3 <= reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse;
      MAC_MAC_and_2_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_3_qif_mul_nl),
          (valid_in_data_rsci_idat[2]));
      MAC_MAC_and_3_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_4_qif_mul_nl),
          (valid_in_data_rsci_idat[3]));
      MAC_MAC_and_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_1_qif_mul_nl),
          (valid_in_data_rsci_idat[0]));
      MAC_MAC_and_1_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_2_qif_mul_nl),
          (valid_in_data_rsci_idat[1]));
      MAC_MAC_and_6_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_7_qif_mul_nl),
          (valid_in_data_rsci_idat[6]));
      MAC_MAC_and_7_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_8_qif_mul_nl),
          (valid_in_data_rsci_idat[7]));
      MAC_MAC_and_4_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_5_qif_mul_nl),
          (valid_in_data_rsci_idat[4]));
      MAC_MAC_and_5_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_6_qif_mul_nl),
          (valid_in_data_rsci_idat[5]));
      MAC_MAC_and_10_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_11_qif_mul_nl),
          (valid_in_data_rsci_idat[10]));
      MAC_MAC_and_11_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_12_qif_mul_nl),
          (valid_in_data_rsci_idat[11]));
      MAC_MAC_and_8_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_9_qif_mul_nl),
          (valid_in_data_rsci_idat[8]));
      MAC_MAC_and_9_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_10_qif_mul_nl),
          (valid_in_data_rsci_idat[9]));
      MAC_MAC_and_14_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_15_qif_mul_nl),
          (valid_in_data_rsci_idat[14]));
      MAC_MAC_and_15_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_16_qif_mul_nl),
          (valid_in_data_rsci_idat[15]));
      MAC_MAC_and_12_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_13_qif_mul_nl),
          (valid_in_data_rsci_idat[12]));
      MAC_MAC_and_13_itm_1 <= MUX_v_16_2_2(16'b0000000000000000, (MAC_14_qif_mul_nl),
          (valid_in_data_rsci_idat[13]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      result_rsci_idat <= 20'b00000000000000000000;
    end
    else if ( core_wen & main_stage_0_3 ) begin
      result_rsci_idat <= nl_result_rsci_idat[19:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      MAC_acc_20_itm_1 <= 18'b000000000000000000;
      MAC_acc_19_itm_1 <= 18'b000000000000000000;
      MAC_acc_18_itm_1 <= 18'b000000000000000000;
      MAC_acc_21_itm_1 <= 18'b000000000000000000;
    end
    else if ( MAC_and_cse ) begin
      MAC_acc_20_itm_1 <= nl_MAC_acc_20_itm_1[17:0];
      MAC_acc_19_itm_1 <= nl_MAC_acc_19_itm_1[17:0];
      MAC_acc_18_itm_1 <= nl_MAC_acc_18_itm_1[17:0];
      MAC_acc_21_itm_1 <= nl_MAC_acc_21_itm_1[17:0];
    end
  end
  assign MAC_3_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[23:16]))
      * $signed((b_in_rsci_idat_mxwt[23:16])));
  assign MAC_4_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[31:24]))
      * $signed((b_in_rsci_idat_mxwt[31:24])));
  assign MAC_1_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[7:0])) *
      $signed((b_in_rsci_idat_mxwt[7:0])));
  assign MAC_2_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[15:8])) *
      $signed((b_in_rsci_idat_mxwt[15:8])));
  assign MAC_7_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[55:48]))
      * $signed((b_in_rsci_idat_mxwt[55:48])));
  assign MAC_8_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[63:56]))
      * $signed((b_in_rsci_idat_mxwt[63:56])));
  assign MAC_5_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[39:32]))
      * $signed((b_in_rsci_idat_mxwt[39:32])));
  assign MAC_6_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[47:40]))
      * $signed((b_in_rsci_idat_mxwt[47:40])));
  assign MAC_11_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[87:80]))
      * $signed((b_in_rsci_idat_mxwt[87:80])));
  assign MAC_12_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[95:88]))
      * $signed((b_in_rsci_idat_mxwt[95:88])));
  assign MAC_9_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[71:64]))
      * $signed((b_in_rsci_idat_mxwt[71:64])));
  assign MAC_10_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[79:72]))
      * $signed((b_in_rsci_idat_mxwt[79:72])));
  assign MAC_15_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[119:112]))
      * $signed((b_in_rsci_idat_mxwt[119:112])));
  assign MAC_16_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[127:120]))
      * $signed((b_in_rsci_idat_mxwt[127:120])));
  assign MAC_13_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[103:96]))
      * $signed((b_in_rsci_idat_mxwt[103:96])));
  assign MAC_14_qif_mul_nl = conv_s2u_16_16($signed((a_in_rsci_idat_mxwt[111:104]))
      * $signed((b_in_rsci_idat_mxwt[111:104])));
  assign nl_result_rsci_idat  = conv_s2s_18_20(MAC_acc_20_itm_1) + conv_s2s_18_20(MAC_acc_19_itm_1)
      + conv_s2s_18_20(MAC_acc_18_itm_1) + conv_s2s_18_20(MAC_acc_21_itm_1);
  assign nl_MAC_acc_20_itm_1  = conv_s2s_16_18(MAC_MAC_and_14_itm_1) + conv_s2s_16_18(MAC_MAC_and_15_itm_1)
      + conv_s2s_16_18(MAC_MAC_and_12_itm_1) + conv_s2s_16_18(MAC_MAC_and_13_itm_1);
  assign nl_MAC_acc_19_itm_1  = conv_s2s_16_18(MAC_MAC_and_10_itm_1) + conv_s2s_16_18(MAC_MAC_and_11_itm_1)
      + conv_s2s_16_18(MAC_MAC_and_8_itm_1) + conv_s2s_16_18(MAC_MAC_and_9_itm_1);
  assign nl_MAC_acc_18_itm_1  = conv_s2s_16_18(MAC_MAC_and_6_itm_1) + conv_s2s_16_18(MAC_MAC_and_7_itm_1)
      + conv_s2s_16_18(MAC_MAC_and_4_itm_1) + conv_s2s_16_18(MAC_MAC_and_5_itm_1);
  assign nl_MAC_acc_21_itm_1  = conv_s2s_16_18(MAC_MAC_and_2_itm_1) + conv_s2s_16_18(MAC_MAC_and_3_itm_1)
      + conv_s2s_16_18(MAC_MAC_and_itm_1) + conv_s2s_16_18(MAC_MAC_and_1_itm_1);

  function automatic [15:0] MUX_v_16_2_2;
    input [15:0] input_0;
    input [15:0] input_1;
    input [0:0] sel;
    reg [15:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_16_2_2 = result;
  end
  endfunction


  function automatic [17:0] conv_s2s_16_18 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_18 = {{2{vector[15]}}, vector};
  end
  endfunction


  function automatic [19:0] conv_s2s_18_20 ;
    input [17:0]  vector ;
  begin
    conv_s2s_18_20 = {{2{vector[17]}}, vector};
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
//  Design Unit:    test_struct
// ------------------------------------------------------------------


module test_struct (
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
  test_core test_core_inst (
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
//  Design Unit:    test
// ------------------------------------------------------------------


module test (
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
  test_struct test_struct_inst (
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



