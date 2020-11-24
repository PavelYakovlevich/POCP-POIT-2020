LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;

ENTITY PC_CODER_DECORE_tb IS
END PC_CODER_DECORE_tb;
 
ARCHITECTURE behavior OF PC_CODER_DECORE_tb IS 
 
    COMPONENT PC_DECODER
    PORT(
         Pin : IN  std_logic_vector(4 downto 0);
         CMP : OUT  std_logic;
         Pout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT PC_CODER 	
		 Generic (N : integer := 4);
		 Port ( Pin : in  STD_LOGIC_VECTOR(N-1 downto 0);
				  Pout : out  STD_LOGIC_VECTOR(N downto 0));
	 end COMPONENT;
	 
	 COMPONENT ZBUFF 
		 Generic( N 	: integer := 5 );
		 Port ( SIn 	: in   std_logic_vector( N-1 downto 0 );
				  S 		: in   std_logic;
				  SOut 	: out  std_logic_vector( N-1 downto 0 ));
	 end COMPONENT;

   --Inputs
   signal Pin : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal CMP : std_logic;
   signal Pout : std_logic_vector(3 downto 0);
	
	
	signal error_signal : std_logic_vector(4 downto 0) := "10000";
 
	
	constant error_code : std_logic_vector := "10000";
	signal error_appeared : std_logic := '0';
	signal signal_merge: std_logic_vector(4 downto 0);
	signal coder_out : STD_LOGIC_VECTOR(4 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	 uut1: PC_CODER PORT MAP (
          Pin => Pin,
          Pout => coder_out
        );

	uut3: ZBUFF port map (
		coder_out,
		error_appeared,
		signal_merge
	);
	
	uut4: ZBUFF port map (
		error_code,
		not error_appeared,
		signal_merge
	);
	
   uut2: PC_DECODER PORT MAP (
          Pin => signal_merge,
          CMP => CMP,
          Pout => Pout
        );

	error_proc: process
	begin
		wait for 100 ns;
		error_appeared <= not error_appeared;
		wait for 10 ns;
		error_appeared <= not error_appeared;
	end process;
	
	stim_proc1: process
   begin
		if error_appeared = '0' then
			Pin <= Pin + 1;
			wait for 20 ns;
		end if;
		
   end process;

END;
