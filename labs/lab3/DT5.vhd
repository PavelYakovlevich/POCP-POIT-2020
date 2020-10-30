----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:56 10/26/2020 
-- Design Name: 
-- Module Name:    DT5 - Behavioral 
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

entity DT5 is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DT5;

architecture Behavioral of DT5 is

begin

	process (D, CLK, CLR)
	begin
		if CLR = '1' then
			Q <= '0';
		elsif rising_edge(CLK) then
			Q <= D;
		end if;
	end process;

end Behavioral;

