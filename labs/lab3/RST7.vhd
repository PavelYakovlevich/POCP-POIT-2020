----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:11:15 10/27/2020 
-- Design Name: 
-- Module Name:    RST7 - Behavioral 
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

entity RST7 is
    Port ( R : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           CLK : in  STD_LOGIC);
end RST7;

architecture Behavioral of RST7 is

begin

	process (R,S,CLK)
	begin 
		if rising_edge(CLK) then
			if S = '1' then
				Q <= '1';
			elsif R = '1' and S = '0' then
				Q <= '0';
			end if;
		end if;
	end process;

end Behavioral;

