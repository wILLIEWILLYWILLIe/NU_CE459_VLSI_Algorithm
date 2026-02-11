
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


--------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_in_v1.vhd 
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

PACKAGE ccs_in_pkg_v1 IS

COMPONENT ccs_in_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    dat    : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_in_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    dat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_in_v1;

ARCHITECTURE beh OF ccs_in_v1 IS
BEGIN

  idat <= dat;

END beh;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.4a/835166 Production Release
--  HLS Date:       Thu Sep  5 21:35:46 PDT 2019
-- 
--  Generated by:   gel8580@finagle.wot.ece.northwestern.edu
--  Generated date: Thu Nov  6 11:08:42 2025
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    MAC_C_1_tr0 : IN STD_LOGIC
  );
END test_orig_core_core_fsm;

ARCHITECTURE v1 OF test_orig_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for test_orig_core_core_fsm_1
  TYPE test_orig_core_core_fsm_1_ST IS (core_rlp_C_0, main_C_0, MAC_C_0, MAC_C_1,
      main_C_1);

  SIGNAL state_var : test_orig_core_core_fsm_1_ST;
  SIGNAL state_var_NS : test_orig_core_core_fsm_1_ST;

BEGIN
  test_orig_core_core_fsm_1 : PROCESS (MAC_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010");
        state_var_NS <= MAC_C_0;
      WHEN MAC_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100");
        state_var_NS <= MAC_C_1;
      WHEN MAC_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000");
        IF ( MAC_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= MAC_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000");
        state_var_NS <= main_C_0;
      -- core_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS test_orig_core_core_fsm_1;

  test_orig_core_core_fsm_1_REG : PROCESS (clk)
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
  END PROCESS test_orig_core_core_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wen : OUT STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    a_in_rsci_wen_comp : IN STD_LOGIC;
    b_in_rsci_wen_comp : IN STD_LOGIC;
    result_rsci_wen_comp : IN STD_LOGIC
  );
END test_orig_core_staller;

ARCHITECTURE v1 OF test_orig_core_staller IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL core_wen_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  core_wen <= core_wen_drv;

  core_wen_drv <= a_in_rsci_wen_comp AND b_in_rsci_wen_comp AND result_rsci_wen_comp;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        core_wten <= '0';
      ELSE
        core_wten <= NOT core_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
    IS
  PORT(
    core_wten : IN STD_LOGIC;
    valid_in_data_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    valid_in_data_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl;

ARCHITECTURE v1 OF test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  valid_in_data_rsc_triosy_obj_ld_core_sct <= valid_in_data_rsc_triosy_obj_iswt0
      AND (NOT core_wten);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_result_rsci_result_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_result_rsci_result_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    result_rsci_oswt : IN STD_LOGIC;
    result_rsci_wen_comp : OUT STD_LOGIC;
    result_rsci_biwt : IN STD_LOGIC;
    result_rsci_bdwt : IN STD_LOGIC;
    result_rsci_bcwt : OUT STD_LOGIC
  );
END test_orig_core_result_rsci_result_wait_dp;

ARCHITECTURE v1 OF test_orig_core_result_rsci_result_wait_dp IS
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
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_result_rsci_result_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_result_rsci_result_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    result_rsci_oswt : IN STD_LOGIC;
    result_rsci_irdy : IN STD_LOGIC;
    result_rsci_biwt : OUT STD_LOGIC;
    result_rsci_bdwt : OUT STD_LOGIC;
    result_rsci_bcwt : IN STD_LOGIC;
    result_rsci_ivld_core_sct : OUT STD_LOGIC
  );
END test_orig_core_result_rsci_result_wait_ctrl;

ARCHITECTURE v1 OF test_orig_core_result_rsci_result_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL result_rsci_ogwt : STD_LOGIC;

BEGIN
  result_rsci_bdwt <= result_rsci_oswt AND core_wen;
  result_rsci_biwt <= result_rsci_ogwt AND result_rsci_irdy;
  result_rsci_ogwt <= result_rsci_oswt AND (NOT result_rsci_bcwt);
  result_rsci_ivld_core_sct <= result_rsci_ogwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_b_in_rsci_b_in_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_b_in_rsci_b_in_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    b_in_rsci_oswt : IN STD_LOGIC;
    b_in_rsci_wen_comp : OUT STD_LOGIC;
    b_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    b_in_rsci_biwt : IN STD_LOGIC;
    b_in_rsci_bdwt : IN STD_LOGIC;
    b_in_rsci_bcwt : OUT STD_LOGIC;
    b_in_rsci_idat : IN STD_LOGIC_VECTOR (127 DOWNTO 0)
  );
END test_orig_core_b_in_rsci_b_in_wait_dp;

