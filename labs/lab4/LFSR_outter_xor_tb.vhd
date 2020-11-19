--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:23:58 11/17/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab4/LFSR_outter_xor_tb.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LFSR_outter_xor
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
 
ENTITY LFSR_outter_xor_tb IS
END LFSR_outter_xor_tb;
 
ARCHITECTURE behavior OF LFSR_outter_xor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LFSR_outter_xor
    PORT(
         CLK : IN  std_logic;
         RES : IN  std_logic;
         POUT : OUT  std_logic_vector(0 to 5)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RES : std_logic := '1';

 	--Outputs
   signal POUT : std_logic_vector(0 to 5);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LFSR_outter_xor PORT MAP (
          CLK => CLK,
          RES => RES,
          POUT => POUT
        );

   CLK_process :process
   begin
		CLK <= NOT CLK;
		wait for 10 ns;
   end process;

   RES_proc: process
   begin		
		RES <= '1';   
		wait for 1 ns;	
		RES <= '0';
      wait for 600 ns;	
   end process;

END;
