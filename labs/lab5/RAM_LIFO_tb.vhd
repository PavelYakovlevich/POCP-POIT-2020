--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:04:38 11/24/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab5/RAM_LIFO_tb.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_LIFO
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
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RAM_LIFO_tb IS
END RAM_LIFO_tb;
 
ARCHITECTURE behavior OF RAM_LIFO_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_LIFO
    PORT(
         WR : IN  std_logic;
         CLK : IN  std_logic;
			POP : in  std_logic;
ACT1		: out		std_logic_vector (0 to 2**2-1);
         DB : INOUT  std_logic_vector(0 to 7)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal CLK : std_logic := '0';
	signal POP : std_logic := '0';
	signal ACT : std_logic_vector (0 to 2**2-1);
	
	--BiDirs
   signal DB : std_logic_vector(0 to 7) := (others => '0');

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_LIFO PORT MAP (
          WR => WR,
          CLK => CLK,
			 POP => POP,
		 ACT1=>ACT,
          DB => DB
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
	POP_proc: process
	begin
		POP <= not POP;
		wait for 10 ns;
	end process;


   -- Stimulus process
   stim_proc: process
   begin		
      WR <= '0';
		for i in 0 to 2 loop
			DB <= DB + 1;
			wait for 10 ns;
		end loop;
		
		WR <= '1';
		DB <= (others => 'Z');
		wait for 50 ns;
   end process;

END;
