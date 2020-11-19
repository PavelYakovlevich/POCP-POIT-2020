----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:23:38 11/19/2020 
-- Design Name: 
-- Module Name:    BIN_COUNTER - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BIN_COUNTER is
	 Generic(N : integer := 3);
    Port ( RES : in  STD_LOGIC;
			  CLK : in  STD_LOGIC;
           Pout : out  STD_LOGIC_VECTOR(0 to N-1));
end BIN_COUNTER;

architecture Behavioral of BIN_COUNTER is

signal state : STD_LOGIC_VECTOR(0 to N-1);

begin

	Main: process(RES, CLK)
	begin 
		if  RES = '1' then
			state <= (others => '0');
		elsif falling_edge(CLK) then
			state <= state + 1;
		end if;
	end process;
	
	Pout <= state;
	
end Behavioral;

