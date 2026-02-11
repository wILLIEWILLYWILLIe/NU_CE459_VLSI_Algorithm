
--------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_wait_pkg_v1 IS

COMPONENT ccs_in_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy    : OUT std_logic;
    ivld   : OUT std_logic;
    dat    : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy   : IN  std_logic;
    vld    : IN  std_logic
   );
END COMPONENT;

END ccs_in_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy   : OUT std_logic;
    ivld  : OUT std_logic;
    dat   : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy  : IN  std_logic;
    vld   : IN  std_logic
  );
END ccs_in_wait_v1;

ARCHITECTURE beh OF ccs_in_wait_v1 IS
BEGIN

  idat <= dat;
  rdy  <= irdy;
  ivld <= vld;

END beh;


--------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_out_wait_pkg_v1 IS

COMPONENT ccs_out_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy   : OUT std_logic;
    vld    : OUT std_logic;
    idat   : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy    : IN  std_logic;
    ivld   : IN  std_logic
  );
END COMPONENT;

END ccs_out_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_out_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy  : OUT std_logic;
    vld   : OUT std_logic;
    idat  : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy   : IN  std_logic;
    ivld  : IN  std_logic
  );
END ccs_out_wait_v1;

ARCHITECTURE beh OF ccs_out_wait_v1 IS
BEGIN

  dat  <= idat;
  irdy <= rdy;
  vld  <= ivld;

END beh;


--------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE mgc_io_sync_pkg_v2 IS

COMPONENT mgc_io_sync_v2
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

END mgc_io_sync_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v2 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v2;

ARCHITECTURE beh OF mgc_io_sync_v2 IS
BEGIN

  lz <= ld;

END beh;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.4a/835166 Production Release
--  HLS Date:       Thu Sep  5 21:35:46 PDT 2019
-- 
--  Generated by:   gel8580@finagle.wot.ece.northwestern.edu
--  Generated date: Thu Nov  6 19:37:56 2025
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_9_7_5_32_32_7_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_9_7_5_32_32_7_5_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_9_7_5_32_32_7_5_gen;

