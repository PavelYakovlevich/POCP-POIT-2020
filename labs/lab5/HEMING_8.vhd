library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HEMING_8 is
    Port ( Pin 	: in  	STD_LOGIC_VECTOR(0 to 7);
           Pout 	: out  	STD_LOGIC_VECTOR(0 to 11));
end HEMING_8;

architecture Behavioral of HEMING_8 is

signal tmp_xor1 : STD_LOGIC;
signal tmp_xor2 : STD_LOGIC;
signal tmp_xor3 : STD_LOGIC;
signal tmp_xor4 : STD_LOGIC;
constant all_z	 : STD_LOGIC_VECTOR(0 to 7) := (others => 'Z');

begin

	Main: process(Pin)
	begin
		tmp_xor1 <= Pin(0) xor Pin(1) xor Pin(3) xor Pin(5) xor Pin(6);
		tmp_xor2 <=	Pin(0) xor Pin(2) xor Pin(3) xor Pin(5) xor Pin(6);
		tmp_xor3 <= Pin(1) xor Pin(2) xor Pin(3) xor Pin(7);
		tmp_xor4 <= Pin(4) xor Pin(5) xor Pin(6) xor Pin(7);
		Pout <= tmp_xor1 & tmp_xor2 & Pin(0) & tmp_xor3 & Pin(1 to 3) & tmp_xor4 & Pin(4 to 7);
	end process;
end Behavioral;

