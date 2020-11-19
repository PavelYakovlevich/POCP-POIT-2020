LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SHIFT_REG_STR_tb IS
END SHIFT_REG_STR_tb;
 
ARCHITECTURE behavior OF SHIFT_REG_STR_tb IS 
 

    COMPONENT SHIFT_REG_STR
    PORT(
         SIN : IN  std_logic;
         SE : IN  std_logic;
         CLK : IN  std_logic;
         RES : IN  std_logic;
         POUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   signal SIN : std_logic := '0';
   signal SE : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RES : std_logic := '0';

   signal POUT : std_logic_vector(3 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SHIFT_REG_STR PORT MAP (
          SIN => SIN,
          SE => SE,
          CLK => CLK,
          RES => RES,
          POUT => POUT
        );

   CLK_process :process
   begin
		wait for 50 ns;
		CLK <= NOT(CLK);
   end process;
	
	SIN_stim_proc: process
   begin		
		SIN <= NOT(SIN);
      wait for 100 ns;	
   end process;
	
   SE_stim_proc: process
   begin		
      wait for 200 ns;	
		SE <= NOT(SE);
   end process;
	
	RES_stim_proc: process
   begin		
      wait for 150 ns;	
		RES <= NOT(RES);
   end process;

END;
