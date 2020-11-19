----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:15 11/15/2020 
-- Design Name: 
-- Module Name:    SHIFT_REG_STR - Behavioral 
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

entity SHIFT_REG_STR is
	 Generic ( N : integer := 4);
    Port ( SIN  : in   STD_LOGIC;
           SE   : in   STD_LOGIC;
           CLK  : in   STD_LOGIC;
           RES  : in   STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR (N-1 downto 0));
end SHIFT_REG_STR;

architecture Behavioral of SHIFT_REG_STR is

component DFRE is
    Port ( D   : in   STD_LOGIC;
           E   : in   STD_LOGIC;
           CLK : in   STD_LOGIC;
           RES : in   STD_LOGIC;
           Q   : out  STD_LOGIC);
end component;

signal state : STD_LOGIC_VECTOR(N-1 downto 0);

begin

	U0:	DFRE	port map(SIN, SE, CLK, RES, state(0));
	MAIN: for i in 1 to N-1 generate
		Ui:	DFRE	port map(state(i-1), SE, CLK, RES, state(i));
	end generate;
	
	POUT <= state;

end Behavioral;