ARCHITECTURE v1 OF test_orig_core_b_in_rsci_b_in_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL b_in_rsci_idat_mxwt_drv : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL b_in_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL b_in_rsci_idat_bfwt : STD_LOGIC_VECTOR (127 DOWNTO 0);

  FUNCTION MUX_v_128_2_2(input_0 : STD_LOGIC_VECTOR(127 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(127 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(127 DOWNTO 0);

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
  b_in_rsci_idat_mxwt <= b_in_rsci_idat_mxwt_drv;
  b_in_rsci_bcwt <= b_in_rsci_bcwt_drv;

  b_in_rsci_wen_comp <= (NOT b_in_rsci_oswt) OR b_in_rsci_biwt OR b_in_rsci_bcwt_drv;
  b_in_rsci_idat_mxwt_drv <= MUX_v_128_2_2(b_in_rsci_idat, b_in_rsci_idat_bfwt, b_in_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_in_rsci_bcwt_drv <= '0';
      ELSE
        b_in_rsci_bcwt_drv <= NOT((NOT(b_in_rsci_bcwt_drv OR b_in_rsci_biwt)) OR
            b_in_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        b_in_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( b_in_rsci_bcwt_drv = '0' ) THEN
        b_in_rsci_idat_bfwt <= b_in_rsci_idat_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_b_in_rsci_b_in_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_b_in_rsci_b_in_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    b_in_rsci_oswt : IN STD_LOGIC;
    b_in_rsci_biwt : OUT STD_LOGIC;
    b_in_rsci_bdwt : OUT STD_LOGIC;
    b_in_rsci_bcwt : IN STD_LOGIC;
    b_in_rsci_irdy_core_sct : OUT STD_LOGIC;
    b_in_rsci_ivld : IN STD_LOGIC
  );
END test_orig_core_b_in_rsci_b_in_wait_ctrl;

ARCHITECTURE v1 OF test_orig_core_b_in_rsci_b_in_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL b_in_rsci_ogwt : STD_LOGIC;

BEGIN
  b_in_rsci_bdwt <= b_in_rsci_oswt AND core_wen;
  b_in_rsci_biwt <= b_in_rsci_ogwt AND b_in_rsci_ivld;
  b_in_rsci_ogwt <= b_in_rsci_oswt AND (NOT b_in_rsci_bcwt);
  b_in_rsci_irdy_core_sct <= b_in_rsci_ogwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_a_in_rsci_a_in_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_a_in_rsci_a_in_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_in_rsci_oswt : IN STD_LOGIC;
    a_in_rsci_wen_comp : OUT STD_LOGIC;
    a_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    a_in_rsci_biwt : IN STD_LOGIC;
    a_in_rsci_bdwt : IN STD_LOGIC;
    a_in_rsci_bcwt : OUT STD_LOGIC;
    a_in_rsci_idat : IN STD_LOGIC_VECTOR (127 DOWNTO 0)
  );
END test_orig_core_a_in_rsci_a_in_wait_dp;

ARCHITECTURE v1 OF test_orig_core_a_in_rsci_a_in_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL a_in_rsci_idat_mxwt_drv : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL a_in_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL a_in_rsci_idat_bfwt : STD_LOGIC_VECTOR (127 DOWNTO 0);

  FUNCTION MUX_v_128_2_2(input_0 : STD_LOGIC_VECTOR(127 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(127 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(127 DOWNTO 0);

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
  a_in_rsci_idat_mxwt <= a_in_rsci_idat_mxwt_drv;
  a_in_rsci_bcwt <= a_in_rsci_bcwt_drv;

  a_in_rsci_wen_comp <= (NOT a_in_rsci_oswt) OR a_in_rsci_biwt OR a_in_rsci_bcwt_drv;
  a_in_rsci_idat_mxwt_drv <= MUX_v_128_2_2(a_in_rsci_idat, a_in_rsci_idat_bfwt, a_in_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        a_in_rsci_bcwt_drv <= '0';
      ELSE
        a_in_rsci_bcwt_drv <= NOT((NOT(a_in_rsci_bcwt_drv OR a_in_rsci_biwt)) OR
            a_in_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        a_in_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( a_in_rsci_bcwt_drv = '0' ) THEN
        a_in_rsci_idat_bfwt <= a_in_rsci_idat_mxwt_drv;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_a_in_rsci_a_in_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_a_in_rsci_a_in_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    a_in_rsci_oswt : IN STD_LOGIC;
    a_in_rsci_biwt : OUT STD_LOGIC;
    a_in_rsci_bdwt : OUT STD_LOGIC;
    a_in_rsci_bcwt : IN STD_LOGIC;
    a_in_rsci_irdy_core_sct : OUT STD_LOGIC;
    a_in_rsci_ivld : IN STD_LOGIC
  );
END test_orig_core_a_in_rsci_a_in_wait_ctrl;

ARCHITECTURE v1 OF test_orig_core_a_in_rsci_a_in_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_in_rsci_ogwt : STD_LOGIC;

BEGIN
  a_in_rsci_bdwt <= a_in_rsci_oswt AND core_wen;
  a_in_rsci_biwt <= a_in_rsci_ogwt AND a_in_rsci_ivld;
  a_in_rsci_ogwt <= a_in_rsci_oswt AND (NOT a_in_rsci_bcwt);
  a_in_rsci_irdy_core_sct <= a_in_rsci_ogwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_valid_in_data_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_valid_in_data_rsc_triosy_obj IS
  PORT(
    valid_in_data_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    valid_in_data_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END test_orig_core_valid_in_data_rsc_triosy_obj;

ARCHITECTURE v1 OF test_orig_core_valid_in_data_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL valid_in_data_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
    PORT(
      core_wten : IN STD_LOGIC;
      valid_in_data_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
      valid_in_data_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  valid_in_data_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => valid_in_data_rsc_triosy_obj_ld_core_sct,
      lz => valid_in_data_rsc_triosy_lz
    );
  test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl_inst
      : test_orig_core_valid_in_data_rsc_triosy_obj_valid_in_data_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      valid_in_data_rsc_triosy_obj_iswt0 => valid_in_data_rsc_triosy_obj_iswt0,
      valid_in_data_rsc_triosy_obj_ld_core_sct => valid_in_data_rsc_triosy_obj_ld_core_sct
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_result_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_result_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    result_rsc_vld : OUT STD_LOGIC;
    result_rsc_rdy : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    result_rsci_oswt : IN STD_LOGIC;
    result_rsci_wen_comp : OUT STD_LOGIC;
    result_rsci_idat : IN STD_LOGIC_VECTOR (19 DOWNTO 0)
  );
END test_orig_core_result_rsci;

ARCHITECTURE v1 OF test_orig_core_result_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL result_rsci_irdy : STD_LOGIC;
  SIGNAL result_rsci_biwt : STD_LOGIC;
  SIGNAL result_rsci_bdwt : STD_LOGIC;
  SIGNAL result_rsci_bcwt : STD_LOGIC;
  SIGNAL result_rsci_ivld_core_sct : STD_LOGIC;

  SIGNAL result_rsci_idat_1 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL result_rsci_dat : STD_LOGIC_VECTOR (19 DOWNTO 0);

  COMPONENT test_orig_core_result_rsci_result_wait_ctrl
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
  COMPONENT test_orig_core_result_rsci_result_wait_dp
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
      width => 20
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

  test_orig_core_result_rsci_result_wait_ctrl_inst : test_orig_core_result_rsci_result_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      result_rsci_oswt => result_rsci_oswt,
      result_rsci_irdy => result_rsci_irdy,
      result_rsci_biwt => result_rsci_biwt,
      result_rsci_bdwt => result_rsci_bdwt,
      result_rsci_bcwt => result_rsci_bcwt,
      result_rsci_ivld_core_sct => result_rsci_ivld_core_sct
    );
  test_orig_core_result_rsci_result_wait_dp_inst : test_orig_core_result_rsci_result_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      result_rsci_oswt => result_rsci_oswt,
      result_rsci_wen_comp => result_rsci_wen_comp,
      result_rsci_biwt => result_rsci_biwt,
      result_rsci_bdwt => result_rsci_bdwt,
      result_rsci_bcwt => result_rsci_bcwt
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_b_in_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_b_in_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    b_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    b_in_rsc_vld : IN STD_LOGIC;
    b_in_rsc_rdy : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    b_in_rsci_oswt : IN STD_LOGIC;
    b_in_rsci_wen_comp : OUT STD_LOGIC;
    b_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0)
  );
END test_orig_core_b_in_rsci;

ARCHITECTURE v1 OF test_orig_core_b_in_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL b_in_rsci_biwt : STD_LOGIC;
  SIGNAL b_in_rsci_bdwt : STD_LOGIC;
  SIGNAL b_in_rsci_bcwt : STD_LOGIC;
  SIGNAL b_in_rsci_irdy_core_sct : STD_LOGIC;
  SIGNAL b_in_rsci_ivld : STD_LOGIC;
  SIGNAL b_in_rsci_idat : STD_LOGIC_VECTOR (127 DOWNTO 0);

  SIGNAL b_in_rsci_dat : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL b_in_rsci_idat_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);

  COMPONENT test_orig_core_b_in_rsci_b_in_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      b_in_rsci_oswt : IN STD_LOGIC;
      b_in_rsci_biwt : OUT STD_LOGIC;
      b_in_rsci_bdwt : OUT STD_LOGIC;
      b_in_rsci_bcwt : IN STD_LOGIC;
      b_in_rsci_irdy_core_sct : OUT STD_LOGIC;
      b_in_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_orig_core_b_in_rsci_b_in_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      b_in_rsci_oswt : IN STD_LOGIC;
      b_in_rsci_wen_comp : OUT STD_LOGIC;
      b_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      b_in_rsci_biwt : IN STD_LOGIC;
      b_in_rsci_bdwt : IN STD_LOGIC;
      b_in_rsci_bcwt : OUT STD_LOGIC;
      b_in_rsci_idat : IN STD_LOGIC_VECTOR (127 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_orig_core_b_in_rsci_b_in_wait_dp_inst_b_in_rsci_idat_mxwt : STD_LOGIC_VECTOR
      (127 DOWNTO 0);
  SIGNAL test_orig_core_b_in_rsci_b_in_wait_dp_inst_b_in_rsci_idat : STD_LOGIC_VECTOR
      (127 DOWNTO 0);

BEGIN
  b_in_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 2,
      width => 128
      )
    PORT MAP(
      rdy => b_in_rsc_rdy,
      vld => b_in_rsc_vld,
      dat => b_in_rsci_dat,
      irdy => b_in_rsci_irdy_core_sct,
      ivld => b_in_rsci_ivld,
      idat => b_in_rsci_idat_1
    );
  b_in_rsci_dat <= b_in_rsc_dat;
  b_in_rsci_idat <= b_in_rsci_idat_1;

  test_orig_core_b_in_rsci_b_in_wait_ctrl_inst : test_orig_core_b_in_rsci_b_in_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      b_in_rsci_oswt => b_in_rsci_oswt,
      b_in_rsci_biwt => b_in_rsci_biwt,
      b_in_rsci_bdwt => b_in_rsci_bdwt,
      b_in_rsci_bcwt => b_in_rsci_bcwt,
      b_in_rsci_irdy_core_sct => b_in_rsci_irdy_core_sct,
      b_in_rsci_ivld => b_in_rsci_ivld
    );
  test_orig_core_b_in_rsci_b_in_wait_dp_inst : test_orig_core_b_in_rsci_b_in_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      b_in_rsci_oswt => b_in_rsci_oswt,
      b_in_rsci_wen_comp => b_in_rsci_wen_comp,
      b_in_rsci_idat_mxwt => test_orig_core_b_in_rsci_b_in_wait_dp_inst_b_in_rsci_idat_mxwt,
      b_in_rsci_biwt => b_in_rsci_biwt,
      b_in_rsci_bdwt => b_in_rsci_bdwt,
      b_in_rsci_bcwt => b_in_rsci_bcwt,
      b_in_rsci_idat => test_orig_core_b_in_rsci_b_in_wait_dp_inst_b_in_rsci_idat
    );
  b_in_rsci_idat_mxwt <= test_orig_core_b_in_rsci_b_in_wait_dp_inst_b_in_rsci_idat_mxwt;
  test_orig_core_b_in_rsci_b_in_wait_dp_inst_b_in_rsci_idat <= b_in_rsci_idat;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core_a_in_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core_a_in_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    a_in_rsc_vld : IN STD_LOGIC;
    a_in_rsc_rdy : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    a_in_rsci_oswt : IN STD_LOGIC;
    a_in_rsci_wen_comp : OUT STD_LOGIC;
    a_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0)
  );
