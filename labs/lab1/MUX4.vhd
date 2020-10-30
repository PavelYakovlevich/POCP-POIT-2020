----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:52 09/14/2020 
-- Design Name: 
-- Module Name:    MUX4 - Behavioral 
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

entity MUX4 is
    Port ( A : in  STD_LOGIC_VECTOR(0 to 1);
           B : in  STD_LOGIC_VECTOR(0 to 1);
           S : in  STD_LOGIC;
           Z : out STD_LOGIC_VECTOR(0 to 1));
end MUX4;

architecture Behavioral of MUX4 is

begin

Z <= A when S = '0' else B;

end Behavioral;

