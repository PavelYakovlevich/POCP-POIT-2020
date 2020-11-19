--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:05:09 11/15/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab4/SHIFT_REG_BEH_tb.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SHIFT_REG_BEH
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SHIFT_REG_BEH_tb IS
END SHIFT_REG_BEH_tb;
 
ARCHITECTURE behavior OF SHIFT_REG_BEH_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SHIFT_REG_BEH
    PORT(
         SIN : IN  std_logic;
         SE : IN  std_logic;
         CLK : IN  std_logic;
         RES : IN  std_logic;
         POUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SIN : std_logic := '0';
   signal SE : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RES : std_logic := '0';

 	--Outputs
   signal POUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SHIFT_REG_BEH PORT MAP (
          SIN => SIN,
          SE => SE,
          CLK => CLK,
          RES => RES,
          POUT => POUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		wait for 50 ns;
		CLK <= NOT(CLK);
   end process;
	
	SIN_stim_proc: process
   begin		
		SIN <= NOT(SIN);
      wait for 100 ns;	
   end process;
	
   SE_stim_proc: process
   begin		
      wait for 200 ns;	
		SE <= NOT(SE);
   end process;
	
	RES_stim_proc: process
   begin		
      wait for 150 ns;	
		RES <= NOT(RES);
   end process;

END;
