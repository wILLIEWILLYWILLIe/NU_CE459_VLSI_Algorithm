
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
--  Generated date: Mon Dec  1 01:39:30 2025
-- ----------------------------------------------------------------------

-- 
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

ARCHITECTURE v2 OF conv_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL input_rsci_idat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL output_rsci_idat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL filter_rsci_idat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL output_rsc_triosy_obj_ld : STD_LOGIC;
  SIGNAL sum_acc_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_dcpl_2 : STD_LOGIC;
  SIGNAL or_dcpl_17 : STD_LOGIC;
  SIGNAL or_dcpl_21 : STD_LOGIC;
  SIGNAL or_dcpl_22 : STD_LOGIC;
  SIGNAL or_dcpl_23 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL or_dcpl_26 : STD_LOGIC;
  SIGNAL or_dcpl_28 : STD_LOGIC;
  SIGNAL or_dcpl_30 : STD_LOGIC;
  SIGNAL sum_i_3_0_sva_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL exitL_exit_sum_sva : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL sum_sum_and_mdf_sva_st_1 : STD_LOGIC;
  SIGNAL reg_input_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL temp_4_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_3_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_5_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_2_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_6_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_1_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_7_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_0_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL acc_13_itm_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL acc_12_itm_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL acc_14_itm_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL sum_sum_and_mdf_sva_1 : STD_LOGIC;
  SIGNAL sum_i_3_0_lpi_1_dfm_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL temp_3_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_4_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_5_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_6_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_1_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_2_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_7_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL sum_sum_mul_1_ctmp_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL temp_0_sva_1_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL nor_14_cse : STD_LOGIC;
  SIGNAL nor_15_cse : STD_LOGIC;
  SIGNAL nand_4_cse : STD_LOGIC;

  SIGNAL mux_3_nl : STD_LOGIC;
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL nor_1_nl : STD_LOGIC;
  SIGNAL nor_2_nl : STD_LOGIC;
  SIGNAL nor_3_nl : STD_LOGIC;
  SIGNAL or_60_nl : STD_LOGIC;
  SIGNAL or_59_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL sum_not_nl : STD_LOGIC;
  SIGNAL or_24_nl : STD_LOGIC;
  SIGNAL or_27_nl : STD_LOGIC;
  SIGNAL or_29_nl : STD_LOGIC;
  SIGNAL or_31_nl : STD_LOGIC;
  SIGNAL or_32_nl : STD_LOGIC;
  SIGNAL or_33_nl : STD_LOGIC;
  SIGNAL or_34_nl : STD_LOGIC;
  SIGNAL sum_mux_19_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL sum_mux_20_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL asn_temp_0_sva_1_nor_nl : STD_LOGIC;
  SIGNAL input_rsci_dat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL input_rsci_idat_1 : STD_LOGIC_VECTOR (143 DOWNTO 0);

  SIGNAL output_rsci_idat_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL output_rsci_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL filter_rsci_dat : STD_LOGIC_VECTOR (143 DOWNTO 0);
  SIGNAL filter_rsci_idat_1 : STD_LOGIC_VECTOR (143 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
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
      ld => reg_input_rsc_triosy_obj_ld_cse,
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
      ld => reg_input_rsc_triosy_obj_ld_cse,
      lz => filter_rsc_triosy_lz
    );
  nor_15_cse <= NOT(exitL_exit_sum_sva OR (sum_i_3_0_sva_1(2)));
  nand_4_cse <= NOT(CONV_SL_1_1(sum_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  nor_14_cse <= NOT((sum_i_3_0_sva_1(0)) OR (sum_i_3_0_sva_1(3)));
  sum_sum_and_mdf_sva_1 <= CONV_SL_1_1(sum_acc_tmp=STD_LOGIC_VECTOR'("1001"));
  sum_acc_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(sum_i_3_0_lpi_1_dfm_1) + SIGNED'(
      "0001"), 4));
  sum_not_nl <= NOT exitL_exit_sum_sva;
  sum_i_3_0_lpi_1_dfm_1 <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), sum_i_3_0_sva_1,
      sum_not_nl);
  or_24_nl <= or_dcpl_23 OR or_dcpl_21;
  temp_3_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_3_sva_1, or_24_nl);
  or_27_nl <= or_dcpl_26 OR or_dcpl_25;
  temp_4_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_4_sva_1, or_27_nl);
  or_29_nl <= or_dcpl_26 OR or_dcpl_28;
  temp_5_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_5_sva_1, or_29_nl);
  or_31_nl <= or_dcpl_26 OR or_dcpl_30;
  temp_6_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_6_sva_1, or_31_nl);
  or_32_nl <= or_dcpl_23 OR or_dcpl_28;
  temp_1_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_1_sva_1, or_32_nl);
  or_33_nl <= or_dcpl_23 OR or_dcpl_30;
  temp_2_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_2_sva_1, or_33_nl);
  or_34_nl <= or_dcpl_26 OR or_dcpl_21;
  temp_7_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_7_sva_1, or_34_nl);
  sum_mux_19_nl <= MUX_v_16_9_2((filter_rsci_idat(15 DOWNTO 0)), (filter_rsci_idat(31
      DOWNTO 16)), (filter_rsci_idat(47 DOWNTO 32)), (filter_rsci_idat(63 DOWNTO
      48)), (filter_rsci_idat(79 DOWNTO 64)), (filter_rsci_idat(95 DOWNTO 80)), (filter_rsci_idat(111
      DOWNTO 96)), (filter_rsci_idat(127 DOWNTO 112)), (filter_rsci_idat(143 DOWNTO
      128)), sum_i_3_0_lpi_1_dfm_1);
  sum_mux_20_nl <= MUX_v_16_9_2((input_rsci_idat(15 DOWNTO 0)), (input_rsci_idat(31
      DOWNTO 16)), (input_rsci_idat(47 DOWNTO 32)), (input_rsci_idat(63 DOWNTO 48)),
      (input_rsci_idat(79 DOWNTO 64)), (input_rsci_idat(95 DOWNTO 80)), (input_rsci_idat(111
      DOWNTO 96)), (input_rsci_idat(127 DOWNTO 112)), (input_rsci_idat(143 DOWNTO
      128)), sum_i_3_0_lpi_1_dfm_1);
  sum_sum_mul_1_ctmp_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(sum_mux_19_nl)
      * SIGNED(sum_mux_20_nl)), 16));
  asn_temp_0_sva_1_nor_nl <= NOT((NOT(CONV_SL_1_1(sum_i_3_0_sva_1(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))
      OR or_dcpl_25)) OR exitL_exit_sum_sva);
  temp_0_sva_1_mx0 <= MUX_v_16_2_2(sum_sum_mul_1_ctmp_sva_1, temp_0_sva_1, asn_temp_0_sva_1_nor_nl);
  and_dcpl_2 <= CONV_SL_1_1(sum_acc_tmp=STD_LOGIC_VECTOR'("1001"));
  or_dcpl_17 <= NOT(sum_sum_and_mdf_sva_st_1 AND main_stage_0_2);
  or_dcpl_21 <= NOT(CONV_SL_1_1(sum_i_3_0_sva_1(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_22 <= exitL_exit_sum_sva OR (sum_i_3_0_sva_1(3));
  or_dcpl_23 <= or_dcpl_22 OR (sum_i_3_0_sva_1(2));
  or_dcpl_25 <= CONV_SL_1_1(sum_i_3_0_sva_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_26 <= or_dcpl_22 OR (NOT (sum_i_3_0_sva_1(2)));
  or_dcpl_28 <= CONV_SL_1_1(sum_i_3_0_sva_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_30 <= CONV_SL_1_1(sum_i_3_0_sva_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        output_rsc_triosy_obj_ld <= '0';
        sum_sum_and_mdf_sva_st_1 <= '0';
        reg_input_rsc_triosy_obj_ld_cse <= '0';
        exitL_exit_sum_sva <= '1';
        main_stage_0_2 <= '0';
      ELSE
        output_rsc_triosy_obj_ld <= NOT or_dcpl_17;
        sum_sum_and_mdf_sva_st_1 <= sum_sum_and_mdf_sva_1;
        reg_input_rsc_triosy_obj_ld_cse <= NOT(CONV_SL_1_1(sum_acc_tmp/=STD_LOGIC_VECTOR'("1001")));
        exitL_exit_sum_sva <= sum_sum_and_mdf_sva_1;
        main_stage_0_2 <= '1';
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        output_rsci_idat <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( or_dcpl_17 = '0' ) THEN
        output_rsci_idat <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(acc_14_itm_1) + SIGNED(acc_13_itm_1)
            + SIGNED(acc_12_itm_1), 16));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        acc_13_itm_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
        acc_12_itm_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
        acc_14_itm_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( and_dcpl_2 = '1' ) THEN
        acc_13_itm_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(temp_0_sva_1_mx0) + SIGNED(temp_7_sva_1_mx0)
            + SIGNED(sum_sum_mul_1_ctmp_sva_1), 16));
        acc_12_itm_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(temp_1_sva_1_mx0) + SIGNED(temp_2_sva_1_mx0),
            16));
        acc_14_itm_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(temp_3_sva_1_mx0) + SIGNED(temp_4_sva_1_mx0)
            + SIGNED(temp_5_sva_1_mx0) + SIGNED(temp_6_sva_1_mx0), 16));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        sum_i_3_0_sva_1 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (CONV_SL_1_1(sum_acc_tmp/=STD_LOGIC_VECTOR'("1001"))) = '1' ) THEN
        sum_i_3_0_sva_1 <= sum_acc_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_3_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((nand_4_cse OR CONV_SL_1_1(sum_acc_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")))
          AND (sum_i_3_0_sva_1(1)) AND (sum_i_3_0_sva_1(0)) AND (NOT (sum_i_3_0_sva_1(3)))
          AND nor_15_cse) = '1' ) THEN
        temp_3_sva_1 <= temp_3_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_4_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((NOT((NOT(CONV_SL_1_1(sum_acc_tmp/=STD_LOGIC_VECTOR'("0100")))) OR
          (sum_i_3_0_sva_1(1)))) AND nor_14_cse AND (NOT exitL_exit_sum_sva) AND
          (sum_i_3_0_sva_1(2))) = '1' ) THEN
        temp_4_sva_1 <= temp_4_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_5_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((NOT((NOT(CONV_SL_1_1(sum_acc_tmp/=STD_LOGIC_VECTOR'("0101")))) OR
          (sum_i_3_0_sva_1(1)))) AND (sum_i_3_0_sva_1(0)) AND (NOT (sum_i_3_0_sva_1(3)))
          AND (NOT exitL_exit_sum_sva) AND (sum_i_3_0_sva_1(2))) = '1' ) THEN
        temp_5_sva_1 <= temp_5_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_6_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((CONV_SL_1_1(sum_acc_tmp/=STD_LOGIC_VECTOR'("0110"))) AND (sum_i_3_0_sva_1(1))
          AND nor_14_cse AND (NOT exitL_exit_sum_sva) AND (sum_i_3_0_sva_1(2))) =
          '1' ) THEN
        temp_6_sva_1 <= temp_6_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_1_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((NOT((NOT(CONV_SL_1_1(sum_acc_tmp/=STD_LOGIC_VECTOR'("0001")))) OR
          (sum_i_3_0_sva_1(1)))) AND (sum_i_3_0_sva_1(0)) AND (NOT (sum_i_3_0_sva_1(3)))
          AND nor_15_cse) = '1' ) THEN
        temp_1_sva_1 <= temp_1_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_2_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((CONV_SL_1_1(sum_acc_tmp/=STD_LOGIC_VECTOR'("0010"))) AND (sum_i_3_0_sva_1(1))
          AND nor_14_cse AND nor_15_cse) = '1' ) THEN
        temp_2_sva_1 <= temp_2_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_7_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( ((nand_4_cse OR CONV_SL_1_1(sum_acc_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")))
          AND (sum_i_3_0_sva_1(1)) AND (sum_i_3_0_sva_1(0)) AND (NOT (sum_i_3_0_sva_1(3)))
          AND (NOT exitL_exit_sum_sva) AND (sum_i_3_0_sva_1(2))) = '1' ) THEN
        temp_7_sva_1 <= temp_7_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_0_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_3_nl, or_59_nl, exitL_exit_sum_sva)) = '1' ) THEN
        temp_0_sva_1 <= temp_0_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  nor_1_nl <= NOT((NOT (sum_acc_tmp(0))) OR CONV_SL_1_1(sum_i_3_0_sva_1/=STD_LOGIC_VECTOR'("0000")));
  nor_2_nl <= NOT((sum_acc_tmp(0)) OR CONV_SL_1_1(sum_i_3_0_sva_1/=STD_LOGIC_VECTOR'("0000")));
  mux_2_nl <= MUX_s_1_2_2(nor_1_nl, nor_2_nl, sum_acc_tmp(3));
  nor_3_nl <= NOT(CONV_SL_1_1(sum_i_3_0_sva_1/=STD_LOGIC_VECTOR'("0000")));
  or_60_nl <= CONV_SL_1_1(sum_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_3_nl <= MUX_s_1_2_2(mux_2_nl, nor_3_nl, or_60_nl);
  mux_nl <= MUX_s_1_2_2((sum_acc_tmp(0)), (NOT (sum_acc_tmp(0))), sum_acc_tmp(3));
  or_59_nl <= CONV_SL_1_1(sum_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR mux_nl;
END v2;

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

ARCHITECTURE v2 OF conv IS
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

END v2;



