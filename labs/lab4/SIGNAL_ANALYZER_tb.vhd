--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:00:47 11/17/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab4/SIGNAL_ANALYZER_tb.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SIGNAL_ANALYZER
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
 
ENTITY SIGNAL_ANALYZER_tb IS
END SIGNAL_ANALYZER_tb;
 
ARCHITECTURE behavior OF SIGNAL_ANALYZER_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SIGNAL_ANALYZER
    PORT(
         CLK : IN  std_logic;
			SIN : IN  STD_LOGIC;
         RES : IN  std_logic;
         POUT : OUT  std_logic_vector(0 to 7)
        );
    END COMPONENT;
    
   signal CLK : std_logic := '0';
   signal RES : std_logic := '0';
   signal POUT: std_logic_vector(0 to 7);
	signal SIN : std_logic := '0';
	
	constant seq : STD_LOGIC_VECTOR := "11000011";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SIGNAL_ANALYZER PORT MAP (
          CLK  => CLK,
			 SIN  => SIN,
          RES  => RES,
          POUT => POUT
        );

	SIN_proc: process
   begin		
		for i in seq'high - 1 downto 0 loop
			SIN <= seq(i);
			wait for 5 ns;
		end loop;		
   end process;
	
	CLK_proc: process
   begin
		CLK <= NOT CLK;
		wait for 5 ns;
   end process;
	
	RES_proc: process
   begin
		RES <= '1';
		wait for 10 ns;
		RES <= NOT RES;
		wait for 500 ns;
	end process;

END;
