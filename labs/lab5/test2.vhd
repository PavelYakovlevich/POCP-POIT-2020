--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:17:02 11/21/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab5/test2.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HC_DECODER
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
 
ENTITY test2 IS
END test2;
 
ARCHITECTURE behavior OF test2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HC_DECODER
    PORT(
         Sin : IN  std_logic_vector(0 to 6);
         Sout : OUT  std_logic_vector(0 to 3);
			temp12 : out  STD_LOGIC_VECTOR(0 to 2)
        );
    END COMPONENT;
    

   --Inputs
   signal Sin : std_logic_vector(0 to 6) := (others => '0');
	
	signal temp12 : STD_LOGIC_VECTOR(0 to 2);

 	--Outputs
   signal Sout : std_logic_vector(0 to 3);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HC_DECODER PORT MAP (
          Sin => Sin,
          Sout => Sout,
			 temp12 => temp12
        );

   stim_proc: process
   begin		
		Sin <= "1100010";
      wait for 30 ns;
		Sin <= "1100110";
		wait for 30 ns;
   end process;

END;
