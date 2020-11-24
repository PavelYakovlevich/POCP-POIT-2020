library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity RAM is
    Generic
	 (
				M 		   : integer := 2;
				N			: integer := 2
	 );
    Port 
	 ( 
				WR 		: in  	std_logic;
				AB 		: in  	std_logic_vector( m-1 downto 0 );
				CLK 		: in  	std_logic;
				DB 		: inout  std_logic_vector( n-1 downto 0 )
	  );
end RAM;

architecture Beh of RAM is

subtype word	is	std_logic_vector( n-1 downto 0 );
type 	  tram	is array ( 0 to 2**m-1 ) of word;

signal  sRAM	:	tram;
signal  adrreg :	integer range 0 to 2**m-1;

begin

	adrreg <= to_integer( unsigned( AB ) );
	
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
	
end Beh;

