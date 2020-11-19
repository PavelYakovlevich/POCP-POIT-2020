----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:54 11/15/2020 
-- Design Name: 
-- Module Name:    DFRE - Behavioral 
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

entity DFRE is
    Port ( D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RES : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DFRE;

architecture Behavioral of DFRE is

begin

	Main: process (RES, RES, CLK, E, D)
	begin 
		if RES = '1' then
			Q <= '0';
		elsif rising_edge(CLK) then
			if E = '1' then
				Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

