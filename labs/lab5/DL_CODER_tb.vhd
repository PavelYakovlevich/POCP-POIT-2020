--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:23:22 11/24/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab5/DL_CODER_tb.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DR_CODER
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DL_CODER_tb IS
END DL_CODER_tb;
 
ARCHITECTURE behavior OF DL_CODER_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DR_CODER
    PORT(
         Sin : IN  std_logic_vector(3 downto 0);
         Sout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT DR_DECODER
    PORT(
         Sin : IN  std_logic_vector(7 downto 0);
         RC : OUT  std_logic;
         Sout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sin : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Sout : std_logic_vector(7 downto 0);
	constant test_words: words_array := ("101", "111", "001", "010");		
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DR_CODER PORT MAP (
          Sin => Sin,
          Sout => Sout
        );

   stim_proc1: process
   begin
		for i in 0 to tests_count-1 loop
			data_in_encoder <= test_words(i);
			wait for period;
			--if i mod 2 = 0 then
				--data_in_encoder <= test_words(i);
			--else
				--encoded_out <= test_words_dec(i);
			--end if;
				--wait for period;
		end loop;
   end process;

	-- Instantiate the Unit Under Test (UUT)
   uut2: SimpleDecoder PORT MAP (
          data_in => encoded_out,
          decoded_out => decoded_out,
			 error => error
        );

END;
