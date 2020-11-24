--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:57:43 11/23/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab5/RAM_WHC_tb.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_WHC
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
 
ENTITY RAM_WHC_tb IS
END RAM_WHC_tb;
 
ARCHITECTURE behavior OF RAM_WHC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_WHC
    Generic
	 (
				M 		   : integer := 2;
				N			: integer := 8
	 );
    Port 
	 ( 
				WR 		: in  	std_logic;
				AB 		: in  	std_logic_vector( m-1 downto 0 );
				CLK 		: in  	std_logic;
				ERR		: out    std_logic;
				DB 		: inout  std_logic_vector( n-1 + 4 downto 0 )
	  );
    END COMPONENT;
    

   --Inputs
   signal WR  : std_logic := '0';
   signal AB  : std_logic_vector(1 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
	signal ERR : std_logic := '0';

	--BiDirs
   signal DB : std_logic_vector(11 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_WHC PORT MAP (
          WR => WR,
          AB => AB,
          CLK => CLK,
			 ERR => ERR,
			 DB => DB
        );

   clk_proc: process
	 begin 
		CLK <= not CLK;
		wait for 5 ns;
	 end process;

	 AB_proc: process
	 begin
		AB <= AB + 1;
		wait for 10 ns;
	 end process;

    stim_proc: process
	 begin
		WR <= '0';
		DB <= "100110000100";
		wait for 20 ns;
		DB <= "100110000110";
		wait for 20 ns;
		
		WR <= '1';
		DB <= (others => 'Z');
		wait for 20 ns;
	 end process;

END;