END test_orig_core_a_in_rsci;

ARCHITECTURE v1 OF test_orig_core_a_in_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL a_in_rsci_biwt : STD_LOGIC;
  SIGNAL a_in_rsci_bdwt : STD_LOGIC;
  SIGNAL a_in_rsci_bcwt : STD_LOGIC;
  SIGNAL a_in_rsci_irdy_core_sct : STD_LOGIC;
  SIGNAL a_in_rsci_ivld : STD_LOGIC;
  SIGNAL a_in_rsci_idat : STD_LOGIC_VECTOR (127 DOWNTO 0);

  SIGNAL a_in_rsci_dat : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL a_in_rsci_idat_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);

  COMPONENT test_orig_core_a_in_rsci_a_in_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      a_in_rsci_oswt : IN STD_LOGIC;
      a_in_rsci_biwt : OUT STD_LOGIC;
      a_in_rsci_bdwt : OUT STD_LOGIC;
      a_in_rsci_bcwt : IN STD_LOGIC;
      a_in_rsci_irdy_core_sct : OUT STD_LOGIC;
      a_in_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_orig_core_a_in_rsci_a_in_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_in_rsci_oswt : IN STD_LOGIC;
      a_in_rsci_wen_comp : OUT STD_LOGIC;
      a_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      a_in_rsci_biwt : IN STD_LOGIC;
      a_in_rsci_bdwt : IN STD_LOGIC;
      a_in_rsci_bcwt : OUT STD_LOGIC;
      a_in_rsci_idat : IN STD_LOGIC_VECTOR (127 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_orig_core_a_in_rsci_a_in_wait_dp_inst_a_in_rsci_idat_mxwt : STD_LOGIC_VECTOR
      (127 DOWNTO 0);
  SIGNAL test_orig_core_a_in_rsci_a_in_wait_dp_inst_a_in_rsci_idat : STD_LOGIC_VECTOR
      (127 DOWNTO 0);

BEGIN
  a_in_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 1,
      width => 128
      )
    PORT MAP(
      rdy => a_in_rsc_rdy,
      vld => a_in_rsc_vld,
      dat => a_in_rsci_dat,
      irdy => a_in_rsci_irdy_core_sct,
      ivld => a_in_rsci_ivld,
      idat => a_in_rsci_idat_1
    );
  a_in_rsci_dat <= a_in_rsc_dat;
  a_in_rsci_idat <= a_in_rsci_idat_1;

  test_orig_core_a_in_rsci_a_in_wait_ctrl_inst : test_orig_core_a_in_rsci_a_in_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      a_in_rsci_oswt => a_in_rsci_oswt,
      a_in_rsci_biwt => a_in_rsci_biwt,
      a_in_rsci_bdwt => a_in_rsci_bdwt,
      a_in_rsci_bcwt => a_in_rsci_bcwt,
      a_in_rsci_irdy_core_sct => a_in_rsci_irdy_core_sct,
      a_in_rsci_ivld => a_in_rsci_ivld
    );
  test_orig_core_a_in_rsci_a_in_wait_dp_inst : test_orig_core_a_in_rsci_a_in_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      a_in_rsci_oswt => a_in_rsci_oswt,
      a_in_rsci_wen_comp => a_in_rsci_wen_comp,
      a_in_rsci_idat_mxwt => test_orig_core_a_in_rsci_a_in_wait_dp_inst_a_in_rsci_idat_mxwt,
      a_in_rsci_biwt => a_in_rsci_biwt,
      a_in_rsci_bdwt => a_in_rsci_bdwt,
      a_in_rsci_bcwt => a_in_rsci_bcwt,
      a_in_rsci_idat => test_orig_core_a_in_rsci_a_in_wait_dp_inst_a_in_rsci_idat
    );
  a_in_rsci_idat_mxwt <= test_orig_core_a_in_rsci_a_in_wait_dp_inst_a_in_rsci_idat_mxwt;
  test_orig_core_a_in_rsci_a_in_wait_dp_inst_a_in_rsci_idat <= a_in_rsci_idat;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    a_in_rsc_vld : IN STD_LOGIC;
    a_in_rsc_rdy : OUT STD_LOGIC;
    b_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    b_in_rsc_vld : IN STD_LOGIC;
    b_in_rsc_rdy : OUT STD_LOGIC;
    valid_in_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    valid_in_data_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    result_rsc_vld : OUT STD_LOGIC;
    result_rsc_rdy : IN STD_LOGIC
  );
