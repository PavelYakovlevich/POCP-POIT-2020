library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_CODER is
    Generic (N : integer := 4);
    Port ( Pin : in  STD_LOGIC_VECTOR(N-1 downto 0);
           Pout : out  STD_LOGIC_VECTOR(N downto 0));
end PC_CODER;

architecture Behavioral of PC_CODER is

signal result : STD_LOGIC_VECTOR(N downto 0);

begin

	Main: process(Pin)
		variable parity_bit : std_logic;
	begin
		parity_bit := Pin(0);
		for i in 1 to N-1 loop
			parity_bit := parity_bit xor Pin(i);
		end loop;
		
		result <= parity_bit & Pin;
	end process;
	
	Pout <= result;

end Behavioral;

