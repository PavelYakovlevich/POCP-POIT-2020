library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JONSON_GEN is
	 Generic (N : integer := 4);
    Port ( CLK : in  STD_LOGIC;
			  RES : in STD_LOGIC;
           EN : in  STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR(0 to N-1));
end JONSON_GEN;

architecture Behavioral of JONSON_GEN is

signal state : std_logic_vector(0 to N-1);

begin

	process(CLK, EN, RES)
	begin 
		if RES = '1' then
			state <= (others => '0');
		elsif rising_edge(CLK) then
			if EN = '1' then
				state <= not state(N - 1) & state(0 to N-2);
			end if;
		end if;
	end process;
	
	POUT <= state;

end Behavioral;