ARCHITECTURE v7 OF test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_9_7_5_32_32_7_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  we <= (port_0_rw_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  adr <= (adr_d);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_8_7_5_32_32_7_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_8_7_5_32_32_7_5_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_8_7_5_32_32_7_5_gen;

ARCHITECTURE v7 OF test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_8_7_5_32_32_7_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  we <= (port_0_rw_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  adr <= (adr_d);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_7_7_5_32_32_7_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_7_7_5_32_32_7_5_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_7_7_5_32_32_7_5_gen;

ARCHITECTURE v7 OF test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_7_7_5_32_32_7_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  we <= (port_0_rw_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  adr <= (adr_d);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_6_7_5_32_32_7_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_6_7_5_32_32_7_5_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_6_7_5_32_32_7_5_gen;

ARCHITECTURE v7 OF test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_6_7_5_32_32_7_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  we <= (port_0_rw_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  adr <= (adr_d);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END test_core_core_fsm;

ARCHITECTURE v7 OF test_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for test_core_core_fsm_1
  TYPE test_core_core_fsm_1_ST IS (core_rlp_C_0, main_C_0);

  SIGNAL state_var : test_core_core_fsm_1_ST;
  SIGNAL state_var_NS : test_core_core_fsm_1_ST;

BEGIN
  test_core_core_fsm_1 : PROCESS (state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10");
        state_var_NS <= main_C_0;
      -- core_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "01");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS test_core_core_fsm_1;

  test_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= core_rlp_C_0;
      ELSE
        IF ( core_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS test_core_core_fsm_1_REG;

END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : OUT STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    data_in_rsci_wen_comp : IN STD_LOGIC;
    coeff_addr_rsci_wen_comp : IN STD_LOGIC;
    result_rsci_wen_comp : IN STD_LOGIC
  );
END test_core_staller;

ARCHITECTURE v7 OF test_core_staller IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL core_wten_reg : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  core_wen <= core_wen_drv;

  core_wen_drv <= data_in_rsci_wen_comp AND coeff_addr_rsci_wen_comp AND result_rsci_wen_comp;
  core_wten <= core_wten_reg;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        core_wten_reg <= '0';
      ELSE
        core_wten_reg <= NOT core_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_0_obj_coeffs_rsc_triosy_0_0_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_0_obj_coeffs_rsc_triosy_0_0_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_0_obj_iswt0 : IN STD_LOGIC;
    coeffs_rsc_triosy_0_0_obj_ld_core_sct : OUT STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_0_obj_coeffs_rsc_triosy_0_0_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_0_obj_coeffs_rsc_triosy_0_0_wait_ctrl
    IS
  -- Default Constants

BEGIN
  coeffs_rsc_triosy_0_0_obj_ld_core_sct <= coeffs_rsc_triosy_0_0_obj_iswt0 AND (NOT
      core_wten);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_1_obj_coeffs_rsc_triosy_0_1_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_1_obj_coeffs_rsc_triosy_0_1_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_1_obj_iswt0 : IN STD_LOGIC;
    coeffs_rsc_triosy_0_1_obj_ld_core_sct : OUT STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_1_obj_coeffs_rsc_triosy_0_1_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_1_obj_coeffs_rsc_triosy_0_1_wait_ctrl
    IS
  -- Default Constants

BEGIN
  coeffs_rsc_triosy_0_1_obj_ld_core_sct <= coeffs_rsc_triosy_0_1_obj_iswt0 AND (NOT
      core_wten);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_2_obj_coeffs_rsc_triosy_0_2_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_2_obj_coeffs_rsc_triosy_0_2_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_2_obj_iswt0 : IN STD_LOGIC;
    coeffs_rsc_triosy_0_2_obj_ld_core_sct : OUT STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_2_obj_coeffs_rsc_triosy_0_2_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_2_obj_coeffs_rsc_triosy_0_2_wait_ctrl
    IS
  -- Default Constants

BEGIN
  coeffs_rsc_triosy_0_2_obj_ld_core_sct <= coeffs_rsc_triosy_0_2_obj_iswt0 AND (NOT
      core_wten);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_3_obj_coeffs_rsc_triosy_0_3_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_3_obj_coeffs_rsc_triosy_0_3_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_3_obj_iswt0 : IN STD_LOGIC;
    coeffs_rsc_triosy_0_3_obj_ld_core_sct : OUT STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_3_obj_coeffs_rsc_triosy_0_3_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_3_obj_coeffs_rsc_triosy_0_3_wait_ctrl
    IS
  -- Default Constants

BEGIN
  coeffs_rsc_triosy_0_3_obj_ld_core_sct <= coeffs_rsc_triosy_0_3_obj_iswt0 AND (NOT
      core_wten);
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_3_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_3_i_biwt : IN STD_LOGIC;
    coeffs_rsc_0_3_i_bdwt : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL coeffs_rsc_0_3_i_q_d_mxwt_drv : STD_LOGIC_VECTOR (6 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_3_i_bcwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_3_i_q_d_bfwt : STD_LOGIC_VECTOR (6 DOWNTO 0);

  FUNCTION MUX_v_7_2_2(input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  coeffs_rsc_0_3_i_q_d_mxwt <= coeffs_rsc_0_3_i_q_d_mxwt_drv;

  coeffs_rsc_0_3_i_q_d_mxwt_drv <= MUX_v_7_2_2(coeffs_rsc_0_3_i_q_d, coeffs_rsc_0_3_i_q_d_bfwt,
      coeffs_rsc_0_3_i_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_3_i_bcwt <= '0';
      ELSE
        coeffs_rsc_0_3_i_bcwt <= NOT((NOT(coeffs_rsc_0_3_i_bcwt OR coeffs_rsc_0_3_i_biwt))
            OR coeffs_rsc_0_3_i_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_3_i_q_d_bfwt <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( coeffs_rsc_0_3_i_bcwt = '0' ) THEN
        coeffs_rsc_0_3_i_q_d_bfwt <= coeffs_rsc_0_3_i_q_d_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_3_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_3_i_biwt : OUT STD_LOGIC;
    coeffs_rsc_0_3_i_bdwt : OUT STD_LOGIC;
    coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
    coeffs_rsc_0_3_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_rsc_0_3_i_bdwt <= coeffs_rsc_0_3_i_oswt AND core_wen;
  coeffs_rsc_0_3_i_biwt <= (NOT core_wten) AND coeffs_rsc_0_3_i_oswt;
  coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct <= coeffs_rsc_0_3_i_oswt_pff
      AND core_wen;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_2_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_2_i_biwt : IN STD_LOGIC;
    coeffs_rsc_0_2_i_bdwt : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL coeffs_rsc_0_2_i_q_d_mxwt_drv : STD_LOGIC_VECTOR (6 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_2_i_bcwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_2_i_q_d_bfwt : STD_LOGIC_VECTOR (6 DOWNTO 0);

  FUNCTION MUX_v_7_2_2(input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  coeffs_rsc_0_2_i_q_d_mxwt <= coeffs_rsc_0_2_i_q_d_mxwt_drv;

  coeffs_rsc_0_2_i_q_d_mxwt_drv <= MUX_v_7_2_2(coeffs_rsc_0_2_i_q_d, coeffs_rsc_0_2_i_q_d_bfwt,
      coeffs_rsc_0_2_i_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_2_i_bcwt <= '0';
      ELSE
        coeffs_rsc_0_2_i_bcwt <= NOT((NOT(coeffs_rsc_0_2_i_bcwt OR coeffs_rsc_0_2_i_biwt))
            OR coeffs_rsc_0_2_i_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_2_i_q_d_bfwt <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( coeffs_rsc_0_2_i_bcwt = '0' ) THEN
        coeffs_rsc_0_2_i_q_d_bfwt <= coeffs_rsc_0_2_i_q_d_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_2_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_2_i_biwt : OUT STD_LOGIC;
    coeffs_rsc_0_2_i_bdwt : OUT STD_LOGIC;
    coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
    coeffs_rsc_0_2_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_rsc_0_2_i_bdwt <= coeffs_rsc_0_2_i_oswt AND core_wen;
  coeffs_rsc_0_2_i_biwt <= (NOT core_wten) AND coeffs_rsc_0_2_i_oswt;
  coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct <= coeffs_rsc_0_2_i_oswt_pff
      AND core_wen;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_1_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_1_i_biwt : IN STD_LOGIC;
    coeffs_rsc_0_1_i_bdwt : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL coeffs_rsc_0_1_i_q_d_mxwt_drv : STD_LOGIC_VECTOR (6 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_1_i_bcwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_1_i_q_d_bfwt : STD_LOGIC_VECTOR (6 DOWNTO 0);

  FUNCTION MUX_v_7_2_2(input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  coeffs_rsc_0_1_i_q_d_mxwt <= coeffs_rsc_0_1_i_q_d_mxwt_drv;

  coeffs_rsc_0_1_i_q_d_mxwt_drv <= MUX_v_7_2_2(coeffs_rsc_0_1_i_q_d, coeffs_rsc_0_1_i_q_d_bfwt,
      coeffs_rsc_0_1_i_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_1_i_bcwt <= '0';
      ELSE
        coeffs_rsc_0_1_i_bcwt <= NOT((NOT(coeffs_rsc_0_1_i_bcwt OR coeffs_rsc_0_1_i_biwt))
            OR coeffs_rsc_0_1_i_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_1_i_q_d_bfwt <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( coeffs_rsc_0_1_i_bcwt = '0' ) THEN
        coeffs_rsc_0_1_i_q_d_bfwt <= coeffs_rsc_0_1_i_q_d_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_1_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_1_i_biwt : OUT STD_LOGIC;
    coeffs_rsc_0_1_i_bdwt : OUT STD_LOGIC;
    coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
    coeffs_rsc_0_1_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_rsc_0_1_i_bdwt <= coeffs_rsc_0_1_i_oswt AND core_wen;
  coeffs_rsc_0_1_i_biwt <= (NOT core_wten) AND coeffs_rsc_0_1_i_oswt;
  coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct <= coeffs_rsc_0_1_i_oswt_pff
      AND core_wen;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_0_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_0_i_biwt : IN STD_LOGIC;
    coeffs_rsc_0_0_i_bdwt : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL coeffs_rsc_0_0_i_q_d_mxwt_drv : STD_LOGIC_VECTOR (6 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_0_i_bcwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_0_i_q_d_bfwt : STD_LOGIC_VECTOR (6 DOWNTO 0);

  FUNCTION MUX_v_7_2_2(input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  coeffs_rsc_0_0_i_q_d_mxwt <= coeffs_rsc_0_0_i_q_d_mxwt_drv;

  coeffs_rsc_0_0_i_q_d_mxwt_drv <= MUX_v_7_2_2(coeffs_rsc_0_0_i_q_d, coeffs_rsc_0_0_i_q_d_bfwt,
      coeffs_rsc_0_0_i_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_0_i_bcwt <= '0';
      ELSE
        coeffs_rsc_0_0_i_bcwt <= NOT((NOT(coeffs_rsc_0_0_i_bcwt OR coeffs_rsc_0_0_i_biwt))
            OR coeffs_rsc_0_0_i_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsc_0_0_i_q_d_bfwt <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( coeffs_rsc_0_0_i_bcwt = '0' ) THEN
        coeffs_rsc_0_0_i_q_d_bfwt <= coeffs_rsc_0_0_i_q_d_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_0_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_0_i_biwt : OUT STD_LOGIC;
    coeffs_rsc_0_0_i_bdwt : OUT STD_LOGIC;
    coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
    coeffs_rsc_0_0_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_rsc_0_0_i_bdwt <= coeffs_rsc_0_0_i_oswt AND core_wen;
  coeffs_rsc_0_0_i_biwt <= (NOT core_wten) AND coeffs_rsc_0_0_i_oswt;
  coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct <= coeffs_rsc_0_0_i_oswt_pff
      AND core_wen;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_result_rsci_result_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_result_rsci_result_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    result_rsci_oswt : IN STD_LOGIC;
    result_rsci_wen_comp : OUT STD_LOGIC;
    result_rsci_biwt : IN STD_LOGIC;
    result_rsci_bdwt : IN STD_LOGIC;
    result_rsci_bcwt : OUT STD_LOGIC
  );
END test_core_result_rsci_result_wait_dp;

ARCHITECTURE v7 OF test_core_result_rsci_result_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL result_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  result_rsci_bcwt <= result_rsci_bcwt_drv;

  result_rsci_wen_comp <= (NOT result_rsci_oswt) OR result_rsci_biwt OR result_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        result_rsci_bcwt_drv <= '0';
      ELSE
        result_rsci_bcwt_drv <= NOT((NOT(result_rsci_bcwt_drv OR result_rsci_biwt))
            OR result_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_result_rsci_result_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_result_rsci_result_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    result_rsci_oswt : IN STD_LOGIC;
    result_rsci_irdy : IN STD_LOGIC;
    result_rsci_biwt : OUT STD_LOGIC;
    result_rsci_bdwt : OUT STD_LOGIC;
    result_rsci_bcwt : IN STD_LOGIC;
    result_rsci_ivld_core_sct : OUT STD_LOGIC
  );
END test_core_result_rsci_result_wait_ctrl;

ARCHITECTURE v7 OF test_core_result_rsci_result_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL result_rsci_ogwt : STD_LOGIC;

BEGIN
  result_rsci_bdwt <= result_rsci_oswt AND core_wen;
  result_rsci_biwt <= result_rsci_ogwt AND result_rsci_irdy;
  result_rsci_ogwt <= result_rsci_oswt AND (NOT result_rsci_bcwt);
  result_rsci_ivld_core_sct <= result_rsci_ogwt;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeff_addr_rsci_coeff_addr_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeff_addr_rsci_coeff_addr_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeff_addr_rsci_oswt : IN STD_LOGIC;
    coeff_addr_rsci_wen_comp : OUT STD_LOGIC;
    coeff_addr_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeff_addr_rsci_biwt : IN STD_LOGIC;
    coeff_addr_rsci_bdwt : IN STD_LOGIC;
    coeff_addr_rsci_bcwt : OUT STD_LOGIC;
    coeff_addr_rsci_idat : IN STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END test_core_coeff_addr_rsci_coeff_addr_wait_dp;

ARCHITECTURE v7 OF test_core_coeff_addr_rsci_coeff_addr_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL coeff_addr_rsci_idat_mxwt_drv : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeff_addr_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL coeff_addr_rsci_idat_bfwt : STD_LOGIC_VECTOR (4 DOWNTO 0);

  FUNCTION MUX_v_5_2_2(input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  coeff_addr_rsci_idat_mxwt <= coeff_addr_rsci_idat_mxwt_drv;
  coeff_addr_rsci_bcwt <= coeff_addr_rsci_bcwt_drv;

  coeff_addr_rsci_wen_comp <= (NOT coeff_addr_rsci_oswt) OR coeff_addr_rsci_biwt
      OR coeff_addr_rsci_bcwt_drv;
  coeff_addr_rsci_idat_mxwt_drv <= MUX_v_5_2_2(coeff_addr_rsci_idat, coeff_addr_rsci_idat_bfwt,
      coeff_addr_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeff_addr_rsci_bcwt_drv <= '0';
      ELSE
        coeff_addr_rsci_bcwt_drv <= NOT((NOT(coeff_addr_rsci_bcwt_drv OR coeff_addr_rsci_biwt))
            OR coeff_addr_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeff_addr_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( coeff_addr_rsci_bcwt_drv = '0' ) THEN
        coeff_addr_rsci_idat_bfwt <= coeff_addr_rsci_idat_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeff_addr_rsci_coeff_addr_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeff_addr_rsci_coeff_addr_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    coeff_addr_rsci_oswt : IN STD_LOGIC;
    coeff_addr_rsci_biwt : OUT STD_LOGIC;
    coeff_addr_rsci_bdwt : OUT STD_LOGIC;
    coeff_addr_rsci_bcwt : IN STD_LOGIC;
    coeff_addr_rsci_irdy_core_sct : OUT STD_LOGIC;
    coeff_addr_rsci_ivld : IN STD_LOGIC
  );
END test_core_coeff_addr_rsci_coeff_addr_wait_ctrl;

ARCHITECTURE v7 OF test_core_coeff_addr_rsci_coeff_addr_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeff_addr_rsci_ogwt : STD_LOGIC;

BEGIN
  coeff_addr_rsci_bdwt <= coeff_addr_rsci_oswt AND core_wen;
  coeff_addr_rsci_biwt <= coeff_addr_rsci_ogwt AND coeff_addr_rsci_ivld;
  coeff_addr_rsci_ogwt <= coeff_addr_rsci_oswt AND (NOT coeff_addr_rsci_bcwt);
  coeff_addr_rsci_irdy_core_sct <= coeff_addr_rsci_ogwt;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_data_in_rsci_data_in_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_data_in_rsci_data_in_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    data_in_rsci_oswt : IN STD_LOGIC;
    data_in_rsci_wen_comp : OUT STD_LOGIC;
    data_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    data_in_rsci_biwt : IN STD_LOGIC;
    data_in_rsci_bdwt : IN STD_LOGIC;
    data_in_rsci_bcwt : OUT STD_LOGIC;
    data_in_rsci_idat : IN STD_LOGIC_VECTOR (9 DOWNTO 0)
  );
END test_core_data_in_rsci_data_in_wait_dp;

ARCHITECTURE v7 OF test_core_data_in_rsci_data_in_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL data_in_rsci_idat_mxwt_drv : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL data_in_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL data_in_rsci_idat_bfwt : STD_LOGIC_VECTOR (9 DOWNTO 0);

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  data_in_rsci_idat_mxwt <= data_in_rsci_idat_mxwt_drv;
  data_in_rsci_bcwt <= data_in_rsci_bcwt_drv;

  data_in_rsci_wen_comp <= (NOT data_in_rsci_oswt) OR data_in_rsci_biwt OR data_in_rsci_bcwt_drv;
  data_in_rsci_idat_mxwt_drv <= MUX_v_10_2_2(data_in_rsci_idat, data_in_rsci_idat_bfwt,
      data_in_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        data_in_rsci_bcwt_drv <= '0';
      ELSE
        data_in_rsci_bcwt_drv <= NOT((NOT(data_in_rsci_bcwt_drv OR data_in_rsci_biwt))
            OR data_in_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        data_in_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( data_in_rsci_bcwt_drv = '0' ) THEN
        data_in_rsci_idat_bfwt <= data_in_rsci_idat_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_data_in_rsci_data_in_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_data_in_rsci_data_in_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    data_in_rsci_oswt : IN STD_LOGIC;
    data_in_rsci_biwt : OUT STD_LOGIC;
    data_in_rsci_bdwt : OUT STD_LOGIC;
    data_in_rsci_bcwt : IN STD_LOGIC;
    data_in_rsci_irdy_core_sct : OUT STD_LOGIC;
    data_in_rsci_ivld : IN STD_LOGIC
  );
END test_core_data_in_rsci_data_in_wait_ctrl;

ARCHITECTURE v7 OF test_core_data_in_rsci_data_in_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL data_in_rsci_ogwt : STD_LOGIC;

BEGIN
  data_in_rsci_bdwt <= data_in_rsci_oswt AND core_wen;
  data_in_rsci_biwt <= data_in_rsci_ogwt AND data_in_rsci_ivld;
  data_in_rsci_ogwt <= data_in_rsci_oswt AND (NOT data_in_rsci_bcwt);
  data_in_rsci_irdy_core_sct <= data_in_rsci_ogwt;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_0_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_0_obj IS
  PORT(
    coeffs_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_0_obj_iswt0 : IN STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_0_obj;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_0_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_triosy_0_0_obj_ld_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_triosy_0_0_obj_coeffs_rsc_triosy_0_0_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_0_obj_iswt0 : IN STD_LOGIC;
      coeffs_rsc_triosy_0_0_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeffs_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => coeffs_rsc_triosy_0_0_obj_ld_core_sct,
      lz => coeffs_rsc_triosy_0_0_lz
    );
  test_core_coeffs_rsc_triosy_0_0_obj_coeffs_rsc_triosy_0_0_wait_ctrl_inst : test_core_coeffs_rsc_triosy_0_0_obj_coeffs_rsc_triosy_0_0_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      coeffs_rsc_triosy_0_0_obj_iswt0 => coeffs_rsc_triosy_0_0_obj_iswt0,
      coeffs_rsc_triosy_0_0_obj_ld_core_sct => coeffs_rsc_triosy_0_0_obj_ld_core_sct
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_1_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_1_obj IS
  PORT(
    coeffs_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_1_obj_iswt0 : IN STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_1_obj;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_1_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_triosy_0_1_obj_ld_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_triosy_0_1_obj_coeffs_rsc_triosy_0_1_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_1_obj_iswt0 : IN STD_LOGIC;
      coeffs_rsc_triosy_0_1_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeffs_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => coeffs_rsc_triosy_0_1_obj_ld_core_sct,
      lz => coeffs_rsc_triosy_0_1_lz
    );
  test_core_coeffs_rsc_triosy_0_1_obj_coeffs_rsc_triosy_0_1_wait_ctrl_inst : test_core_coeffs_rsc_triosy_0_1_obj_coeffs_rsc_triosy_0_1_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      coeffs_rsc_triosy_0_1_obj_iswt0 => coeffs_rsc_triosy_0_1_obj_iswt0,
      coeffs_rsc_triosy_0_1_obj_ld_core_sct => coeffs_rsc_triosy_0_1_obj_ld_core_sct
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_2_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_2_obj IS
  PORT(
    coeffs_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_2_obj_iswt0 : IN STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_2_obj;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_2_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_triosy_0_2_obj_ld_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_triosy_0_2_obj_coeffs_rsc_triosy_0_2_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_2_obj_iswt0 : IN STD_LOGIC;
      coeffs_rsc_triosy_0_2_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeffs_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => coeffs_rsc_triosy_0_2_obj_ld_core_sct,
      lz => coeffs_rsc_triosy_0_2_lz
    );
  test_core_coeffs_rsc_triosy_0_2_obj_coeffs_rsc_triosy_0_2_wait_ctrl_inst : test_core_coeffs_rsc_triosy_0_2_obj_coeffs_rsc_triosy_0_2_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      coeffs_rsc_triosy_0_2_obj_iswt0 => coeffs_rsc_triosy_0_2_obj_iswt0,
      coeffs_rsc_triosy_0_2_obj_ld_core_sct => coeffs_rsc_triosy_0_2_obj_ld_core_sct
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_triosy_0_3_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_triosy_0_3_obj IS
  PORT(
    coeffs_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_triosy_0_3_obj_iswt0 : IN STD_LOGIC
  );
END test_core_coeffs_rsc_triosy_0_3_obj;

ARCHITECTURE v7 OF test_core_coeffs_rsc_triosy_0_3_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_triosy_0_3_obj_ld_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_triosy_0_3_obj_coeffs_rsc_triosy_0_3_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_3_obj_iswt0 : IN STD_LOGIC;
      coeffs_rsc_triosy_0_3_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeffs_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => coeffs_rsc_triosy_0_3_obj_ld_core_sct,
      lz => coeffs_rsc_triosy_0_3_lz
    );
  test_core_coeffs_rsc_triosy_0_3_obj_coeffs_rsc_triosy_0_3_wait_ctrl_inst : test_core_coeffs_rsc_triosy_0_3_obj_coeffs_rsc_triosy_0_3_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      coeffs_rsc_triosy_0_3_obj_iswt0 => coeffs_rsc_triosy_0_3_obj_iswt0,
      coeffs_rsc_triosy_0_3_obj_ld_core_sct => coeffs_rsc_triosy_0_3_obj_ld_core_sct
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_3_i_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_3_i_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_3_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_3_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_3_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_3_i_1;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_3_i_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_3_i_biwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_3_i_bdwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_3_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_3_i_biwt : OUT STD_LOGIC;
      coeffs_rsc_0_3_i_bdwt : OUT STD_LOGIC;
      coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
      coeffs_rsc_0_3_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_3_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_3_i_biwt : IN STD_LOGIC;
      coeffs_rsc_0_3_i_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp_inst_coeffs_rsc_0_3_i_q_d
      : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp_inst_coeffs_rsc_0_3_i_q_d_mxwt
      : STD_LOGIC_VECTOR (6 DOWNTO 0);

BEGIN
  test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_ctrl_inst : test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_3_i_oswt => coeffs_rsc_0_3_i_oswt,
      coeffs_rsc_0_3_i_biwt => coeffs_rsc_0_3_i_biwt,
      coeffs_rsc_0_3_i_bdwt => coeffs_rsc_0_3_i_bdwt,
      coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct => coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct,
      coeffs_rsc_0_3_i_oswt_pff => coeffs_rsc_0_3_i_oswt_pff
    );
  test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp_inst : test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_3_i_q_d => test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp_inst_coeffs_rsc_0_3_i_q_d,
      coeffs_rsc_0_3_i_q_d_mxwt => test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp_inst_coeffs_rsc_0_3_i_q_d_mxwt,
      coeffs_rsc_0_3_i_biwt => coeffs_rsc_0_3_i_biwt,
      coeffs_rsc_0_3_i_bdwt => coeffs_rsc_0_3_i_bdwt
    );
  test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp_inst_coeffs_rsc_0_3_i_q_d <=
      coeffs_rsc_0_3_i_q_d;
  coeffs_rsc_0_3_i_q_d_mxwt <= test_core_coeffs_rsc_0_3_i_1_coeffs_rsc_0_3_wait_dp_inst_coeffs_rsc_0_3_i_q_d_mxwt;

  coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_2_i_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_2_i_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_2_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_2_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_2_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_2_i_1;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_2_i_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_2_i_biwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_2_i_bdwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_2_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_2_i_biwt : OUT STD_LOGIC;
      coeffs_rsc_0_2_i_bdwt : OUT STD_LOGIC;
      coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
      coeffs_rsc_0_2_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_2_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_2_i_biwt : IN STD_LOGIC;
      coeffs_rsc_0_2_i_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp_inst_coeffs_rsc_0_2_i_q_d
      : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp_inst_coeffs_rsc_0_2_i_q_d_mxwt
      : STD_LOGIC_VECTOR (6 DOWNTO 0);

BEGIN
  test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_ctrl_inst : test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_2_i_oswt => coeffs_rsc_0_2_i_oswt,
      coeffs_rsc_0_2_i_biwt => coeffs_rsc_0_2_i_biwt,
      coeffs_rsc_0_2_i_bdwt => coeffs_rsc_0_2_i_bdwt,
      coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct => coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct,
      coeffs_rsc_0_2_i_oswt_pff => coeffs_rsc_0_2_i_oswt_pff
    );
  test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp_inst : test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_2_i_q_d => test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp_inst_coeffs_rsc_0_2_i_q_d,
      coeffs_rsc_0_2_i_q_d_mxwt => test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp_inst_coeffs_rsc_0_2_i_q_d_mxwt,
      coeffs_rsc_0_2_i_biwt => coeffs_rsc_0_2_i_biwt,
      coeffs_rsc_0_2_i_bdwt => coeffs_rsc_0_2_i_bdwt
    );
  test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp_inst_coeffs_rsc_0_2_i_q_d <=
      coeffs_rsc_0_2_i_q_d;
  coeffs_rsc_0_2_i_q_d_mxwt <= test_core_coeffs_rsc_0_2_i_1_coeffs_rsc_0_2_wait_dp_inst_coeffs_rsc_0_2_i_q_d_mxwt;

  coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_1_i_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_1_i_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_1_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_1_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_1_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_1_i_1;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_1_i_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_1_i_biwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_1_i_bdwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_1_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_1_i_biwt : OUT STD_LOGIC;
      coeffs_rsc_0_1_i_bdwt : OUT STD_LOGIC;
      coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
      coeffs_rsc_0_1_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_1_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_1_i_biwt : IN STD_LOGIC;
      coeffs_rsc_0_1_i_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp_inst_coeffs_rsc_0_1_i_q_d
      : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp_inst_coeffs_rsc_0_1_i_q_d_mxwt
      : STD_LOGIC_VECTOR (6 DOWNTO 0);

BEGIN
  test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_ctrl_inst : test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_1_i_oswt => coeffs_rsc_0_1_i_oswt,
      coeffs_rsc_0_1_i_biwt => coeffs_rsc_0_1_i_biwt,
      coeffs_rsc_0_1_i_bdwt => coeffs_rsc_0_1_i_bdwt,
      coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct => coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct,
      coeffs_rsc_0_1_i_oswt_pff => coeffs_rsc_0_1_i_oswt_pff
    );
  test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp_inst : test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_1_i_q_d => test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp_inst_coeffs_rsc_0_1_i_q_d,
      coeffs_rsc_0_1_i_q_d_mxwt => test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp_inst_coeffs_rsc_0_1_i_q_d_mxwt,
      coeffs_rsc_0_1_i_biwt => coeffs_rsc_0_1_i_biwt,
      coeffs_rsc_0_1_i_bdwt => coeffs_rsc_0_1_i_bdwt
    );
  test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp_inst_coeffs_rsc_0_1_i_q_d <=
      coeffs_rsc_0_1_i_q_d;
  coeffs_rsc_0_1_i_q_d_mxwt <= test_core_coeffs_rsc_0_1_i_1_coeffs_rsc_0_1_wait_dp_inst_coeffs_rsc_0_1_i_q_d_mxwt;

  coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeffs_rsc_0_0_i_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeffs_rsc_0_0_i_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    coeffs_rsc_0_0_i_oswt : IN STD_LOGIC;
    coeffs_rsc_0_0_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_0_i_oswt_pff : IN STD_LOGIC
  );
END test_core_coeffs_rsc_0_0_i_1;

ARCHITECTURE v7 OF test_core_coeffs_rsc_0_0_i_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_0_i_biwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_0_i_bdwt : STD_LOGIC;
  SIGNAL coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_0_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_0_i_biwt : OUT STD_LOGIC;
      coeffs_rsc_0_0_i_bdwt : OUT STD_LOGIC;
      coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
      coeffs_rsc_0_0_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_0_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_0_i_biwt : IN STD_LOGIC;
      coeffs_rsc_0_0_i_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp_inst_coeffs_rsc_0_0_i_q_d
      : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp_inst_coeffs_rsc_0_0_i_q_d_mxwt
      : STD_LOGIC_VECTOR (6 DOWNTO 0);

BEGIN
  test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_ctrl_inst : test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_0_i_oswt => coeffs_rsc_0_0_i_oswt,
      coeffs_rsc_0_0_i_biwt => coeffs_rsc_0_0_i_biwt,
      coeffs_rsc_0_0_i_bdwt => coeffs_rsc_0_0_i_bdwt,
      coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct => coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct,
      coeffs_rsc_0_0_i_oswt_pff => coeffs_rsc_0_0_i_oswt_pff
    );
  test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp_inst : test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_0_i_q_d => test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp_inst_coeffs_rsc_0_0_i_q_d,
      coeffs_rsc_0_0_i_q_d_mxwt => test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp_inst_coeffs_rsc_0_0_i_q_d_mxwt,
      coeffs_rsc_0_0_i_biwt => coeffs_rsc_0_0_i_biwt,
      coeffs_rsc_0_0_i_bdwt => coeffs_rsc_0_0_i_bdwt
    );
  test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp_inst_coeffs_rsc_0_0_i_q_d <=
      coeffs_rsc_0_0_i_q_d;
  coeffs_rsc_0_0_i_q_d_mxwt <= test_core_coeffs_rsc_0_0_i_1_coeffs_rsc_0_0_wait_dp_inst_coeffs_rsc_0_0_i_q_d_mxwt;

  coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_result_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_result_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (18 DOWNTO 0);
    result_rsc_vld : OUT STD_LOGIC;
    result_rsc_rdy : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    result_rsci_oswt : IN STD_LOGIC;
    result_rsci_wen_comp : OUT STD_LOGIC;
    result_rsci_idat : IN STD_LOGIC_VECTOR (18 DOWNTO 0)
  );
END test_core_result_rsci;

ARCHITECTURE v7 OF test_core_result_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL result_rsci_irdy : STD_LOGIC;
  SIGNAL result_rsci_biwt : STD_LOGIC;
  SIGNAL result_rsci_bdwt : STD_LOGIC;
  SIGNAL result_rsci_bcwt : STD_LOGIC;
  SIGNAL result_rsci_ivld_core_sct : STD_LOGIC;

  SIGNAL result_rsci_idat_1 : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL result_rsci_dat : STD_LOGIC_VECTOR (18 DOWNTO 0);

  COMPONENT test_core_result_rsci_result_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      result_rsci_oswt : IN STD_LOGIC;
      result_rsci_irdy : IN STD_LOGIC;
      result_rsci_biwt : OUT STD_LOGIC;
      result_rsci_bdwt : OUT STD_LOGIC;
      result_rsci_bcwt : IN STD_LOGIC;
      result_rsci_ivld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_result_rsci_result_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      result_rsci_oswt : IN STD_LOGIC;
      result_rsci_wen_comp : OUT STD_LOGIC;
      result_rsci_biwt : IN STD_LOGIC;
      result_rsci_bdwt : IN STD_LOGIC;
      result_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  result_rsci : work.ccs_out_wait_pkg_v1.ccs_out_wait_v1
    GENERIC MAP(
      rscid => 4,
      width => 19
      )
    PORT MAP(
      irdy => result_rsci_irdy,
      ivld => result_rsci_ivld_core_sct,
      idat => result_rsci_idat_1,
      rdy => result_rsc_rdy,
      vld => result_rsc_vld,
      dat => result_rsci_dat
    );
  result_rsci_idat_1 <= result_rsci_idat;
  result_rsc_dat <= result_rsci_dat;

  test_core_result_rsci_result_wait_ctrl_inst : test_core_result_rsci_result_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      result_rsci_oswt => result_rsci_oswt,
      result_rsci_irdy => result_rsci_irdy,
      result_rsci_biwt => result_rsci_biwt,
      result_rsci_bdwt => result_rsci_bdwt,
      result_rsci_bcwt => result_rsci_bcwt,
      result_rsci_ivld_core_sct => result_rsci_ivld_core_sct
    );
  test_core_result_rsci_result_wait_dp_inst : test_core_result_rsci_result_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      result_rsci_oswt => result_rsci_oswt,
      result_rsci_wen_comp => result_rsci_wen_comp,
      result_rsci_biwt => result_rsci_biwt,
      result_rsci_bdwt => result_rsci_bdwt,
      result_rsci_bcwt => result_rsci_bcwt
    );
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_coeff_addr_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_coeff_addr_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeff_addr_rsc_vld : IN STD_LOGIC;
    coeff_addr_rsc_rdy : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    coeff_addr_rsci_oswt : IN STD_LOGIC;
    coeff_addr_rsci_wen_comp : OUT STD_LOGIC;
    coeff_addr_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END test_core_coeff_addr_rsci;

ARCHITECTURE v7 OF test_core_coeff_addr_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeff_addr_rsci_biwt : STD_LOGIC;
  SIGNAL coeff_addr_rsci_bdwt : STD_LOGIC;
  SIGNAL coeff_addr_rsci_bcwt : STD_LOGIC;
  SIGNAL coeff_addr_rsci_irdy_core_sct : STD_LOGIC;
  SIGNAL coeff_addr_rsci_ivld : STD_LOGIC;
  SIGNAL coeff_addr_rsci_idat : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL coeff_addr_rsci_dat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeff_addr_rsci_idat_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);

  COMPONENT test_core_coeff_addr_rsci_coeff_addr_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      coeff_addr_rsci_oswt : IN STD_LOGIC;
      coeff_addr_rsci_biwt : OUT STD_LOGIC;
      coeff_addr_rsci_bdwt : OUT STD_LOGIC;
      coeff_addr_rsci_bcwt : IN STD_LOGIC;
      coeff_addr_rsci_irdy_core_sct : OUT STD_LOGIC;
      coeff_addr_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeff_addr_rsci_coeff_addr_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeff_addr_rsci_oswt : IN STD_LOGIC;
      coeff_addr_rsci_wen_comp : OUT STD_LOGIC;
      coeff_addr_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      coeff_addr_rsci_biwt : IN STD_LOGIC;
      coeff_addr_rsci_bdwt : IN STD_LOGIC;
      coeff_addr_rsci_bcwt : OUT STD_LOGIC;
      coeff_addr_rsci_idat : IN STD_LOGIC_VECTOR (4 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_core_coeff_addr_rsci_coeff_addr_wait_dp_inst_coeff_addr_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL test_core_coeff_addr_rsci_coeff_addr_wait_dp_inst_coeff_addr_rsci_idat :
      STD_LOGIC_VECTOR (4 DOWNTO 0);

BEGIN
  coeff_addr_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 3,
      width => 5
      )
    PORT MAP(
      rdy => coeff_addr_rsc_rdy,
      vld => coeff_addr_rsc_vld,
      dat => coeff_addr_rsci_dat,
      irdy => coeff_addr_rsci_irdy_core_sct,
      ivld => coeff_addr_rsci_ivld,
      idat => coeff_addr_rsci_idat_1
    );
  coeff_addr_rsci_dat <= coeff_addr_rsc_dat;
  coeff_addr_rsci_idat <= coeff_addr_rsci_idat_1;

  test_core_coeff_addr_rsci_coeff_addr_wait_ctrl_inst : test_core_coeff_addr_rsci_coeff_addr_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      coeff_addr_rsci_oswt => coeff_addr_rsci_oswt,
      coeff_addr_rsci_biwt => coeff_addr_rsci_biwt,
      coeff_addr_rsci_bdwt => coeff_addr_rsci_bdwt,
      coeff_addr_rsci_bcwt => coeff_addr_rsci_bcwt,
      coeff_addr_rsci_irdy_core_sct => coeff_addr_rsci_irdy_core_sct,
      coeff_addr_rsci_ivld => coeff_addr_rsci_ivld
    );
  test_core_coeff_addr_rsci_coeff_addr_wait_dp_inst : test_core_coeff_addr_rsci_coeff_addr_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      coeff_addr_rsci_oswt => coeff_addr_rsci_oswt,
      coeff_addr_rsci_wen_comp => coeff_addr_rsci_wen_comp,
      coeff_addr_rsci_idat_mxwt => test_core_coeff_addr_rsci_coeff_addr_wait_dp_inst_coeff_addr_rsci_idat_mxwt,
      coeff_addr_rsci_biwt => coeff_addr_rsci_biwt,
      coeff_addr_rsci_bdwt => coeff_addr_rsci_bdwt,
      coeff_addr_rsci_bcwt => coeff_addr_rsci_bcwt,
      coeff_addr_rsci_idat => test_core_coeff_addr_rsci_coeff_addr_wait_dp_inst_coeff_addr_rsci_idat
    );
  coeff_addr_rsci_idat_mxwt <= test_core_coeff_addr_rsci_coeff_addr_wait_dp_inst_coeff_addr_rsci_idat_mxwt;
  test_core_coeff_addr_rsci_coeff_addr_wait_dp_inst_coeff_addr_rsci_idat <= coeff_addr_rsci_idat;

END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core_data_in_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core_data_in_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    data_in_rsc_dat : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    data_in_rsc_vld : IN STD_LOGIC;
    data_in_rsc_rdy : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    data_in_rsci_oswt : IN STD_LOGIC;
    data_in_rsci_wen_comp : OUT STD_LOGIC;
    data_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
  );
END test_core_data_in_rsci;

ARCHITECTURE v7 OF test_core_data_in_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL data_in_rsci_biwt : STD_LOGIC;
  SIGNAL data_in_rsci_bdwt : STD_LOGIC;
  SIGNAL data_in_rsci_bcwt : STD_LOGIC;
  SIGNAL data_in_rsci_irdy_core_sct : STD_LOGIC;
  SIGNAL data_in_rsci_ivld : STD_LOGIC;
  SIGNAL data_in_rsci_idat : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL data_in_rsci_dat : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL data_in_rsci_idat_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT test_core_data_in_rsci_data_in_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      data_in_rsci_oswt : IN STD_LOGIC;
      data_in_rsci_biwt : OUT STD_LOGIC;
      data_in_rsci_bdwt : OUT STD_LOGIC;
      data_in_rsci_bcwt : IN STD_LOGIC;
      data_in_rsci_irdy_core_sct : OUT STD_LOGIC;
      data_in_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_data_in_rsci_data_in_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      data_in_rsci_oswt : IN STD_LOGIC;
      data_in_rsci_wen_comp : OUT STD_LOGIC;
      data_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      data_in_rsci_biwt : IN STD_LOGIC;
      data_in_rsci_bdwt : IN STD_LOGIC;
      data_in_rsci_bcwt : OUT STD_LOGIC;
      data_in_rsci_idat : IN STD_LOGIC_VECTOR (9 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_core_data_in_rsci_data_in_wait_dp_inst_data_in_rsci_idat_mxwt : STD_LOGIC_VECTOR
      (9 DOWNTO 0);
  SIGNAL test_core_data_in_rsci_data_in_wait_dp_inst_data_in_rsci_idat : STD_LOGIC_VECTOR
      (9 DOWNTO 0);

BEGIN
  data_in_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 1,
      width => 10
      )
    PORT MAP(
      rdy => data_in_rsc_rdy,
      vld => data_in_rsc_vld,
      dat => data_in_rsci_dat,
      irdy => data_in_rsci_irdy_core_sct,
      ivld => data_in_rsci_ivld,
      idat => data_in_rsci_idat_1
    );
  data_in_rsci_dat <= data_in_rsc_dat;
  data_in_rsci_idat <= data_in_rsci_idat_1;

  test_core_data_in_rsci_data_in_wait_ctrl_inst : test_core_data_in_rsci_data_in_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      data_in_rsci_oswt => data_in_rsci_oswt,
      data_in_rsci_biwt => data_in_rsci_biwt,
      data_in_rsci_bdwt => data_in_rsci_bdwt,
      data_in_rsci_bcwt => data_in_rsci_bcwt,
      data_in_rsci_irdy_core_sct => data_in_rsci_irdy_core_sct,
      data_in_rsci_ivld => data_in_rsci_ivld
    );
  test_core_data_in_rsci_data_in_wait_dp_inst : test_core_data_in_rsci_data_in_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      data_in_rsci_oswt => data_in_rsci_oswt,
      data_in_rsci_wen_comp => data_in_rsci_wen_comp,
      data_in_rsci_idat_mxwt => test_core_data_in_rsci_data_in_wait_dp_inst_data_in_rsci_idat_mxwt,
      data_in_rsci_biwt => data_in_rsci_biwt,
      data_in_rsci_bdwt => data_in_rsci_bdwt,
      data_in_rsci_bcwt => data_in_rsci_bcwt,
      data_in_rsci_idat => test_core_data_in_rsci_data_in_wait_dp_inst_data_in_rsci_idat
    );
  data_in_rsci_idat_mxwt <= test_core_data_in_rsci_data_in_wait_dp_inst_data_in_rsci_idat_mxwt;
  test_core_data_in_rsci_data_in_wait_dp_inst_data_in_rsci_idat <= data_in_rsci_idat;

END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    data_in_rsc_dat : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    data_in_rsc_vld : IN STD_LOGIC;
    data_in_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    coeffs_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    coeffs_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    coeffs_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeff_addr_rsc_vld : IN STD_LOGIC;
    coeff_addr_rsc_rdy : OUT STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (18 DOWNTO 0);
    result_rsc_vld : OUT STD_LOGIC;
    result_rsc_rdy : IN STD_LOGIC;
    coeffs_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    coeffs_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    coeffs_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    coeffs_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    coeffs_rsc_0_0_i_adr_d_pff : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END test_core;

ARCHITECTURE v7 OF test_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wen : STD_LOGIC;
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL data_in_rsci_wen_comp : STD_LOGIC;
  SIGNAL data_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL coeff_addr_rsci_wen_comp : STD_LOGIC;
  SIGNAL coeff_addr_rsci_idat_mxwt : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL result_rsci_wen_comp : STD_LOGIC;
  SIGNAL result_rsci_idat : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL coeffs_rsc_0_0_i_q_d_mxwt : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_1_i_q_d_mxwt : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_2_i_q_d_mxwt : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_3_i_q_d_mxwt : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse : STD_LOGIC;
  SIGNAL reg_result_rsci_ivld_core_psct_cse : STD_LOGIC;
  SIGNAL reg_coeff_addr_rsci_irdy_core_psct_cse : STD_LOGIC;
  SIGNAL coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC;
  SIGNAL coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC;
  SIGNAL coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC;
  SIGNAL coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC;
  SIGNAL SHIFT_if_asn_ncse_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL MAC_asn_itm_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL MAC_asn_4_itm_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL MAC_asn_5_itm_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL MAC_asn_5_itm_1_mx0c1 : STD_LOGIC;

  SIGNAL MAC_3_mul_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL MAC_4_mul_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL MAC_1_mul_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL MAC_2_mul_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL MAC_not_nl : STD_LOGIC;
  COMPONENT test_core_data_in_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      data_in_rsc_dat : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      data_in_rsc_vld : IN STD_LOGIC;
      data_in_rsc_rdy : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      data_in_rsci_oswt : IN STD_LOGIC;
      data_in_rsci_wen_comp : OUT STD_LOGIC;
      data_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_core_data_in_rsci_inst_data_in_rsc_dat : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL test_core_data_in_rsci_inst_data_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (9
      DOWNTO 0);

  COMPONENT test_core_coeff_addr_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      coeff_addr_rsc_vld : IN STD_LOGIC;
      coeff_addr_rsc_rdy : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      coeff_addr_rsci_oswt : IN STD_LOGIC;
      coeff_addr_rsci_wen_comp : OUT STD_LOGIC;
      coeff_addr_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_core_coeff_addr_rsci_inst_coeff_addr_rsc_dat : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL test_core_coeff_addr_rsci_inst_coeff_addr_rsci_idat_mxwt : STD_LOGIC_VECTOR
      (4 DOWNTO 0);

  COMPONENT test_core_result_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      result_rsc_dat : OUT STD_LOGIC_VECTOR (18 DOWNTO 0);
      result_rsc_vld : OUT STD_LOGIC;
      result_rsc_rdy : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      result_rsci_oswt : IN STD_LOGIC;
      result_rsci_wen_comp : OUT STD_LOGIC;
      result_rsci_idat : IN STD_LOGIC_VECTOR (18 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_core_result_rsci_inst_result_rsc_dat : STD_LOGIC_VECTOR (18 DOWNTO
      0);
  SIGNAL test_core_result_rsci_inst_result_rsci_idat : STD_LOGIC_VECTOR (18 DOWNTO
      0);

  COMPONENT test_core_coeffs_rsc_0_0_i_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_0_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_0_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_0_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_q_d : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_q_d_mxwt : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_oswt_pff : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_0_1_i_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_1_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_1_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_1_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_q_d : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_q_d_mxwt : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_oswt_pff : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_0_2_i_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_2_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_2_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_2_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_q_d : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_q_d_mxwt : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_oswt_pff : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_0_3_i_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_0_3_i_oswt : IN STD_LOGIC;
      coeffs_rsc_0_3_i_q_d_mxwt : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_3_i_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_q_d : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_q_d_mxwt : STD_LOGIC_VECTOR
      (6 DOWNTO 0);
  SIGNAL test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_oswt_pff : STD_LOGIC;

  COMPONENT test_core_coeffs_rsc_triosy_0_3_obj
    PORT(
      coeffs_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_3_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeffs_rsc_triosy_0_2_obj
    PORT(
      coeffs_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_2_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeffs_rsc_triosy_0_1_obj
    PORT(
      coeffs_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_1_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_coeffs_rsc_triosy_0_0_obj
    PORT(
      coeffs_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      coeffs_rsc_triosy_0_0_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : OUT STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      data_in_rsci_wen_comp : IN STD_LOGIC;
      coeff_addr_rsci_wen_comp : IN STD_LOGIC;
      result_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (1 DOWNTO 0);

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  test_core_data_in_rsci_inst : test_core_data_in_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      data_in_rsc_dat => test_core_data_in_rsci_inst_data_in_rsc_dat,
      data_in_rsc_vld => data_in_rsc_vld,
      data_in_rsc_rdy => data_in_rsc_rdy,
      core_wen => core_wen,
      data_in_rsci_oswt => reg_coeff_addr_rsci_irdy_core_psct_cse,
      data_in_rsci_wen_comp => data_in_rsci_wen_comp,
      data_in_rsci_idat_mxwt => test_core_data_in_rsci_inst_data_in_rsci_idat_mxwt
    );
  test_core_data_in_rsci_inst_data_in_rsc_dat <= data_in_rsc_dat;
  data_in_rsci_idat_mxwt <= test_core_data_in_rsci_inst_data_in_rsci_idat_mxwt;

  test_core_coeff_addr_rsci_inst : test_core_coeff_addr_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      coeff_addr_rsc_dat => test_core_coeff_addr_rsci_inst_coeff_addr_rsc_dat,
      coeff_addr_rsc_vld => coeff_addr_rsc_vld,
      coeff_addr_rsc_rdy => coeff_addr_rsc_rdy,
      core_wen => core_wen,
      coeff_addr_rsci_oswt => reg_coeff_addr_rsci_irdy_core_psct_cse,
      coeff_addr_rsci_wen_comp => coeff_addr_rsci_wen_comp,
      coeff_addr_rsci_idat_mxwt => test_core_coeff_addr_rsci_inst_coeff_addr_rsci_idat_mxwt
    );
  test_core_coeff_addr_rsci_inst_coeff_addr_rsc_dat <= coeff_addr_rsc_dat;
  coeff_addr_rsci_idat_mxwt <= test_core_coeff_addr_rsci_inst_coeff_addr_rsci_idat_mxwt;

  test_core_result_rsci_inst : test_core_result_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      result_rsc_dat => test_core_result_rsci_inst_result_rsc_dat,
      result_rsc_vld => result_rsc_vld,
      result_rsc_rdy => result_rsc_rdy,
      core_wen => core_wen,
      result_rsci_oswt => reg_result_rsci_ivld_core_psct_cse,
      result_rsci_wen_comp => result_rsci_wen_comp,
      result_rsci_idat => test_core_result_rsci_inst_result_rsci_idat
    );
  result_rsc_dat <= test_core_result_rsci_inst_result_rsc_dat;
  test_core_result_rsci_inst_result_rsci_idat <= result_rsci_idat;

  test_core_coeffs_rsc_0_0_i_1_inst : test_core_coeffs_rsc_0_0_i_1
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_0_i_q_d => test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_q_d,
      coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg,
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_0_i_oswt => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse,
      coeffs_rsc_0_0_i_q_d_mxwt => test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_q_d_mxwt,
      coeffs_rsc_0_0_i_oswt_pff => test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_oswt_pff
    );
  test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_q_d <= coeffs_rsc_0_0_i_q_d;
  coeffs_rsc_0_0_i_q_d_mxwt <= test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_q_d_mxwt;
  test_core_coeffs_rsc_0_0_i_1_inst_coeffs_rsc_0_0_i_oswt_pff <= fsm_output(1);

  test_core_coeffs_rsc_0_1_i_1_inst : test_core_coeffs_rsc_0_1_i_1
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_1_i_q_d => test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_q_d,
      coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg,
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_1_i_oswt => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse,
      coeffs_rsc_0_1_i_q_d_mxwt => test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_q_d_mxwt,
      coeffs_rsc_0_1_i_oswt_pff => test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_oswt_pff
    );
  test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_q_d <= coeffs_rsc_0_1_i_q_d;
  coeffs_rsc_0_1_i_q_d_mxwt <= test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_q_d_mxwt;
  test_core_coeffs_rsc_0_1_i_1_inst_coeffs_rsc_0_1_i_oswt_pff <= fsm_output(1);

  test_core_coeffs_rsc_0_2_i_1_inst : test_core_coeffs_rsc_0_2_i_1
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_2_i_q_d => test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_q_d,
      coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg,
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_2_i_oswt => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse,
      coeffs_rsc_0_2_i_q_d_mxwt => test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_q_d_mxwt,
      coeffs_rsc_0_2_i_oswt_pff => test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_oswt_pff
    );
  test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_q_d <= coeffs_rsc_0_2_i_q_d;
  coeffs_rsc_0_2_i_q_d_mxwt <= test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_q_d_mxwt;
  test_core_coeffs_rsc_0_2_i_1_inst_coeffs_rsc_0_2_i_oswt_pff <= fsm_output(1);

  test_core_coeffs_rsc_0_3_i_1_inst : test_core_coeffs_rsc_0_3_i_1
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsc_0_3_i_q_d => test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_q_d,
      coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg,
      core_wen => core_wen,
      core_wten => core_wten,
      coeffs_rsc_0_3_i_oswt => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse,
      coeffs_rsc_0_3_i_q_d_mxwt => test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_q_d_mxwt,
      coeffs_rsc_0_3_i_oswt_pff => test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_oswt_pff
    );
  test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_q_d <= coeffs_rsc_0_3_i_q_d;
  coeffs_rsc_0_3_i_q_d_mxwt <= test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_q_d_mxwt;
  test_core_coeffs_rsc_0_3_i_1_inst_coeffs_rsc_0_3_i_oswt_pff <= fsm_output(1);

  test_core_coeffs_rsc_triosy_0_3_obj_inst : test_core_coeffs_rsc_triosy_0_3_obj
    PORT MAP(
      coeffs_rsc_triosy_0_3_lz => coeffs_rsc_triosy_0_3_lz,
      core_wten => core_wten,
      coeffs_rsc_triosy_0_3_obj_iswt0 => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse
    );
  test_core_coeffs_rsc_triosy_0_2_obj_inst : test_core_coeffs_rsc_triosy_0_2_obj
    PORT MAP(
      coeffs_rsc_triosy_0_2_lz => coeffs_rsc_triosy_0_2_lz,
      core_wten => core_wten,
      coeffs_rsc_triosy_0_2_obj_iswt0 => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse
    );
  test_core_coeffs_rsc_triosy_0_1_obj_inst : test_core_coeffs_rsc_triosy_0_1_obj
    PORT MAP(
      coeffs_rsc_triosy_0_1_lz => coeffs_rsc_triosy_0_1_lz,
      core_wten => core_wten,
      coeffs_rsc_triosy_0_1_obj_iswt0 => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse
    );
  test_core_coeffs_rsc_triosy_0_0_obj_inst : test_core_coeffs_rsc_triosy_0_0_obj
    PORT MAP(
      coeffs_rsc_triosy_0_0_lz => coeffs_rsc_triosy_0_0_lz,
      core_wten => core_wten,
      coeffs_rsc_triosy_0_0_obj_iswt0 => reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse
    );
  test_core_staller_inst : test_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      core_wten => core_wten,
      data_in_rsci_wen_comp => data_in_rsci_wen_comp,
      coeff_addr_rsci_wen_comp => coeff_addr_rsci_wen_comp,
      result_rsci_wen_comp => result_rsci_wen_comp
    );
  test_core_core_fsm_inst : test_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      fsm_output => test_core_core_fsm_inst_fsm_output
    );
  fsm_output <= test_core_core_fsm_inst_fsm_output;

  MAC_asn_5_itm_1_mx0c1 <= (NOT reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse) AND
      (fsm_output(1));
  coeffs_rsc_0_0_i_adr_d_pff <= coeff_addr_rsci_idat_mxwt;
  coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg;
  coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg;
  coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg;
  coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d <= coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d_reg;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse <= '0';
        reg_result_rsci_ivld_core_psct_cse <= '0';
        reg_coeff_addr_rsci_irdy_core_psct_cse <= '0';
        MAC_asn_4_itm_1 <= STD_LOGIC_VECTOR'( "0000000000");
        SHIFT_if_asn_ncse_sva_1 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( core_wen = '1' ) THEN
        reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse <= fsm_output(1);
        reg_result_rsci_ivld_core_psct_cse <= reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse;
        reg_coeff_addr_rsci_irdy_core_psct_cse <= '1';
        MAC_asn_4_itm_1 <= MAC_asn_itm_1;
        SHIFT_if_asn_ncse_sva_1 <= data_in_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        result_rsci_idat <= STD_LOGIC_VECTOR'( "0000000000000000000");
      ELSIF ( (core_wen AND reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse) = '1'
          ) THEN
        result_rsci_idat <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(MAC_3_mul_nl),
            19) + CONV_SIGNED(SIGNED(MAC_4_mul_nl), 19) + CONV_SIGNED(SIGNED(MAC_1_mul_nl),
            19) + CONV_SIGNED(SIGNED(MAC_2_mul_nl), 19), 19));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        MAC_asn_itm_1 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (core_wen AND (NOT (fsm_output(0)))) = '1' ) THEN
        MAC_asn_itm_1 <= MAC_asn_5_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        MAC_asn_5_itm_1 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (core_wen AND (reg_coeffs_rsc_triosy_0_0_obj_ld_core_psct_cse OR MAC_asn_5_itm_1_mx0c1))
          = '1' ) THEN
        MAC_asn_5_itm_1 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), SHIFT_if_asn_ncse_sva_1,
            MAC_not_nl);
      END IF;
    END IF;
  END PROCESS;
  MAC_3_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(MAC_asn_itm_1) * SIGNED(coeffs_rsc_0_2_i_q_d_mxwt)),
      17));
  MAC_4_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(MAC_asn_4_itm_1) *
      SIGNED(coeffs_rsc_0_3_i_q_d_mxwt)), 17));
  MAC_1_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(SHIFT_if_asn_ncse_sva_1)
      * SIGNED(coeffs_rsc_0_0_i_q_d_mxwt)), 17));
  MAC_2_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(MAC_asn_5_itm_1) *
      SIGNED(coeffs_rsc_0_1_i_q_d_mxwt)), 17));
  MAC_not_nl <= NOT MAC_asn_5_itm_1_mx0c1;