END test_orig_core;

ARCHITECTURE v1 OF test_orig_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wen : STD_LOGIC;
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL a_in_rsci_wen_comp : STD_LOGIC;
  SIGNAL a_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL b_in_rsci_wen_comp : STD_LOGIC;
  SIGNAL b_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL valid_in_data_rsci_idat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL result_rsci_wen_comp : STD_LOGIC;
  SIGNAL result_rsci_idat : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL MAC_if_mux_tmp : STD_LOGIC;
  SIGNAL MAC_i_4_0_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL MAC_slc_valid_data_1_0_svs_st : STD_LOGIC;
  SIGNAL reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse : STD_LOGIC;
  SIGNAL reg_b_in_rsci_irdy_core_psct_cse : STD_LOGIC;
  SIGNAL acc_sva : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL a_data_sva : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL b_data_sva : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL valid_data_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_if_mul_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_i_4_0_sva_3_0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL acc_sva_dfm_mx0w0 : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL result_rsci_idat_mx0c1 : STD_LOGIC;
  SIGNAL a_data_and_cse : STD_LOGIC;

  SIGNAL acc_not_1_nl : STD_LOGIC;
  SIGNAL MAC_if_mux_1_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_if_mux_2_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL valid_in_data_rsci_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL valid_in_data_rsci_idat_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT test_orig_core_a_in_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      a_in_rsc_vld : IN STD_LOGIC;
      a_in_rsc_rdy : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      a_in_rsci_oswt : IN STD_LOGIC;
      a_in_rsci_wen_comp : OUT STD_LOGIC;
      a_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_orig_core_a_in_rsci_inst_a_in_rsc_dat : STD_LOGIC_VECTOR (127 DOWNTO
      0);
  SIGNAL test_orig_core_a_in_rsci_inst_a_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (127
      DOWNTO 0);

  COMPONENT test_orig_core_b_in_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      b_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      b_in_rsc_vld : IN STD_LOGIC;
      b_in_rsc_rdy : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      b_in_rsci_oswt : IN STD_LOGIC;
      b_in_rsci_wen_comp : OUT STD_LOGIC;
      b_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (127 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_orig_core_b_in_rsci_inst_b_in_rsc_dat : STD_LOGIC_VECTOR (127 DOWNTO
      0);
  SIGNAL test_orig_core_b_in_rsci_inst_b_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (127
      DOWNTO 0);

  COMPONENT test_orig_core_result_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      result_rsc_dat : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      result_rsc_vld : OUT STD_LOGIC;
      result_rsc_rdy : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      result_rsci_oswt : IN STD_LOGIC;
      result_rsci_wen_comp : OUT STD_LOGIC;
      result_rsci_idat : IN STD_LOGIC_VECTOR (19 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL test_orig_core_result_rsci_inst_result_rsc_dat : STD_LOGIC_VECTOR (19 DOWNTO
      0);
  SIGNAL test_orig_core_result_rsci_inst_result_rsci_idat : STD_LOGIC_VECTOR (19
      DOWNTO 0);

  COMPONENT test_orig_core_valid_in_data_rsc_triosy_obj
    PORT(
      valid_in_data_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      valid_in_data_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_orig_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : OUT STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      a_in_rsci_wen_comp : IN STD_LOGIC;
      b_in_rsci_wen_comp : IN STD_LOGIC;
      result_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT test_orig_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      MAC_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_orig_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL test_orig_core_core_fsm_inst_MAC_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX_s_1_16_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_15 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "0000" =>
          result := input_0;
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0011" =>
          result := input_3;
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "0111" =>
          result := input_7;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN "1011" =>
          result := input_11;
        WHEN "1100" =>
          result := input_12;
        WHEN "1101" =>
          result := input_13;
        WHEN "1110" =>
          result := input_14;
        WHEN others =>
          result := input_15;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_20_2_2(input_0 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(19 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(19 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_2_2(input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_8_16_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0000" =>
          result := input_0;
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0011" =>
          result := input_3;
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "0111" =>
          result := input_7;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN "1011" =>
          result := input_11;
        WHEN "1100" =>
          result := input_12;
        WHEN "1101" =>
          result := input_13;
        WHEN "1110" =>
          result := input_14;
        WHEN others =>
          result := input_15;
      END CASE;
    RETURN result;
  END;

BEGIN
  valid_in_data_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 3,
      width => 16
      )
    PORT MAP(
      dat => valid_in_data_rsci_dat,
      idat => valid_in_data_rsci_idat_1
    );
  valid_in_data_rsci_dat <= valid_in_data_rsc_dat;
  valid_in_data_rsci_idat <= valid_in_data_rsci_idat_1;

  test_orig_core_a_in_rsci_inst : test_orig_core_a_in_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      a_in_rsc_dat => test_orig_core_a_in_rsci_inst_a_in_rsc_dat,
      a_in_rsc_vld => a_in_rsc_vld,
      a_in_rsc_rdy => a_in_rsc_rdy,
      core_wen => core_wen,
      a_in_rsci_oswt => reg_b_in_rsci_irdy_core_psct_cse,
      a_in_rsci_wen_comp => a_in_rsci_wen_comp,
      a_in_rsci_idat_mxwt => test_orig_core_a_in_rsci_inst_a_in_rsci_idat_mxwt
    );
  test_orig_core_a_in_rsci_inst_a_in_rsc_dat <= a_in_rsc_dat;
  a_in_rsci_idat_mxwt <= test_orig_core_a_in_rsci_inst_a_in_rsci_idat_mxwt;

  test_orig_core_b_in_rsci_inst : test_orig_core_b_in_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      b_in_rsc_dat => test_orig_core_b_in_rsci_inst_b_in_rsc_dat,
      b_in_rsc_vld => b_in_rsc_vld,
      b_in_rsc_rdy => b_in_rsc_rdy,
      core_wen => core_wen,
      b_in_rsci_oswt => reg_b_in_rsci_irdy_core_psct_cse,
      b_in_rsci_wen_comp => b_in_rsci_wen_comp,
      b_in_rsci_idat_mxwt => test_orig_core_b_in_rsci_inst_b_in_rsci_idat_mxwt
    );
  test_orig_core_b_in_rsci_inst_b_in_rsc_dat <= b_in_rsc_dat;
  b_in_rsci_idat_mxwt <= test_orig_core_b_in_rsci_inst_b_in_rsci_idat_mxwt;

  test_orig_core_result_rsci_inst : test_orig_core_result_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      result_rsc_dat => test_orig_core_result_rsci_inst_result_rsc_dat,
      result_rsc_vld => result_rsc_vld,
      result_rsc_rdy => result_rsc_rdy,
      core_wen => core_wen,
      result_rsci_oswt => reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse,
      result_rsci_wen_comp => result_rsci_wen_comp,
      result_rsci_idat => test_orig_core_result_rsci_inst_result_rsci_idat
    );
  result_rsc_dat <= test_orig_core_result_rsci_inst_result_rsc_dat;
  test_orig_core_result_rsci_inst_result_rsci_idat <= result_rsci_idat;

  test_orig_core_valid_in_data_rsc_triosy_obj_inst : test_orig_core_valid_in_data_rsc_triosy_obj
    PORT MAP(
      valid_in_data_rsc_triosy_lz => valid_in_data_rsc_triosy_lz,
      core_wten => core_wten,
      valid_in_data_rsc_triosy_obj_iswt0 => reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse
    );
  test_orig_core_staller_inst : test_orig_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      core_wten => core_wten,
      a_in_rsci_wen_comp => a_in_rsci_wen_comp,
      b_in_rsci_wen_comp => b_in_rsci_wen_comp,
      result_rsci_wen_comp => result_rsci_wen_comp
    );
  test_orig_core_core_fsm_inst : test_orig_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wen => core_wen,
      fsm_output => test_orig_core_core_fsm_inst_fsm_output,
      MAC_C_1_tr0 => test_orig_core_core_fsm_inst_MAC_C_1_tr0
    );
  fsm_output <= test_orig_core_core_fsm_inst_fsm_output;
  test_orig_core_core_fsm_inst_MAC_C_1_tr0 <= MAC_i_4_0_sva_1(4);

  a_data_and_cse <= core_wen AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00"));
  acc_sva_dfm_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(acc_sva) + CONV_SIGNED(CONV_SIGNED(SIGNED(MAC_if_mul_itm),
      16), 20), 20));
  MAC_if_mux_tmp <= MUX_s_1_16_2((valid_data_sva(0)), (valid_data_sva(1)), (valid_data_sva(2)),
      (valid_data_sva(3)), (valid_data_sva(4)), (valid_data_sva(5)), (valid_data_sva(6)),
      (valid_data_sva(7)), (valid_data_sva(8)), (valid_data_sva(9)), (valid_data_sva(10)),
      (valid_data_sva(11)), (valid_data_sva(12)), (valid_data_sva(13)), (valid_data_sva(14)),
      (valid_data_sva(15)), MAC_i_4_0_sva_3_0);
  result_rsci_idat_mx0c1 <= (MAC_i_4_0_sva_1(4)) AND (NOT MAC_slc_valid_data_1_0_svs_st)
      AND (fsm_output(3));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= '0';
        reg_b_in_rsci_irdy_core_psct_cse <= '0';
        MAC_i_4_0_sva_3_0 <= STD_LOGIC_VECTOR'( "0000");
        MAC_i_4_0_sva_1 <= STD_LOGIC_VECTOR'( "00000");
        MAC_slc_valid_data_1_0_svs_st <= '0';
      ELSIF ( core_wen = '1' ) THEN
        reg_valid_in_data_rsc_triosy_obj_ld_core_psct_cse <= (MAC_i_4_0_sva_1(4))
            AND (fsm_output(3));
        reg_b_in_rsci_irdy_core_psct_cse <= (fsm_output(0)) OR (fsm_output(4));
        MAC_i_4_0_sva_3_0 <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (MAC_i_4_0_sva_1(3
            DOWNTO 0)), (fsm_output(3)));
        MAC_i_4_0_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(MAC_i_4_0_sva_3_0),
            4), 5) + SIGNED'( "00001"), 5));
        MAC_slc_valid_data_1_0_svs_st <= MAC_if_mux_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        result_rsci_idat <= STD_LOGIC_VECTOR'( "00000000000000000000");
      ELSIF ( (core_wen AND (((MAC_i_4_0_sva_1(4)) AND MAC_slc_valid_data_1_0_svs_st
          AND (fsm_output(3))) OR result_rsci_idat_mx0c1)) = '1' ) THEN
        result_rsci_idat <= MUX_v_20_2_2(acc_sva_dfm_mx0w0, acc_sva, result_rsci_idat_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        a_data_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        b_data_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        valid_data_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( a_data_and_cse = '1' ) THEN
        a_data_sva <= a_in_rsci_idat_mxwt;
        b_data_sva <= b_in_rsci_idat_mxwt;
        valid_data_sva <= valid_in_data_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        acc_sva <= STD_LOGIC_VECTOR'( "00000000000000000000");
      ELSIF ( ((((fsm_output(3)) AND MAC_slc_valid_data_1_0_svs_st) OR (fsm_output(1)))
          AND core_wen) = '1' ) THEN
        acc_sva <= MUX_v_20_2_2(STD_LOGIC_VECTOR'("00000000000000000000"), acc_sva_dfm_mx0w0,
            acc_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        MAC_if_mul_itm <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (core_wen AND MAC_if_mux_tmp) = '1' ) THEN
        MAC_if_mul_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(MAC_if_mux_1_nl)
            * SIGNED(MAC_if_mux_2_nl)), 16));
      END IF;
    END IF;
  END PROCESS;
  acc_not_1_nl <= NOT (fsm_output(1));
  MAC_if_mux_1_nl <= MUX_v_8_16_2((a_data_sva(7 DOWNTO 0)), (a_data_sva(15 DOWNTO
      8)), (a_data_sva(23 DOWNTO 16)), (a_data_sva(31 DOWNTO 24)), (a_data_sva(39
      DOWNTO 32)), (a_data_sva(47 DOWNTO 40)), (a_data_sva(55 DOWNTO 48)), (a_data_sva(63
      DOWNTO 56)), (a_data_sva(71 DOWNTO 64)), (a_data_sva(79 DOWNTO 72)), (a_data_sva(87
      DOWNTO 80)), (a_data_sva(95 DOWNTO 88)), (a_data_sva(103 DOWNTO 96)), (a_data_sva(111
      DOWNTO 104)), (a_data_sva(119 DOWNTO 112)), (a_data_sva(127 DOWNTO 120)), MAC_i_4_0_sva_3_0);
  MAC_if_mux_2_nl <= MUX_v_8_16_2((b_data_sva(7 DOWNTO 0)), (b_data_sva(15 DOWNTO
      8)), (b_data_sva(23 DOWNTO 16)), (b_data_sva(31 DOWNTO 24)), (b_data_sva(39
      DOWNTO 32)), (b_data_sva(47 DOWNTO 40)), (b_data_sva(55 DOWNTO 48)), (b_data_sva(63
      DOWNTO 56)), (b_data_sva(71 DOWNTO 64)), (b_data_sva(79 DOWNTO 72)), (b_data_sva(87
      DOWNTO 80)), (b_data_sva(95 DOWNTO 88)), (b_data_sva(103 DOWNTO 96)), (b_data_sva(111
      DOWNTO 104)), (b_data_sva(119 DOWNTO 112)), (b_data_sva(127 DOWNTO 120)), MAC_i_4_0_sva_3_0);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig_struct
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig_struct IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_in_rsc_dat_data : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    a_in_rsc_vld : IN STD_LOGIC;
    a_in_rsc_rdy : OUT STD_LOGIC;
    b_in_rsc_dat_data : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    b_in_rsc_vld : IN STD_LOGIC;
    b_in_rsc_rdy : OUT STD_LOGIC;
    valid_in_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    valid_in_data_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    result_rsc_vld : OUT STD_LOGIC;
    result_rsc_rdy : IN STD_LOGIC
  );
