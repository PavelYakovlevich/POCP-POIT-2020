----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:35 11/22/2020 
-- Design Name: 
-- Module Name:    REG_FILE - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REG_FILE is
	 Generic( INITREG :   std_logic_vector := "0000";
				 a			: integer := 2);
    Port (   INIT 	: in   std_logic;
             WDP 		: in   std_logic_vector( INITREG'range );
             WA 		: in   std_logic_vector( a-1 downto 0 );
             RA 		: in   std_logic_vector( a-1 downto 0 );
             WE 		: in   std_logic;
             RDP 		: out  std_logic_vector( INITREG'range ));
end REG_FILE;

architecture Behavioral of REG_FILE is

component REGn is
	Generic 
	(
		INITREG 	: std_logic_vector := "1001"
	);
	Port 
	(
		Din		: in		std_logic_vector( INITREG'range );
		EN			: in		std_logic;
		INIT 		: in   	std_logic;
		CLK 		: in		std_logic;
		OE			: in		std_logic;
		Dout		: out 	std_logic_vector( INITREG'range )
	);
end component;

signal wen		: std_logic_vector( 2**a-1 downto 0 );
signal ren		: std_logic_vector( 2**a-1 downto 0 );
signal readd	: std_logic_vector( INITREG'range );


begin

	WAD: process( WA ) 
	begin
		for i in 0 to 2**a-1 loop
			if i = to_integer(unsigned( WA ) ) then
				wen( i ) <= '1';
			else
				wen( i ) <= '0';
			end if;
		end loop;
	end process;
	
	RAD: process( RA ) 
	begin
		for i in 0 to 2**a-1 loop
			if i = to_integer(unsigned( RA ) ) then
				ren( i ) <= '1';
			else
				ren( i ) <= '0';
			end if;
		end loop;
	end process;
	
	REGi: for i in 2**a-1 downto 0 generate
		REGi: REGn generic map( INITREG )
					  port map	 ( WDP, wen(i), INIT, WE, ren(i), readd );
	end generate;
	
	RDP <= readd;

end Behavioral;

