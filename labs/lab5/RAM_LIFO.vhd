library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;

entity RAM_LIFO is
     Generic
	 (
				M 		   : integer := 2;
				N			: integer := 8
	 );
    Port 
	 ( 
				WR 		: in  	std_logic;
				CLK 		: in  	std_logic;
				POP      : in 		std_logic;
ACT1		: out		std_logic_vector (0 to 2**m-1);
				DB 		: inout  std_logic_vector(  0 to n-1 )
	  );
end RAM_LIFO;

architecture Behavioral of RAM_LIFO is

subtype word	is	std_logic_vector( n-1 downto 0 );
type 	  tram	is array ( 0 to 2**m-1 ) of word;

signal  sRAM	:	tram;
signal  adrreg 	 :	integer range 0 to 2**m-1 := 0;
begin
	
	stack_p: process(CLK, sRAM, DB, POP)
	begin
		if WR = '0' then
			if rising_edge(CLK) then
				if adrreg < 2**m-1 then
					adrreg <= adrreg + 1;
				end if;
			end if;
		else
			if rising_edge(CLK) then
				if POP = '1' then
					if adrreg > 0 then
						adrreg <= adrreg - 1;
					end if;
				end if;
			end if;
		end if;
	end process;

	WDP:	process( WR, CLK, adrreg, DB )
	begin
		if WR = '0' then
			if rising_edge( CLK ) then
				sRAM( adrreg ) <= DB;	
			end if;
		end if;
	end process;
	
	RDP: process( WR, sRAM, adrreg)
	begin
		if WR = '1' then
			DB <= sRAM( adrreg );
		else
			DB <= (others => 'Z');
		end if;
	end process;
	
	ACT1 <= std_logic_vector(to_unsigned(adrreg, 4));

end Behavioral;

