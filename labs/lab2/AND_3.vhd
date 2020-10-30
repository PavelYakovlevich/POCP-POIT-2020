----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:39:27 09/29/2020 
-- Design Name: 
-- Module Name:    AND_3 - Behavioral 
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

entity AND_3 is
    Port ( A : in  	STD_LOGIC;
           B : in  	STD_LOGIC;
           C : in  	STD_LOGIC;
           Z : out  	STD_LOGIC);
end AND_3;

architecture Behavioral of AND_3 is

begin

	Z <= A AND B AND C;
	
end Behavioral;

