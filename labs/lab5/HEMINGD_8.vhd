----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:32:02 11/23/2020 
-- Design Name: 
-- Module Name:    HEMINGD_8 - Behavioral 
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
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HEMINGD_8 is
    Port ( Pin 	: in  	STD_LOGIC_VECTOR(0 to 11);
				ERR 	: out 	STD_LOGIC;
           Pout 	: out  	STD_LOGIC_VECTOR(0 to 7));
end HEMINGD_8;

architecture Behavioral of HEMINGD_8 is

begin

	Main: process(Pin)
		variable tmp_xor1 : STD_LOGIC;
		variable tmp_xor2 : STD_LOGIC;
		variable tmp_xor3 : STD_LOGIC;
		variable tmp_xor4 : STD_LOGIC;
		variable bits_xor : STD_LOGIC_VECTOR(0 to 3) := (others => '0');
		variable temp 		: STD_LOGIC_VECTOR(0 to 11);
	begin 
		
		tmp_xor1 := Pin(0) xor Pin(1) xor Pin(3) xor Pin(5) xor Pin(6);
		tmp_xor2 :=	Pin(0) xor Pin(2) xor Pin(3) xor Pin(5) xor Pin(6);
		tmp_xor3 := Pin(1) xor Pin(2) xor Pin(3) xor Pin(7);
		tmp_xor4 := Pin(4) xor Pin(5) xor Pin(6) xor Pin(7);
			
		bits_xor := Pin(7) & Pin(3) & Pin(1) & Pin(0);
		bits_xor := bits_xor xor (tmp_xor4 & tmp_xor3 & tmp_xor2 & tmp_xor1);
		
		if(bits_xor /= "0000") then
			temp(to_integer(unsigned(bits_xor)) - 1) := temp(to_integer(unsigned(bits_xor)) - 1) xor '1';		
			ERR <= '0';
		else 
			temp := temp;
			ERR <= '1';
		end if;
		
		Pout <= temp(2) & temp(4 to 6) & temp(8 to 11);
		
	end process;


end Behavioral;