END v7;

-- ------------------------------------------------------------------
--  Design Unit:    test
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY test IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    data_in_rsc_dat : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    data_in_rsc_vld : IN STD_LOGIC;
    data_in_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_0_0_adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeffs_rsc_0_0_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_0_we : OUT STD_LOGIC;
    coeffs_rsc_0_0_q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    coeffs_rsc_0_1_adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeffs_rsc_0_1_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_1_we : OUT STD_LOGIC;
    coeffs_rsc_0_1_q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    coeffs_rsc_0_2_adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeffs_rsc_0_2_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_2_we : OUT STD_LOGIC;
    coeffs_rsc_0_2_q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    coeffs_rsc_0_3_adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeffs_rsc_0_3_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_0_3_we : OUT STD_LOGIC;
    coeffs_rsc_0_3_q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    coeffs_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeff_addr_rsc_vld : IN STD_LOGIC;
    coeff_addr_rsc_rdy : OUT STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (18 DOWNTO 0);
    result_rsc_vld : OUT STD_LOGIC;
    result_rsc_rdy : IN STD_LOGIC
  );
END test;

ARCHITECTURE v7 OF test IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';
  CONSTANT GND : STD_LOGIC := '0';

  -- Interconnect Declarations
  SIGNAL coeffs_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL coeffs_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL coeffs_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL coeffs_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL coeffs_rsc_0_0_i_adr_d_iff : STD_LOGIC_VECTOR (4 DOWNTO 0);

  COMPONENT test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_6_7_5_32_32_7_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL coeffs_rsc_0_0_i_q : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_0_i_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_0_i_adr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_0_i_adr_d : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_7_7_5_32_32_7_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL coeffs_rsc_0_1_i_q : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_1_i_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_1_i_adr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_1_i_adr_d : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_8_7_5_32_32_7_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL coeffs_rsc_0_2_i_q : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_2_i_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_2_i_adr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_2_i_adr_d : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_2_i_d_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_9_7_5_32_32_7_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adr : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      adr_d : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      port_0_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_0_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL coeffs_rsc_0_3_i_q : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_3_i_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_3_i_adr : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_3_i_adr_d : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeffs_rsc_0_3_i_d_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL coeffs_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT test_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      data_in_rsc_dat : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      data_in_rsc_vld : IN STD_LOGIC;
      data_in_rsc_rdy : OUT STD_LOGIC;
      coeffs_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      coeffs_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      coeffs_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      coeffs_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      coeff_addr_rsc_vld : IN STD_LOGIC;
      coeff_addr_rsc_rdy : OUT STD_LOGIC;
      result_rsc_dat : OUT STD_LOGIC_VECTOR (18 DOWNTO 0);
      result_rsc_vld : OUT STD_LOGIC;
      result_rsc_rdy : IN STD_LOGIC;
      coeffs_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      coeffs_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      coeffs_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      coeffs_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      coeffs_rsc_0_0_i_adr_d_pff : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_core_inst_data_in_rsc_dat : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL test_core_inst_coeff_addr_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL test_core_inst_result_rsc_dat : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL test_core_inst_coeffs_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_inst_coeffs_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_inst_coeffs_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_inst_coeffs_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL test_core_inst_coeffs_rsc_0_0_i_adr_d_pff : STD_LOGIC_VECTOR (4 DOWNTO 0);

