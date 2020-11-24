library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity HC_DECODER is
    Port ( 
			  Sin : in  STD_LOGIC_VECTOR(0 to 6);
           Sout : out  STD_LOGIC_VECTOR(0 to 3);
			  ERR : out  STD_LOGIC
		  );
end HC_DECODER;

architecture Behavioral of HC_DECODER is
signal h : STD_LOGIC_VECTOR(0 to 2);


begin

	Main: process(Sin)
		variable tmp_xor1 : STD_LOGIC;
		variable tmp_xor2 : STD_LOGIC;
		variable tmp_xor3 : STD_LOGIC;
		variable bits_xor : STD_LOGIC_VECTOR(0 to 2) := "000";
		variable temp 		: STD_LOGIC_VECTOR(0 to 6);
	begin 
		
		temp := Sin;
		tmp_xor1 := Sin(2) xor Sin(4) xor Sin(6);
		tmp_xor2 := Sin(2) xor Sin(5) xor Sin(6);
		tmp_xor3 := Sin(4) xor Sin(5) xor Sin(6);
			
		bits_xor := Sin(3) & Sin(1) & Sin(0);
		bits_xor := bits_xor xor (tmp_xor3 & tmp_xor2 & tmp_xor1);
		
		if(bits_xor /= "000") then
			temp(to_integer(unsigned(Sin(0 to 2)) - 1)) := temp(to_integer(unsigned(Sin(0 to 2)) - 1)) xor '1';		
			ERR <= '0';
		else 
			temp := temp;
			ERR <= '1';
		end if;
		
		Sout <= temp(2) & temp(4 to 6);
		
	end process;
	
end Behavioral;

