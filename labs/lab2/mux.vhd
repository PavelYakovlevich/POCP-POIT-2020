----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:49:51 09/29/2020 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end mux;

architecture Structural of mux is

Component INV1
	Port(
		A	: in 	std_logic;
		Z	: out std_logic
	);

end Component;

Component AND_2
	Port(
		A	: in 	std_logic;
		B	: in 	std_logic;
		Z	: out std_logic
	);
	
end Component;

Component OR_2
	Port(
		A	: in 	std_logic;
		B	: in 	std_logic;
		Z	: out std_logic
	);
	
end Component;

signal 	X: 	std_logic;
signal	Y:		std_logic;
signal	Z2:	std_logic;

begin
				U1: INV1		port map(S, X);
				U2: AND_2	port map(A,	X, Y);
				U3: AND_2 	port map(S, B, Z2);
				U4: OR_2		port map(Y, Z2, Z);

end Structural;

