----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:08:10 10/27/2020 
-- Design Name: 
-- Module Name:    D_LATCH_param - Behavioral 
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

entity D_LATCH_param is
    Port ( D : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_LATCH_param;

architecture Param of D_LATCH_param is

begin

	process (D)
	begin
		if D = '1' or D = '0' then
			Q  <= D after 10ns;
			nQ <= transport NOT(D) after 20ns;
		end if;
	end process;

end Param;

