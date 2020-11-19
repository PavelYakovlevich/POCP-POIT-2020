library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR_outter_xor is
	 Generic( alpha : STD_LOGIC_VECTOR := "1100101");
    Port ( CLK     : in  STD_LOGIC;
			  RES     : in  STD_LOGIC;
			  POUT    : out  STD_LOGIC_VECTOR (0 to alpha'high - 1));
end LFSR_outter_xor;

architecture Behavioral of LFSR_outter_xor is

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
		variable newbit 	 : STD_LOGIC;
		variable zerostate : STD_LOGIC;
	begin  
		newbit 	 := '0';
		zerostate := '0';
		
		for i in 0 to alpha'high-2 loop
			if alpha(i+1) = '1' then
				newbit := newbit xor sState(i);
			end if;
		end loop;
		
		zerostate := not zerostate;
		newbit := zerostate xor newbit xor sState(alpha'high - 1);
		sData <= newbit & sState(0 to alpha'high - 2);
		
	end process;
	
	POUT <= sState;

end Behavioral;

