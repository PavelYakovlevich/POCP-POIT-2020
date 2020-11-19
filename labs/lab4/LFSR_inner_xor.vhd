library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR_inner_xor is
    Generic( alpha : STD_LOGIC_VECTOR := "1100101");
    Port ( CLK     : in  STD_LOGIC;
			  RES     : in  STD_LOGIC;
			  POUT    : out  STD_LOGIC_VECTOR (0 to alpha'high - 1));
end LFSR_inner_xor;

architecture Behavioral of LFSR_inner_xor is

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

	Data: process(sState)
		variable zero : STD_LOGIC;
	begin  
		zero := '0';
		for i in alpha'high-1 downto 1 loop
			if alpha(i) = '1' then
				sData(i) <= sState(alpha'high-1) xor sState(i-1);
			else
				sData(i) <= sState(i-1);
			end if;
		   zero := sState(i) or zero;
		end loop;
		
		zero := not zero;
		sData(0) <= zero xor sState(alpha'high-1);
	end process;
	
	POUT <= sState;

end Behavioral;

