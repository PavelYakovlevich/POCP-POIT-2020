----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:14 09/29/2020 
-- Design Name: 
-- Module Name:    demux - Behavioral 
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

entity demux is
    Port ( 
				s : in  std_logic;
				x : in  std_logic_vector(1 downto 0);
				z : out std_logic_vector(3 downto 0)
	  );
end demux;

architecture Behavioral of demux is

begin
   
	z <=
    "000" & s      when x = "00" else
    "00" & s & '0' when x = "01" else
    '0' & s & "00" when x = "10" else
    s & "000"      when x = "11" else
    "0000";
	 
	 

end Behavioral;

