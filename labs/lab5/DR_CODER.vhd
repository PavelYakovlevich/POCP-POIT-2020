library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DR_CODER is
	 Generic(N : integer := 4);
    Port ( Sin : in  STD_LOGIC_VECTOR(N-1 downto 0);
           Sout : out  STD_LOGIC_VECTOR(N*2-1 downto 0
			));
end DR_CODER;

architecture Behavioral of DR_CODER is

begin

	Main: process(Sin)
	begin 
		Sout <= Sin & Sin;
	end process;

end Behavioral;

