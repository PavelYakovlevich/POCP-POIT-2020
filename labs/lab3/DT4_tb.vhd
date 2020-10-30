--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:49:16 10/26/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab3/DT4_tb.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DT4
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
 
ENTITY DT4_tb IS
END DT4_tb;
 
ARCHITECTURE behavior OF DT4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DT4
    PORT(
         D : IN  std_logic;
         E : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal E : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DT4 PORT MAP (
          D => D,
          E => E,
          CLK => CLK,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc_E: process
   begin		
      wait for 100 ns;	
		E <= NOT(E);
   end process;
	
	stim_proc_D: process
   begin		
      wait for 30 ns;	
		E <= NOT(E);
   end process;


END;
