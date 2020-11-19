--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:57:47 11/19/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab4/BIN_COUNTER_tb.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BIN_COUNTER
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
 
ENTITY BIN_COUNTER_tb IS
END BIN_COUNTER_tb;
 
ARCHITECTURE behavior OF BIN_COUNTER_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BIN_COUNTER
    PORT(
         RES : IN  std_logic;
         CLK : IN  std_logic;
         Pout : OUT  std_logic_vector(0 to 2)
        );
    END COMPONENT;
    

   --Inputs
   signal RES : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Pout : std_logic_vector(0 to 2);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BIN_COUNTER PORT MAP (
          RES => RES,
          CLK => CLK,
          Pout => Pout
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
   RES_proc: process
   begin		
		RES <= '1';
		wait for CLK_period / 2;
		RES <= '0';
      wait for 500 ns;	
   end process;

END;
