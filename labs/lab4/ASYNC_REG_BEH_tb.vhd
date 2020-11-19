--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:11 11/15/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab4/ASYNC_REG_BEH_tb.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ASYNC_REG_BEH
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
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ASYNC_REG_BEH_tb IS
END ASYNC_REG_BEH_tb;
 
ARCHITECTURE behavior OF ASYNC_REG_BEH_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ASYNC_REG_BEH
    PORT(
         DIN : IN  std_logic_vector(3 downto 0);
         EN : IN  std_logic;
         DOUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DIN : std_logic_vector(3 downto 0) := (others => '0');
   signal EN : std_logic := '0';

 	--Outputs
   signal DOUT : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ASYNC_REG_BEH PORT MAP (
          DIN => DIN,
          EN => EN,
          DOUT => DOUT
        );

   EN_stim_proc: process
   begin		
		EN <= NOT(EN);
      wait for 400 ns;	
      wait;
   end process;
	
	DIN(0) <= NOT(DIN(0)) after 10 ms;		
	DIN(1) <= NOT(DIN(1)) after 20 ms;
	DIN(2) <= NOT(DIN(2)) after 30 ms;
	DIN(3) <= NOT(DIN(3)) after 40 ms;
END;
