LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
 
ENTITY FSM2_tb IS
END FSM2_tb;
 
ARCHITECTURE behavior OF FSM2_tb IS 
 
    COMPONENT FSM2
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         IP : IN  std_logic_vector(3 downto 0);
         OP : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal IP : std_logic_vector(3 downto 0) := (others => '0');

   signal OP : std_logic_vector(1 downto 0);

   constant CLK_period : time := 10 ns;
	
	type SIG_ARRAY is array ( 0 to 6 ) of std_logic_vector( 3 downto 0 );
	
	constant values : SIG_ARRAY :=
	( 
		"0000",
		"0001",
		"0010",
		"0001",
		"0001",
		"0001",
		"0100"
	);
	
BEGIN
 
   uut: FSM2 PORT MAP (
          CLK => CLK,
          RST => RST,
          IP => IP,
          OP => OP
        );

   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   IP_proc: process
		variable id : integer := 0;
   begin		
		for id in 0 to 3 loop
			IP <= values(id);
			wait for 15 ns;	
		end loop;
		RST <= '1';
		wait for 5 ns;
		RST <= '0';
		for id in 4 to 6 loop
			IP <= values(id);
			wait for 15 ns;	
		end loop;
   end process;

END;
