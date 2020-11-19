----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:59 11/16/2020 
-- Design Name: 
-- Module Name:    SIGNAL_ANALYZER - Behavioral 
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

entity SIGNAL_ANALYZER is
	 Generic (alpha : std_logic_vector := "110001101");
    Port ( CLK     : in  STD_LOGIC;
			  SIN     : in  STD_LOGIC;
			  RES     : in  STD_LOGIC;
			  POUT    : out  STD_LOGIC_VECTOR (0 to alpha'high - 1));
end SIGNAL_ANALYZER;

architecture Behavioral of SIGNAL_ANALYZER is

signal sState : STD_LOGIC_VECTOR (0 to alpha'high - 1);
signal sData  : STD_LOGIC_VECTOR (0 to alpha'high - 1);

begin

	Main: process(CLK, RES, sData)
	begin 
		if RES = '1' then
			sState <= (others => '0');
		elsif rising_edge(CLK) then
			sState <= sData;
		end if;
	end process;

	Data: process(SIN)
	begin  
		for i in alpha'high-1 downto 1 loop
			if alpha(i) = '1' then
				sData(i) <= sState(alpha'high-1) xor sState(i-1);
			else
				sData(i) <= sState(i-1);
			end if;
		end loop;
		
		sData(0) <= SIN xor sState(alpha'high-1);
	end process;
	
	POUT <= sState;
	

end Behavioral;

