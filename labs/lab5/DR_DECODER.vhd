----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:36:51 11/19/2020 
-- Design Name: 
-- Module Name:    DR_DECODER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DR_DECODER is
	 Generic( N  : integer := 4 );
    Port ( Sin  : in   STD_LOGIC_VECTOR(2 * N - 1 downto 0);
           RC   : out  STD_LOGIC;
           Sout : out  STD_LOGIC_VECTOR(N - 1 downto 0));
end DR_DECODER;

architecture Behavioral of DR_DECODER is
	signal sigvalues : STD_LOGIC_VECTOR(N - 1 downto 0);
	signal compare : STD_LOGIC;
begin

	Main: process(Sin)
		variable tmp : std_logic;
	begin 
		tmp := '0';
		for i in 0 to N-1 loop
			tmp := tmp or (Sin(i) xor Sin(i + N));
			sigvalues(i) <= Sin(i);
		end loop;
		
		compare <= not tmp;
	end process;
	
	Sout <= sigvalues;
	RC <= compare;
	
	
end Behavioral;

