-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use ieee.std_logic_unsigned.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

	 COMPONENT REG_FILE
			 Generic
			 ( 
						 INITREG :   std_logic_vector := "0000";
						 a			: integer := 2
			 );
			 Port 
			 (   
						 INIT 	: in   std_logic;
						 WDP 		: in   std_logic_vector( INITREG'range );
						 WA 		: in   std_logic_vector( a-1 downto 0 );
						 RA 		: in   std_logic_vector( a-1 downto 0 );
						 WE 		: in   std_logic;
						 RDP 		: out  std_logic_vector( INITREG'range )
			 );
	 END COMPONENT;

	 signal INIT 	: std_logic := '0';
	 signal WDP 	: std_logic_vector( 3 downto 0 ) := (others => '0');
	 signal WA 		: std_logic_vector( 1 downto 0 ) := (others => '0');
	 signal RA 		: std_logic_vector( 1 downto 0 ) := (others => '0');
	 signal WE 		: std_logic := '0';
	 signal RDP 	: std_logic_vector( 3 downto 0 ) := (others => '0');

  BEGIN

	 uut: REG_FILE PORT MAP(
				INIT,
				WDP,
				WA,
				RA,
				WE,
				RDP
	 );

     INIT_proc: PROCESS
     BEGIN
		  INIT <= '1';
		  wait for 3 ns;
		  INIT <= '0';
        wait for 10000 ns;
     END PROCESS;
	  
	  WDP_proc: PROCESS
     BEGIN
			for i in 1 downto 0 loop
				WDP <= WDP + 1;
				wait for 25 ns;
			end loop;
     END PROCESS;
	  
	  WA_proc: PROCESS
     BEGIN
		  for i in 1 downto 0 loop
			 WA <= WA + 1;
			 wait for 25 ns;
		  end loop;
		  
	  END PROCESS;
	  
	  RA_proc : PROCESS
     BEGIN
			for i in 1 downto 0 loop
				RA <= RA + 1;
				wait for 25 ns;
			end loop;
     END PROCESS;
	  
	  WE_proc : PROCESS
     BEGIN
		  WE <= not WE;
        wait for 5 ns;
     END PROCESS;

  END;
