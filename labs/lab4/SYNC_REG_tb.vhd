LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SYNC_REG_tb IS
END SYNC_REG_tb;
 
ARCHITECTURE behavior OF SYNC_REG_tb IS 
 
    COMPONENT SYNC_REG_BEH
    PORT(
         DIN : IN  std_logic_vector(2 downto 0);
         EN : IN  std_logic;
         CLK : IN  std_logic;
         DOUT : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DIN : std_logic_vector(2 downto 0) := (others => '0');
   signal EN : std_logic := '0';
   signal CLK : std_logic := '0';

   signal DOUT : std_logic_vector(2 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SYNC_REG_BEH PORT MAP (
          DIN => DIN,
          EN => EN,
          CLK => CLK,
          DOUT => DOUT
        );

   CLK_process :process
   begin
		wait for 100 ns;
		CLK <= NOT(CLK);
   end process;
	
	E_stim_proc: process
   begin		
		wait for 150 ns;
		EN <= NOT(EN);
   end process;
	
	DIN(0) <= NOT(DIN(0)) after 10 ns;		
	DIN(1) <= NOT(DIN(1)) after 20 ns;
	DIN(2) <= NOT(DIN(2)) after 30 ns;

END;
