library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ASYNC_REG_STR is
	 Generic(N : integer := 5);
    Port ( DIN  : in   STD_LOGIC_VECTOR(N-1 downto 0);
           EN   : in   STD_LOGIC;
           DOUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end ASYNC_REG_STR;

architecture Structural of ASYNC_REG_STR is

component DE_LATCH
	 Port ( D    : in   STD_LOGIC;
			  EN   : in   STD_LOGIC;
           Q    : out  STD_LOGIC);
end component;

begin

	MAIN: for i in N-1 downto 0 generate
		Ui:	DE_LATCH port map (DIN(i), EN, DOUT(i));
	end generate;

end Structural;

