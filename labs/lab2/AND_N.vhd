----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:30:21 10/02/2020 
-- Design Name: 
-- Module Name:    AND_N - Behavioral 
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

entity AND_N is
	 GENERIC(N: integer := 5);
    Port ( 
		A : in  STD_LOGIC_VECTOR(N-1 downto 0);	
		Z : out STD_LOGIC
	 );
end AND_N;

architecture Structural of AND_N is

Component AND_2
	Port(
		A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		Z : out STD_LOGIC 
	);
End Component;

signal X : STD_LOGIC_VECTOR(N-2 downto 0); 

begin

	GEN_0: AND_2 port map(A(0), A(1), X(0));
	SCH: FOR i in 1 to N-2 GENERATE
		GEN_I: AND_2 port map(A(i+1), X(i-1), X(i));
	End GENERATE;

	Z <= X(N-2);
end Structural;

