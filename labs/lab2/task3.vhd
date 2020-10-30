----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:35 09/29/2020 
-- Design Name: 
-- Module Name:    task3 - Behavioral 
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

entity task3 is
    Port ( W : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           G : out  STD_LOGIC
			  );
end task3;

architecture Behavioral of task3 is

	component AND_3
		port(
			A : in	STD_LOGIC;
			B : in	STD_LOGIC;
			C : in	STD_LOGIC;
			Z : out	STD_LOGIC
		);
	end Component;
	
	component AND_2
		port(
			A : in	STD_LOGIC;
			B : in	STD_LOGIC;
			Z : out	STD_LOGIC
		);
	end Component;
	
	component OR_2
		port(
			A : in	STD_LOGIC;
			B : in	STD_LOGIC;
			Z : out	STD_LOGIC
		);
	end Component;

signal RES1: STD_LOGIC;
signal RES2: STD_LOGIC;

begin

	U1: AND_3	port map(W, X, Y, RES1);
	U2: AND_2	port map(Y, Z, RES2);
	U3: OR_2		port map(RES1, RES2, G);

end Behavioral;

