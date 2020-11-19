LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY JONSON_GEN_tb IS
END JONSON_GEN_tb;
 
ARCHITECTURE behavior OF JONSON_GEN_tb IS 
 
 
    COMPONENT JONSON_GEN
    PORT(
         CLK : IN  std_logic;
         RES : IN  std_logic;
         EN : IN  std_logic;
         POUT : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   signal CLK : std_logic := '0';
   signal RES : std_logic := '0';
   signal EN : std_logic := '0';

   signal POUT : std_logic_vector(0 to 3);

   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JONSON_GEN PORT MAP (
          CLK => CLK,
          RES => RES,
          EN => EN,
          POUT => POUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

	RES_proc: process
   begin		
		RES <= '1';
		wait for CLK_period/2;
		RES <= '0';
		wait for 500 ns;
   end process;

   EN_proc: process
   begin		
      EN <= '0';
		wait for CLK_period;
		EN <= '1';
		wait for 200 ns;
   end process;

END;
