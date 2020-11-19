library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SYNC_REG_BEH is
	 Generic ( N : integer := 3);
    Port ( DIN : in  STD_LOGIC_VECTOR(N-1 downto 0);
           EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DOUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end SYNC_REG_BEH;

architecture Behavioral of SYNC_REG_BEH is

begin

	MAIN: process(CLK, EN, DIN)
	begin
		if rising_edge(CLK) then
			if EN = '1' then
				DOUT <= DIN;
			end if;
		end if;
	end process;

end Behavioral;

