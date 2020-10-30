----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:25:16 10/25/2020 
-- Design Name: 
-- Module Name:    DL1 - Behavioral 
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

entity DL1 is
    Port ( D, CLEAR: in  STD_LOGIC;
           Q : out  STD_LOGIC
    );
end DL1;

architecture Behavioral of DL1 is

begin
	process(D, CLEAR)
	begin 
		if CLEAR = '1' then
			Q <= '0';
		elsif D = '1' or D = '0' then
			Q <= D;
		end if;
	end process;
end Behavioral;

