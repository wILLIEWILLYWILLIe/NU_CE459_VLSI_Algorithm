
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


--------> /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/pkgs/siflibs/ccs_out_v1.vhd 
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

PACKAGE ccs_out_pkg_v1 IS

COMPONENT ccs_out_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    idat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_out_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_out_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    idat  : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_out_v1;

ARCHITECTURE beh OF ccs_out_v1 IS
BEGIN

  dat <= idat;

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
--  Generated date: Mon Dec  1 01:39:01 2025
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    conv_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY conv_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    sum_C_0_tr0 : IN STD_LOGIC
  );
END conv_core_core_fsm;

ARCHITECTURE v1 OF conv_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for conv_core_core_fsm_1
  TYPE conv_core_core_fsm_1_ST IS (main_C_0, sum_C_0, main_C_1, main_C_2, main_C_3,
      main_C_4, main_C_5);

  SIGNAL state_var : conv_core_core_fsm_1_ST;
  SIGNAL state_var_NS : conv_core_core_fsm_1_ST;

BEGIN
  conv_core_core_fsm_1 : PROCESS (sum_C_0_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN sum_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010");
        IF ( sum_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= sum_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000");
        state_var_NS <= main_C_3;
      WHEN main_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000");
        state_var_NS <= main_C_4;
      WHEN main_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000");
        state_var_NS <= main_C_5;
      WHEN main_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001");
        state_var_NS <= sum_C_0;
    END CASE;
  END PROCESS conv_core_core_fsm_1;

  conv_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS conv_core_core_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    conv_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY conv_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (143 DOWNTO 0);
    input_rsc_triosy_lz : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    output_rsc_triosy_lz : OUT STD_LOGIC;
    filter_rsc_dat : IN STD_LOGIC_VECTOR (143 DOWNTO 0);
    filter_rsc_triosy_lz : OUT STD_LOGIC
  );
END conv_core;

ARCHITECTURE v1 OF conv_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL input_rsci_idat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL output_rsci_idat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL filter_rsci_idat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL output_rsc_triosy_obj_ld : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL sum_acc_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL or_dcpl : STD_LOGIC;
  SIGNAL or_dcpl_1 : STD_LOGIC;
  SIGNAL or_dcpl_3 : STD_LOGIC;
  SIGNAL or_dcpl_4 : STD_LOGIC;
  SIGNAL or_dcpl_6 : STD_LOGIC;
  SIGNAL or_dcpl_8 : STD_LOGIC;
  SIGNAL or_dcpl_16 : STD_LOGIC;
  SIGNAL or_dcpl_17 : STD_LOGIC;
  SIGNAL or_dcpl_19 : STD_LOGIC;
  SIGNAL or_dcpl_21 : STD_LOGIC;
  SIGNAL or_dcpl_22 : STD_LOGIC;
  SIGNAL or_dcpl_24 : STD_LOGIC;
  SIGNAL sum_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL reg_filter_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL and_2_cse : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_4_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_3_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_5_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_2_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_6_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_1_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_7_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_0_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL acc_9_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL acc_12_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL acc_11_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL acc_10_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL sum_sum_mul_1_ctmp_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL acc_11_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL sum_mux_9_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL sum_mux_10_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL mux_7_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL mux_8_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL mux_9_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL mux_10_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL or_58_nl : STD_LOGIC;
  SIGNAL input_rsci_dat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL input_rsci_idat_1 : STD_LOGIC_VECTOR (143 DOWNTO 0);

  SIGNAL output_rsci_idat_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL output_rsci_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL filter_rsci_dat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL filter_rsci_idat_1 : STD_LOGIC_VECTOR (143 DOWNTO 0);

  COMPONENT conv_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      sum_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL conv_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_16_3_2(input_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(15 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_v_16_2_2(input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_16_9_2(input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);

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
        WHEN others =>
          result := input_8;
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

BEGIN
  input_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 1,
      width => 144
      )
    PORT MAP(
      dat => input_rsci_dat,
      idat => input_rsci_idat_1
    );
  input_rsci_dat <= input_rsc_dat;
  input_rsci_idat <= input_rsci_idat_1;

  output_rsci : work.ccs_out_pkg_v1.ccs_out_v1
    GENERIC MAP(
      rscid => 2,
      width => 16
      )
    PORT MAP(
      idat => output_rsci_idat_1,
      dat => output_rsci_dat
    );
  output_rsci_idat_1 <= output_rsci_idat;
  output_rsc_dat <= output_rsci_dat;

  filter_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 3,
      width => 144
      )
    PORT MAP(
      dat => filter_rsci_dat,
      idat => filter_rsci_idat_1
    );
  filter_rsci_dat <= filter_rsc_dat;
  filter_rsci_idat <= filter_rsci_idat_1;

  input_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_filter_rsc_triosy_obj_ld_cse,
      lz => input_rsc_triosy_lz
    );
  output_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => output_rsc_triosy_obj_ld,
      lz => output_rsc_triosy_lz
    );
  filter_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_filter_rsc_triosy_obj_ld_cse,
      lz => filter_rsc_triosy_lz
    );
  conv_core_core_fsm_inst : conv_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => conv_core_core_fsm_inst_fsm_output,
      sum_C_0_tr0 => and_2_cse
    );
  fsm_output <= conv_core_core_fsm_inst_fsm_output;

  and_2_cse <= CONV_SL_1_1(sum_acc_tmp=STD_LOGIC_VECTOR'("1001"));
  sum_acc_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(sum_i_3_0_sva) + SIGNED'( "0001"),
      4));
  sum_mux_9_nl <= MUX_v_16_9_2((filter_rsci_idat(15 DOWNTO 0)), (filter_rsci_idat(31
      DOWNTO 16)), (filter_rsci_idat(47 DOWNTO 32)), (filter_rsci_idat(63 DOWNTO
      48)), (filter_rsci_idat(79 DOWNTO 64)), (filter_rsci_idat(95 DOWNTO 80)), (filter_rsci_idat(111
      DOWNTO 96)), (filter_rsci_idat(127 DOWNTO 112)), (filter_rsci_idat(143 DOWNTO
      128)), sum_i_3_0_sva);
  sum_mux_10_nl <= MUX_v_16_9_2((input_rsci_idat(15 DOWNTO 0)), (input_rsci_idat(31
      DOWNTO 16)), (input_rsci_idat(47 DOWNTO 32)), (input_rsci_idat(63 DOWNTO 48)),
      (input_rsci_idat(79 DOWNTO 64)), (input_rsci_idat(95 DOWNTO 80)), (input_rsci_idat(111
      DOWNTO 96)), (input_rsci_idat(127 DOWNTO 112)), (input_rsci_idat(143 DOWNTO
      128)), sum_i_3_0_sva);
  sum_sum_mul_1_ctmp_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(sum_mux_9_nl)
      * SIGNED(sum_mux_10_nl)), 16));
  or_dcpl <= CONV_SL_1_1(sum_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_1 <= CONV_SL_1_1(sum_acc_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_3 <= CONV_SL_1_1(sum_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_4 <= CONV_SL_1_1(sum_acc_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_6 <= CONV_SL_1_1(sum_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_8 <= NOT(CONV_SL_1_1(sum_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_16 <= (sum_i_3_0_sva(0)) OR (sum_i_3_0_sva(2));
  or_dcpl_17 <= (sum_i_3_0_sva(1)) OR (sum_i_3_0_sva(3));
  or_dcpl_19 <= NOT((sum_i_3_0_sva(0)) AND (sum_i_3_0_sva(2)));
  or_dcpl_21 <= (sum_i_3_0_sva(0)) OR (NOT (sum_i_3_0_sva(2)));
  or_dcpl_22 <= (NOT (sum_i_3_0_sva(1))) OR (sum_i_3_0_sva(3));
  or_dcpl_24 <= (NOT (sum_i_3_0_sva(0))) OR (sum_i_3_0_sva(2));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        output_rsci_idat <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (fsm_output(5)) = '1' ) THEN
        output_rsci_idat <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_0_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_1 OR or_dcpl) AND (NOT(or_dcpl_17 OR
          or_dcpl_16))) = '1' ) THEN
        temp_0_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_5_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_4 OR or_dcpl_3) AND (NOT(or_dcpl_17 OR
          or_dcpl_19))) = '1' ) THEN
        temp_5_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_6_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_4 OR or_dcpl_6) AND (NOT(or_dcpl_22 OR
          or_dcpl_21))) = '1' ) THEN
        temp_6_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_3_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_1 OR or_dcpl_8) AND (NOT(or_dcpl_22 OR
          or_dcpl_24))) = '1' ) THEN
        temp_3_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_4_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_4 OR or_dcpl) AND (NOT(or_dcpl_17 OR
          or_dcpl_21))) = '1' ) THEN
        temp_4_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_1_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_1 OR or_dcpl_3) AND (NOT(or_dcpl_17 OR
          or_dcpl_24))) = '1' ) THEN
        temp_1_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_2_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_1 OR or_dcpl_6) AND (NOT(or_dcpl_22 OR
          or_dcpl_16))) = '1' ) THEN
        temp_2_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_7_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((fsm_output(1)) AND (or_dcpl_4 OR or_dcpl_8) AND (NOT(or_dcpl_22 OR
          or_dcpl_19))) = '1' ) THEN
        temp_7_sva_1 <= sum_sum_mul_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        sum_i_3_0_sva <= STD_LOGIC_VECTOR'( "0000");
        reg_filter_rsc_triosy_obj_ld_cse <= '0';
        output_rsc_triosy_obj_ld <= '0';
        acc_11_itm <= STD_LOGIC_VECTOR'( "0000000000000000");
        acc_9_itm <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSE
        sum_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), sum_acc_tmp, (fsm_output(1)));
        reg_filter_rsc_triosy_obj_ld_cse <= and_2_cse AND (fsm_output(1));
        output_rsc_triosy_obj_ld <= fsm_output(5);
        acc_11_itm <= MUX1HOT_v_16_3_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(acc_11_nl),
            16)), z_out, z_out_1, STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(3))
            & (fsm_output(4))));
        acc_9_itm <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        acc_10_itm <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))) = '1'
          ) THEN
        acc_10_itm <= MUX1HOT_v_16_3_2(sum_sum_mul_1_ctmp_sva_1, z_out, z_out_1,
            STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2)) & (fsm_output(3))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        acc_12_itm <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (fsm_output(2)) = '1' ) THEN
        acc_12_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(temp_1_sva_1) + SIGNED(temp_2_sva_1),
            16));
      END IF;
    END IF;
  END PROCESS;
  acc_11_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(temp_3_sva_1) + SIGNED(temp_4_sva_1),
      16));
  mux_7_nl <= MUX_v_16_2_2(temp_5_sva_1, acc_9_itm, fsm_output(3));
  mux_8_nl <= MUX_v_16_2_2(temp_6_sva_1, temp_0_sva_1, fsm_output(3));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux_7_nl) + UNSIGNED(mux_8_nl),
      16));
  mux_9_nl <= MUX_v_16_2_2(acc_11_itm, temp_7_sva_1, fsm_output(2));
  or_58_nl <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(5));
  mux_10_nl <= MUX_v_16_2_2(acc_12_itm, acc_10_itm, or_58_nl);
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux_9_nl) + UNSIGNED(mux_10_nl),
      16));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    conv
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY conv IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (143 DOWNTO 0);
    input_rsc_triosy_lz : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    output_rsc_triosy_lz : OUT STD_LOGIC;
    filter_rsc_dat : IN STD_LOGIC_VECTOR (143 DOWNTO 0);
    filter_rsc_triosy_lz : OUT STD_LOGIC
  );
