----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:48:49 10/02/2020 
-- Design Name: 
-- Module Name:    SUMMATOR - Behavioral 
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

entity SUMMATOR is
    Port ( A  : in  STD_LOGIC;
           B  : in  STD_LOGIC;
			  C  : in  STD_LOGIC;
           Z  : out  STD_LOGIC;
			  CB : out  STD_LOGIC
	  );

end SUMMATOR;

architecture Structural of SUMMATOR is

Component XOR_2

	Port(
		A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		Z : out STD_LOGIC
	);

End Component;

Component AND_2

	Port(
		A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		Z : out STD_LOGIC
	);

End Component;

Component OR_2

	Port(
		A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		Z : out STD_LOGIC
	);

End Component;

signal X : STD_LOGIC;
signal H : STD_LOGIC;
signal N : STD_LOGIC;

begin

	SUMM : XOR_2 port map(A, B, X);	
	CARRY_BIT : AND_2 port map(A, B, H);
	SUMM_WITH_CARRY : XOR_2 port map(X, C, Z);
	CARRY_BIT2: AND_2 port map(C, X, N);
	RES_C_BIT : OR_2	port map(N, H, CB);
			
end Structural;

