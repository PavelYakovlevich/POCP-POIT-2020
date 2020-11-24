library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_DECODER is
		Generic( N : integer := 4); 
		Port (  Pin : in  STD_LOGIC_VECTOR(N downto 0);
				  CMP : out  STD_LOGIC;
				  Pout : out  STD_LOGIC_VECTOR(N-1 downto 0)
			  );
end PC_DECODER;

architecture Behavioral of PC_DECODER is

	signal source_sig   : STD_LOGIC_VECTOR(N-1 downto 0);
	signal error_found : STD_LOGIC;
 	
begin

	process(Pin)
		variable parity_bit : std_logic;
	begin
		parity_bit := Pin(N-1);
		for i in N-2 downto 0 loop
			parity_bit := parity_bit xor Pin(i);
		end loop;
		
		parity_bit := Pin(N) xor parity_bit;
		
		source_sig <= Pin(N-1 downto 0);
		error_found <= parity_bit;
		
	end process;

	Pout <= source_sig;
	CMP <= error_found;

end Behavioral;

