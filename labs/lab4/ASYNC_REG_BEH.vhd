library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ASYNC_REG_BEH is
	 Generic( N  : integer := 4); 
    Port ( DIN  : in  STD_LOGIC_VECTOR (N-1 downto 0);
           EN   : in  STD_LOGIC;
           DOUT : out STD_LOGIC_VECTOR (N-1 downto 0));
end ASYNC_REG_BEH;

architecture Behavioral of ASYNC_REG_BEH is

signal S : std_logic_vector(N-1  downto 0);

begin

	process (DIN, EN)
	begin
		if EN = '1' then
			S <= DIN;
		end if;
	end process;
	
	DOUT <= S;

end Behavioral;

