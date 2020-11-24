library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity RAM_WHC is
    Generic
	 (
				M 		   : integer := 2;
				N			: integer := 8
	 );
    Port 
	 ( 
				WR 		: in  	std_logic;
				AB 		: in  	std_logic_vector( m-1 downto 0 );
				CLK 		: in  	std_logic;
				ERR		: out    std_logic;
				DB 		: inout  std_logic_vector( 0 to n-1 + 4 )
	  );
end RAM_WHC;

architecture Behavioral of RAM_WHC is

subtype word	is	std_logic_vector( n-1 downto 0 );
type 	  tram	is array ( 0 to 2**m-1 ) of word;

signal  sRAM	:	tram;
signal  adrreg :	integer range 0 to 2**m-1;

begin

	adrreg <= to_integer( unsigned( AB ) );
	
	WDP:	process( WR, CLK, adrreg, DB )
		variable tmp_xor1 : STD_LOGIC;
		variable tmp_xor2 : STD_LOGIC;
		variable tmp_xor3 : STD_LOGIC;
		variable tmp_xor4 : STD_LOGIC;
		variable bits_xor : STD_LOGIC_VECTOR(0 to 3) := (others => '0');
		variable temp 		: STD_LOGIC_VECTOR(0 to 11);
	begin
		if WR = '0' then
			if rising_edge( CLK ) then
				tmp_xor1 := DB(0) xor DB(1) xor DB(3) xor DB(5) xor DB(6);
				tmp_xor2 :=	DB(0) xor DB(2) xor DB(3) xor DB(5) xor DB(6);
				tmp_xor3 := DB(1) xor DB(2) xor DB(3) xor DB(7);
				tmp_xor4 := DB(4) xor DB(5) xor DB(6) xor DB(7);
					
				bits_xor := DB(7) & DB(3) & DB(1) & DB(0);
				bits_xor := bits_xor xor (tmp_xor4 & tmp_xor3 & tmp_xor2 & tmp_xor1);
				
				if(bits_xor /= "0000") then
					temp(to_integer(unsigned(bits_xor)) - 1) := temp(to_integer(unsigned(bits_xor)) - 1) xor '1';		
					ERR <= '0';
				else 
					temp := temp;
					ERR <= '1';
				end if;
				sRAM( adrreg ) <= temp(2) & temp(4 to 6) & temp(8 to 11);
			end if;
		end if;
	end process;
	
	RDP: process( WR, sRAM, adrreg )
	variable tmp: std_logic_vector( 0 to n-1 );
	variable tmp2: std_logic_vector( 0 to n-1 + 4) := (others => 'Z');
	variable tmp_xor1 : STD_LOGIC;
	variable tmp_xor2 : STD_LOGIC;
	variable tmp_xor3 : STD_LOGIC;
	variable tmp_xor4 : STD_LOGIC;
	begin
		if WR = '1' then
			tmp := sRAM( adrreg );
			tmp_xor1 := tmp(0) xor tmp(1) xor tmp(3) xor tmp(5) xor tmp(6);
			tmp_xor2 :=	tmp(0) xor tmp(2) xor tmp(3) xor tmp(5) xor tmp(6);
			tmp_xor3 := tmp(1) xor tmp(2) xor tmp(3) xor tmp(7);
			tmp_xor4 := tmp(4) xor tmp(5) xor tmp(6) xor tmp(7);
			tmp2 := tmp_xor1 & tmp_xor2 & tmp(0) & tmp_xor3 & tmp(1 to 3) & tmp_xor4 & tmp(5 to 7);
			DB <= tmp2;
		else
			DB <= (others => 'Z');
		end if;
	end process;

end Behavioral;

