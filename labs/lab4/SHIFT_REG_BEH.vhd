----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:38 11/15/2020 
-- Design Name: 
-- Module Name:    SHIFT_REG_BEH - Behavioral 
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

entity SHIFT_REG_BEH is
	 Generic ( N : integer := 4);
    Port ( SIN : in  STD_LOGIC;
           SE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RES : in  STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR (N-1 downto 0));
end SHIFT_REG_BEH;

architecture Behavioral of SHIFT_REG_BEH is

signal reg_state : STD_LOGIC_VECTOR(N-1 downto 0);

begin
	
	MAIN: process (CLK, SE, RES, SIN)
	begin
		if RES = '1' then	
			for i in 0 to N-1 loop
				reg_state(i) <= '0';
			end loop;
		elsif rising_edge(CLK) then
			if SE = '1' then
				reg_state(0) <= SIN;
				for i in 1 to N-1 loop
					reg_state(i) <= reg_state(i-1);
				end loop;
			end if;
		end if;
	end process;

	POUT <= reg_state;
end Behavioral;

