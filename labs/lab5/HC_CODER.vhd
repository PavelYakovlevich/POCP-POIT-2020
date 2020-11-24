
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HC_CODER is
    Port ( Sin : in  STD_LOGIC_VECTOR(0 to 3);
           Sout : out  STD_LOGIC_VECTOR(0 to 6)
			);
end HC_CODER;

architecture Behavioral of HC_CODER is

signal tmp_xor1 : STD_LOGIC;
signal tmp_xor2 : STD_LOGIC;
signal tmp_xor3 : STD_LOGIC;
 
begin

	tmp_xor1 <= Sin(0) xor Sin(1) xor Sin(3);
	tmp_xor2 <= Sin(0) xor Sin(2) xor Sin(3);
	tmp_xor3 <= Sin(1) xor Sin(2) xor Sin(3);

	Sout <= tmp_xor1 & tmp_xor2 & Sin(0) & tmp_xor3 & Sin(1 to 3);

end Behavioral;

