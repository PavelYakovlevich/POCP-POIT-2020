--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:57:22 11/19/2020
-- Design Name:   
-- Module Name:   D:/University/labs/4.1/POCP/labs/lab5/DR_DECODER_tb.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DR_DECODER
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
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DR_DECODER_tb IS
END DR_DECODER_tb;
 
ARCHITECTURE behavior OF DR_DECODER_tb IS 
 
    COMPONENT DR_DECODER
    PORT(
         Sin : IN  std_logic_vector(7 downto 0);
         RC : OUT  std_logic;
         Sout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT DR_CODER
    Port ( Sin : in  STD_LOGIC_VECTOR(3 downto 0);
           Sout : out  STD_LOGIC_VECTOR(7 downto 0)
		  );
	 end COMPONENT;
	 
	 COMPONENT ZBUFF 
		 Generic( N 	: integer := 8 );
		 Port ( SIn 	: in   std_logic_vector( N-1 downto 0 );
				  S 		: in   std_logic;
				  SOut 	: out  std_logic_vector( N-1 downto 0 ));
	 end COMPONENT;
    

   signal Sin  : std_logic_vector(3 downto 0) := (others => '0');

   signal RC   : std_logic;
   signal Sout : std_logic_vector(3 downto 0);
	
	signal tmp_coder_output : std_logic_vector(7 downto 0);
	
	constant error_code : std_logic_vector := "11001110";
	signal error_appeared : std_logic := '0';
	signal signal_merge: std_logic_vector(7 downto 0);
 
BEGIN
	uut1: DR_CODER PORT MAP (
	  Sin,
	  tmp_coder_output
   );
	
	uut3: ZBUFF port map (
		tmp_coder_output,
		error_appeared,
		signal_merge
	);
	
	uut4: ZBUFF port map (
		error_code,
		not error_appeared,
		signal_merge
	);
	
	uut2: DR_DECODER PORT MAP (
          signal_merge,
          RC,
          Sout
   );
	
	error_proc: process
	begin
		wait for 100 ns;
		error_appeared <= not error_appeared;
		wait for 3 ns;
		error_appeared <= not error_appeared;
	end process;
	
	stim_proc1: process
   begin
		if error_appeared = '0' then
			Sin <= Sin + 1;
			wait for 20 ns;
		end if;
		
   end process;
	
	

END;
