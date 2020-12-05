LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY FSM3b_tb IS
END FSM3b_tb;
 
ARCHITECTURE behavior OF FSM3b_tb IS 
 

    COMPONENT FSM3b
	 Port 
	 ( 	
			  CLK : in   std_logic;
           RST : in   std_logic;
           IP 	: in   std_logic_vector( 3 downto 0 );
           OP  : out  std_logic_vector( 1 downto 0 )
	 );
    END COMPONENT;

   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal IP  : std_logic_vector( 3 downto 0 );

   signal OP : std_logic_vector( 1 downto 0 );

   constant CLK_period : time := 10 ns;
 
 	type SIG_ARRAY is array ( 0 to 6 ) of std_logic_vector( 3 downto 0 );
	
	constant values : SIG_ARRAY :=
	( 
		"0000",
		"0001",
		"0010",
		"0100",
		"1111",
		"0101",
		"0111"
	);
 
BEGIN
 
   uut: FSM3b PORT MAP (
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
		for id in 0 to 6 loop
			IP <= values(id);
			wait for CLK_period/2;
			RST <= '1';
			wait for CLK_period/2;
			RST <= '0';
		end loop;
   end process;

END;