BEGIN
  coeffs_rsc_0_0_i : test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_6_7_5_32_32_7_5_gen
    PORT MAP(
      q => coeffs_rsc_0_0_i_q,
      we => coeffs_rsc_0_0_we,
      d => coeffs_rsc_0_0_i_d,
      adr => coeffs_rsc_0_0_i_adr,
      adr_d => coeffs_rsc_0_0_i_adr_d,
      d_d => coeffs_rsc_0_0_i_d_d,
      we_d => '0',
      q_d => coeffs_rsc_0_0_i_q_d_1,
      port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d => '0'
    );
  coeffs_rsc_0_0_i_q <= coeffs_rsc_0_0_q;
  coeffs_rsc_0_0_d <= coeffs_rsc_0_0_i_d;
  coeffs_rsc_0_0_adr <= coeffs_rsc_0_0_i_adr;
  coeffs_rsc_0_0_i_adr_d <= coeffs_rsc_0_0_i_adr_d_iff;
  coeffs_rsc_0_0_i_d_d <= STD_LOGIC_VECTOR'( "0000000");
  coeffs_rsc_0_0_i_q_d <= coeffs_rsc_0_0_i_q_d_1;

  coeffs_rsc_0_1_i : test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_7_7_5_32_32_7_5_gen
    PORT MAP(
      q => coeffs_rsc_0_1_i_q,
      we => coeffs_rsc_0_1_we,
      d => coeffs_rsc_0_1_i_d,
      adr => coeffs_rsc_0_1_i_adr,
      adr_d => coeffs_rsc_0_1_i_adr_d,
      d_d => coeffs_rsc_0_1_i_d_d,
      we_d => '0',
      q_d => coeffs_rsc_0_1_i_q_d_1,
      port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d => '0'
    );
  coeffs_rsc_0_1_i_q <= coeffs_rsc_0_1_q;
  coeffs_rsc_0_1_d <= coeffs_rsc_0_1_i_d;
  coeffs_rsc_0_1_adr <= coeffs_rsc_0_1_i_adr;
  coeffs_rsc_0_1_i_adr_d <= coeffs_rsc_0_0_i_adr_d_iff;
  coeffs_rsc_0_1_i_d_d <= STD_LOGIC_VECTOR'( "0000000");
  coeffs_rsc_0_1_i_q_d <= coeffs_rsc_0_1_i_q_d_1;

  coeffs_rsc_0_2_i : test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_8_7_5_32_32_7_5_gen
    PORT MAP(
      q => coeffs_rsc_0_2_i_q,
      we => coeffs_rsc_0_2_we,
      d => coeffs_rsc_0_2_i_d,
      adr => coeffs_rsc_0_2_i_adr,
      adr_d => coeffs_rsc_0_2_i_adr_d,
      d_d => coeffs_rsc_0_2_i_d_d,
      we_d => '0',
      q_d => coeffs_rsc_0_2_i_q_d_1,
      port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d => '0'
    );
  coeffs_rsc_0_2_i_q <= coeffs_rsc_0_2_q;
  coeffs_rsc_0_2_d <= coeffs_rsc_0_2_i_d;
  coeffs_rsc_0_2_adr <= coeffs_rsc_0_2_i_adr;
  coeffs_rsc_0_2_i_adr_d <= coeffs_rsc_0_0_i_adr_d_iff;
  coeffs_rsc_0_2_i_d_d <= STD_LOGIC_VECTOR'( "0000000");
  coeffs_rsc_0_2_i_q_d <= coeffs_rsc_0_2_i_q_d_1;

  coeffs_rsc_0_3_i : test_ccs_sample_mem_ccs_ram_sync_singleport_rwport_9_7_5_32_32_7_5_gen
    PORT MAP(
      q => coeffs_rsc_0_3_i_q,
      we => coeffs_rsc_0_3_we,
      d => coeffs_rsc_0_3_i_d,
      adr => coeffs_rsc_0_3_i_adr,
      adr_d => coeffs_rsc_0_3_i_adr_d,
      d_d => coeffs_rsc_0_3_i_d_d,
      we_d => '0',
      q_d => coeffs_rsc_0_3_i_q_d_1,
      port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d => '0'
    );
  coeffs_rsc_0_3_i_q <= coeffs_rsc_0_3_q;
  coeffs_rsc_0_3_d <= coeffs_rsc_0_3_i_d;
  coeffs_rsc_0_3_adr <= coeffs_rsc_0_3_i_adr;
  coeffs_rsc_0_3_i_adr_d <= coeffs_rsc_0_0_i_adr_d_iff;
  coeffs_rsc_0_3_i_d_d <= STD_LOGIC_VECTOR'( "0000000");
  coeffs_rsc_0_3_i_q_d <= coeffs_rsc_0_3_i_q_d_1;

  test_core_inst : test_core
    PORT MAP(
      clk => clk,
      rst => rst,
      data_in_rsc_dat => test_core_inst_data_in_rsc_dat,
      data_in_rsc_vld => data_in_rsc_vld,
      data_in_rsc_rdy => data_in_rsc_rdy,
      coeffs_rsc_triosy_0_0_lz => coeffs_rsc_triosy_0_0_lz,
      coeffs_rsc_triosy_0_1_lz => coeffs_rsc_triosy_0_1_lz,
      coeffs_rsc_triosy_0_2_lz => coeffs_rsc_triosy_0_2_lz,
      coeffs_rsc_triosy_0_3_lz => coeffs_rsc_triosy_0_3_lz,
      coeff_addr_rsc_dat => test_core_inst_coeff_addr_rsc_dat,
      coeff_addr_rsc_vld => coeff_addr_rsc_vld,
      coeff_addr_rsc_rdy => coeff_addr_rsc_rdy,
      result_rsc_dat => test_core_inst_result_rsc_dat,
      result_rsc_vld => result_rsc_vld,
      result_rsc_rdy => result_rsc_rdy,
      coeffs_rsc_0_0_i_q_d => test_core_inst_coeffs_rsc_0_0_i_q_d,
      coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_0_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      coeffs_rsc_0_1_i_q_d => test_core_inst_coeffs_rsc_0_1_i_q_d,
      coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_1_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      coeffs_rsc_0_2_i_q_d => test_core_inst_coeffs_rsc_0_2_i_q_d,
      coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_2_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      coeffs_rsc_0_3_i_q_d => test_core_inst_coeffs_rsc_0_3_i_q_d,
      coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d => coeffs_rsc_0_3_i_port_0_rw_ram_ir_internal_RMASK_B_d,
      coeffs_rsc_0_0_i_adr_d_pff => test_core_inst_coeffs_rsc_0_0_i_adr_d_pff
    );
  test_core_inst_data_in_rsc_dat <= data_in_rsc_dat;
  test_core_inst_coeff_addr_rsc_dat <= coeff_addr_rsc_dat;
  result_rsc_dat <= test_core_inst_result_rsc_dat;
  test_core_inst_coeffs_rsc_0_0_i_q_d <= coeffs_rsc_0_0_i_q_d;
  test_core_inst_coeffs_rsc_0_1_i_q_d <= coeffs_rsc_0_1_i_q_d;
  test_core_inst_coeffs_rsc_0_2_i_q_d <= coeffs_rsc_0_2_i_q_d;
  test_core_inst_coeffs_rsc_0_3_i_q_d <= coeffs_rsc_0_3_i_q_d;
  coeffs_rsc_0_0_i_adr_d_iff <= test_core_inst_coeffs_rsc_0_0_i_adr_d_pff;

END v7;



