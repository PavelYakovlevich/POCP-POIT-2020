--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:59:59 11/20/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab5/test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DR_DECODER
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
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DR_DECODER
    PORT(
         Sin : IN  std_logic_vector(7 downto 0);
         RC : OUT  std_logic;
         Sout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sin : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal RC : std_logic;
   signal Sout : std_logic_vector(3 downto 0);
	signal temp : std_logic_vector(3 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DR_DECODER PORT MAP (
          Sin => Sin,
          RC => RC,
          Sout => Sout
        );

   stim_proc: process
   begin		
		Sin <= "01100110";
      wait for 100 ns;	
		
   end process;

END;
