--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:58 10/25/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab3/D_LATCH_struct_tb.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: D_LATCH_struct
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
 
ENTITY D_LATCH_struct_tb IS
END D_LATCH_struct_tb;
 
ARCHITECTURE behavior OF D_LATCH_struct_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_LATCH_struct
    PORT(
         D : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_LATCH_struct PORT MAP (
          D => D,
          Q => Q,
          nQ => nQ
        );

   stim_proc: process
   begin		
      wait for 100 ns;	
		D <= NOT(D);
   end process;

END;