END test_orig_struct;

ARCHITECTURE v1 OF test_orig_struct IS
  -- Default Constants

  COMPONENT test_orig_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      a_in_rsc_vld : IN STD_LOGIC;
      a_in_rsc_rdy : OUT STD_LOGIC;
      b_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      b_in_rsc_vld : IN STD_LOGIC;
      b_in_rsc_rdy : OUT STD_LOGIC;
      valid_in_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      valid_in_data_rsc_triosy_lz : OUT STD_LOGIC;
      result_rsc_dat : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      result_rsc_vld : OUT STD_LOGIC;
      result_rsc_rdy : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_orig_core_inst_a_in_rsc_dat : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL test_orig_core_inst_b_in_rsc_dat : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL test_orig_core_inst_valid_in_data_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL test_orig_core_inst_result_rsc_dat : STD_LOGIC_VECTOR (19 DOWNTO 0);

BEGIN
  test_orig_core_inst : test_orig_core
    PORT MAP(
      clk => clk,
      rst => rst,
      a_in_rsc_dat => test_orig_core_inst_a_in_rsc_dat,
      a_in_rsc_vld => a_in_rsc_vld,
      a_in_rsc_rdy => a_in_rsc_rdy,
      b_in_rsc_dat => test_orig_core_inst_b_in_rsc_dat,
      b_in_rsc_vld => b_in_rsc_vld,
      b_in_rsc_rdy => b_in_rsc_rdy,
      valid_in_data_rsc_dat => test_orig_core_inst_valid_in_data_rsc_dat,
      valid_in_data_rsc_triosy_lz => valid_in_data_rsc_triosy_lz,
      result_rsc_dat => test_orig_core_inst_result_rsc_dat,
      result_rsc_vld => result_rsc_vld,
      result_rsc_rdy => result_rsc_rdy
    );
  test_orig_core_inst_a_in_rsc_dat <= a_in_rsc_dat_data;
  test_orig_core_inst_b_in_rsc_dat <= b_in_rsc_dat_data;
  test_orig_core_inst_valid_in_data_rsc_dat <= valid_in_data_rsc_dat;
  result_rsc_dat <= test_orig_core_inst_result_rsc_dat;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    test_orig
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY test_orig IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    a_in_rsc_vld : IN STD_LOGIC;
    a_in_rsc_rdy : OUT STD_LOGIC;
    b_in_rsc_dat : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    b_in_rsc_vld : IN STD_LOGIC;
    b_in_rsc_rdy : OUT STD_LOGIC;
    valid_in_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    valid_in_data_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
    result_rsc_vld : OUT STD_LOGIC;
    result_rsc_rdy : IN STD_LOGIC
  );
