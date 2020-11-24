----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:11:59 11/24/2020 
-- Design Name: 
-- Module Name:    ZBUFF - Behavioral 
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

entity ZBUFF is
	 Generic( N 	: integer := 8 );
    Port ( SIn 	: in   std_logic_vector( N-1 downto 0 );
           S 		: in   std_logic;
           SOut 	: out  std_logic_vector( N-1 downto 0 ));
end ZBUFF;

architecture Behavioral of ZBUFF is

constant allZ : std_logic_vector( N-1 downto 0 ) := (others => 'Z');

begin

	SOut <= SIn when S = '0' else allZ;

end Behavioral;

