library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SYNC_DE_LATCH is
    Port ( D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end SYNC_DE_LATCH;

architecture Behavioral of SYNC_DE_LATCH is

begin

	process (CLK, E, D)
	begin
		if CLK = '1' then
			if E = '1' then
				Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

