library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SYNC_REG_STR is
	 Generic ( N : integer := 3);
    Port ( DIN : in  STD_LOGIC_VECTOR(N-1 downto 0);
           EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DOUT : out  STD_LOGIC_VECTOR(N-1 downto 0));
end SYNC_REG_STR;

architecture Behavioral of SYNC_REG_STR is

component SYNC_DE_LATCH
    Port ( D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

begin

	MAIN: for i in 0 to N-1 generate
		Ui: SYNC_DE_LATCH	port map(DIN(i), EN, CLK, DOUT(i));
	end generate;
	
end Behavioral;

