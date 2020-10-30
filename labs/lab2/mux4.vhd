----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:56 09/29/2020 
-- Design Name: 
-- Module Name:    mux4 - Behavioral 
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

entity mux4 is
    Port ( A 	: in  STD_LOGIC;
           B 	: in  STD_LOGIC;
           A1 	: in  STD_LOGIC;
           B1 	: in  STD_LOGIC;
           S 	: in  STD_LOGIC;
           Z 	: out STD_LOGIC;
           Z1 	: out STD_LOGIC
	  );
end mux4;

architecture Behavioral of mux4 is

Component mux
	Port(
		A	: in 	std_logic;
		B	: in 	std_logic;
		S	: in 	std_logic;
		Z	: out std_logic
	);
end Component;



begin

	U1: mux port map(A, B, S, Z);
	U2: mux port map(A1, B1, S, Z1);
	
end Behavioral;

