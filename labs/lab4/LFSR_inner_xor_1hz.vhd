----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:19:01 11/17/2020 
-- Design Name: 
-- Module Name:    LFSR_inner_xor_1hz - Behavioral 
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

entity LFSR_inner_xor_1hz is
    Generic( alpha : STD_LOGIC_VECTOR := "1100101");
    Port ( CLK     : in  STD_LOGIC;
			  RES     : in  STD_LOGIC;
			  POUT    : out STD_LOGIC_VECTOR (0 to alpha'high - 1));
end LFSR_inner_xor_1hz;

architecture Behavioral of LFSR_inner_xor_1hz is

signal sState : STD_LOGIC_VECTOR (0 to alpha'high - 1);
signal sData  : STD_LOGIC_VECTOR (0 to alpha'high - 1);
signal count  : integer := 1;
signal tmp    : std_logic := '1';

begin
	
	Data: process(sState)
		variable zero : STD_LOGIC;
	begin  
	
		zero := '0';
		for i in alpha'high-1 downto 1 loop
			if alpha(i) = '1' then
				sData(i) <= sState(alpha'high-1) xor sState(i-1);
			else
				sData(i) <= sState(i-1);
			end if;
		   zero := sState(i) or zero;
		end loop;
		
		zero := not zero;
		sData(0) <= zero xor sState(alpha'high-1);
		
	end process;
	
	POUT <= sState;
	
	TIMER: process(CLK, RES)
	begin
	
		if RES = '1' then
			count <= 1;
			tmp <= '0';
			sState <= (others => '0');
		elsif rising_edge(CLK) then
			count <= count + 1;
			if (count = 50000000) then
				sState <= sData;
				tmp <= not tmp;
				count <= 1;
			end if;
		end if;
		
	end process;
	
end Behavioral;

