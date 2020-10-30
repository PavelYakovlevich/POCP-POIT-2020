----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:52 10/02/2020 
-- Design Name: 
-- Module Name:    SUMMATOR_2 - Behavioral 
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

entity SUMMATOR_2 is
    Port ( A 	: in  STD_LOGIC_VECTOR(1 downto 0);
           B 	: in  STD_LOGIC_VECTOR(1 downto 0);
			  CIN : in  STD_LOGIC;
           Z 	: out STD_LOGIC_VECTOR(1 downto 0);
           C 	: out STD_LOGIC);
end SUMMATOR_2;

architecture Structural of SUMMATOR_2 is

	Component SUMMATOR
		port(
			A  : in  STD_LOGIC;
			B  : in  STD_LOGIC;
			C  : in  STD_LOGIC;
			Z  : out STD_LOGIC;
			CB : out STD_LOGIC
		);
	End Component;

	signal CBIT : STD_LOGIC;
	
begin
	
	SUMM_0: SUMMATOR	port map(A(1), B(1), CIN, Z(1), CBIT);
	SUMM_1: SUMMATOR	port map(A(0), B(0), CBIT, Z(0), C);

end Structural;

