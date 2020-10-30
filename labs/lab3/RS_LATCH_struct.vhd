----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:24 10/25/2020 
-- Design Name: 
-- Module Name:    RS_LATCH_struct - Behavioral 
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

entity RS_LATCH_struct is
    Port ( R : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end RS_LATCH_struct;

architecture Structural of RS_LATCH_struct is

component NOR2
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end component;

signal  X,Y : STD_LOGIC;

begin

	U1:	NOR2	port map(R, Y, X);
	Q <= X;
	
	U2:	NOR2	port map(S, X, Y);
	nQ <= Y;

end Structural;