END conv;

ARCHITECTURE v1 OF conv IS
  -- Default Constants

  COMPONENT conv_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsc_dat : IN STD_LOGIC_VECTOR (143 DOWNTO 0);
      input_rsc_triosy_lz : OUT STD_LOGIC;
      output_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      output_rsc_triosy_lz : OUT STD_LOGIC;
      filter_rsc_dat : IN STD_LOGIC_VECTOR (143 DOWNTO 0);
      filter_rsc_triosy_lz : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL conv_core_inst_input_rsc_dat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL conv_core_inst_output_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_core_inst_filter_rsc_dat : STD_LOGIC_VECTOR (143 DOWNTO 0);

BEGIN
  conv_core_inst : conv_core
    PORT MAP(
      clk => clk,
      rst => rst,
      input_rsc_dat => conv_core_inst_input_rsc_dat,
      input_rsc_triosy_lz => input_rsc_triosy_lz,
      output_rsc_dat => conv_core_inst_output_rsc_dat,
      output_rsc_triosy_lz => output_rsc_triosy_lz,
      filter_rsc_dat => conv_core_inst_filter_rsc_dat,
      filter_rsc_triosy_lz => filter_rsc_triosy_lz
    );
  conv_core_inst_input_rsc_dat <= input_rsc_dat;
  output_rsc_dat <= conv_core_inst_output_rsc_dat;
  conv_core_inst_filter_rsc_dat <= filter_rsc_dat;

END v1;



