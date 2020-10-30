--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:33:05 10/27/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab3/RST7_tb.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RST7
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
 
ENTITY RST7_tb IS
END RST7_tb;
 
ARCHITECTURE behavior OF RST7_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RST7
    PORT(
         R : IN  std_logic;
         S : IN  std_logic;
         Q : OUT  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal R : std_logic := '0';
   signal S : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 400 ns;
 
BEGIN
 
   uut: RST7 PORT MAP (
          R => R,
          S => S,
          Q => Q,
          CLK => CLK
        );

   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   stim_proc_R: process
   begin		
      wait for 50 ns;	
		R <= NOT(R);
   end process;
	
	stim_proc_S: process
   begin		
      wait for 100 ns;	
		S <= NOT(S);
   end process;

END;
