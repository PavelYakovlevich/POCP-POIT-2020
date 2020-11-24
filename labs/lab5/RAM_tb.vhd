-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  USE ieee.std_logic_unsigned.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

	component RAM is
		 Generic
		 (
					M 		   : integer := 2;
					N			: integer := 2
		 );
		 Port 
		 ( 
					WR 		: in  	std_logic;
					AB 		: in  	std_logic_vector( m-1 downto 0 );
					CLK 		: in  	std_logic;
					DB 		: inout  std_logic_vector( n-1 downto 0 )
		  );
	end component;
          
	signal WR 		: std_logic := '0';
	signal AB 		: std_logic_vector( 1 downto 0 ) := (others => '0');
	signal CLK 		: std_logic := '1';
	signal DB 		: std_logic_vector( 1 downto 0 ) := (others => '0');

  BEGIN
  
	 uut: RAM 
	 PORT MAP
	 (
			WR,
			AB,
			CLK,
			DB
	 );
	 
	 clk_proc: process
	 begin 
		CLK <= not CLK;
		wait for 5 ns;
	 end process;

    stim_proc: process
	 begin
		WR <= '0';
		AB <= (others => '0');
		for i in 7 downto 0 loop
			DB <= DB - 1;
			AB <= AB + 1;
			wait for 20 ns;
		end loop;
		
		WR <= '1';
		DB <= (others => 'Z');
		AB <= (others => '0');
		for i in 7 downto 0 loop
			AB <= AB + 1;
			wait for 20 ns;
		end loop;
	 end process;
	  
  END;
