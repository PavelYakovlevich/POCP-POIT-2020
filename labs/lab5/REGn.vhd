----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:16 11/22/2020 
-- Design Name: 
-- Module Name:    REGn - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REGn is
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
end REGn;

architecture Behavioral of REGn is

signal reg		: std_logic_vector( INITREG'range );
constant ALLZ	: std_logic_vector( INITREG'range ) := (others => 'Z');

begin

	Main: process(Din, EN, INIT, CLK)
	begin 
		if INIT = '1' then
			reg <= INITREG;
		elsif EN = '1' then
			if rising_edge(CLK) then
				reg <= Din;
			end if;
		end if;
	end process;
	
	Dout <= reg when OE = '1' else ALLZ;

end Behavioral;