END test_orig;

ARCHITECTURE v1 OF test_orig IS
  -- Default Constants

  COMPONENT test_orig_struct
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      a_in_rsc_dat_data : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      a_in_rsc_vld : IN STD_LOGIC;
      a_in_rsc_rdy : OUT STD_LOGIC;
      b_in_rsc_dat_data : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      b_in_rsc_vld : IN STD_LOGIC;
      b_in_rsc_rdy : OUT STD_LOGIC;
      valid_in_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      valid_in_data_rsc_triosy_lz : OUT STD_LOGIC;
      result_rsc_dat : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
      result_rsc_vld : OUT STD_LOGIC;
      result_rsc_rdy : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL test_orig_struct_inst_a_in_rsc_dat_data : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL test_orig_struct_inst_b_in_rsc_dat_data : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL test_orig_struct_inst_valid_in_data_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL test_orig_struct_inst_result_rsc_dat : STD_LOGIC_VECTOR (19 DOWNTO 0);

BEGIN
  test_orig_struct_inst : test_orig_struct
    PORT MAP(
      clk => clk,
      rst => rst,
      a_in_rsc_dat_data => test_orig_struct_inst_a_in_rsc_dat_data,
      a_in_rsc_vld => a_in_rsc_vld,
      a_in_rsc_rdy => a_in_rsc_rdy,
      b_in_rsc_dat_data => test_orig_struct_inst_b_in_rsc_dat_data,
      b_in_rsc_vld => b_in_rsc_vld,
      b_in_rsc_rdy => b_in_rsc_rdy,
      valid_in_data_rsc_dat => test_orig_struct_inst_valid_in_data_rsc_dat,
      valid_in_data_rsc_triosy_lz => valid_in_data_rsc_triosy_lz,
      result_rsc_dat => test_orig_struct_inst_result_rsc_dat,
      result_rsc_vld => result_rsc_vld,
      result_rsc_rdy => result_rsc_rdy
    );
  test_orig_struct_inst_a_in_rsc_dat_data <= a_in_rsc_dat;
  test_orig_struct_inst_b_in_rsc_dat_data <= b_in_rsc_dat;
  test_orig_struct_inst_valid_in_data_rsc_dat <= valid_in_data_rsc_dat;
  result_rsc_dat <= test_orig_struct_inst_result_rsc_dat;

END v1;



