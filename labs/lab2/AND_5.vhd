----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:40 09/29/2020 
-- Design Name: 
-- Module Name:    AND_5 - Behavioral 
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

entity AND_5 is
    Port ( A : in  	STD_LOGIC_VECTOR(0 to 4);
           Z : out  	STD_LOGIC);
end AND_5;

architecture Structure of AND_5 is

Component AND_2 
	Port( 
		A,B : in std_logic; 
		Z : out std_logic 
		); 
End Component;

begin

	

end Structure;

