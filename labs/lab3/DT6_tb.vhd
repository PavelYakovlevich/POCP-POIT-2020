--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:02:50 10/27/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab3/DT6_tb.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DT6
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
 
ENTITY DT6_tb IS
END DT6_tb;
 
ARCHITECTURE behavior OF DT6_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DT6
    PORT(
         D : IN  std_logic;
         PRES : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal PRES : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DT6 PORT MAP (
          D => D,
          PRES => PRES,
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
 

   stim_proc_D: process
   begin		
      wait for 100 ns;	
		D <= NOT(D);
   end process;
	
	stim_proc_PRES: process
   begin		
      wait for 20 ns;	
		PRES <= NOT(PRES);
   end process;

END;
