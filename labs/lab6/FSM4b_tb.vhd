LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FSM4b_tb IS
END FSM4b_tb;
 
ARCHITECTURE behavior OF FSM4b_tb IS 
 
    COMPONENT FSM4b
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         IP : IN  std_logic_vector(3 downto 0);
         OP : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;

   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal IP  : std_logic_vector( 3 downto 0 );

   signal OP : std_logic_vector( 1 downto 0 );

   constant CLK_period : time := 10 ns;
 
 	type SIG_ARRAY is array ( 0 to 10 ) of std_logic_vector( 3 downto 0 );
	
	constant values : SIG_ARRAY :=
	( 
		"0001",
		"0010",
		"0011",
		"0010",
		"1111",
		"0100",
		"1111",
		"0101",
		"0100",
		"0011",
		"0011"
	);
 
BEGIN
 
   uut: FSM4b PORT MAP (
          CLK => CLK,
          RST => RST,
          IP => IP,
          OP => OP
        );

   CLK_process :process
   begin
		CLK <= '1';
		wait for CLK_period/2;
		CLK <= '0';
		wait for CLK_period/2;
   end process;
 
   stim_proc: process
		variable id : integer := 0;
   begin		
		for id in 0 to 10 loop
			IP <= values(id);
			wait for CLK_period;
		end loop;
   end process;

END;
