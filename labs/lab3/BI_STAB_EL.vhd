----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:11 10/25/2020 
-- Design Name: 
-- Module Name:    BI_STAB_EL - Behavioral 
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

entity BI_STAB_EL is
    Port ( 
		I	: in	 STD_LOGIC;
		Q  : out  STD_LOGIC;
		nQ : out  STD_LOGIC
	 );
end BI_STAB_EL;



architecture Behavioral of BI_STAB_EL is	
begin

	process (I)
	begin
		if I = '1' then
			Q <= NOT(I);
			nQ <= I;
		elsif I = '0' then
			Q <= I;
			nQ <= NOT(I);
	end if;
	
end process;


end Behavioral;

