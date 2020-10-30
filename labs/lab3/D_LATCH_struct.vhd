----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:30 10/25/2020 
-- Design Name: 
-- Module Name:    D_LATCH_struct - Behavioral 
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

entity D_LATCH_struct is
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end D_LATCH_struct;

architecture Structural of D_LATCH_struct is

component NOR2
    Port ( 
		A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		Z : out  STD_LOGIC
	 );
end component;

component INV1
        Port ( 
				X : in  STD_LOGIC;
            Z : out  STD_LOGIC
			);
end component;

signal X, Y : STD_LOGIC;
signal nD : STD_LOGIC;

begin
	U0:	INV1	port map(D, nD);
	
	U1:	NOR2	port map(nD, Y, X);
	Q <= X;
	
	U2:	NOR2	port map(D, X, Y);
	nQ <= Y;	
end Structural;

