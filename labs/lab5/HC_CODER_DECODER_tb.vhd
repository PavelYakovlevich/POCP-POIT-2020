LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
 
ENTITY HC_CODER_DECODER_tb IS
END HC_CODER_DECODER_tb;
 
ARCHITECTURE behavior OF HC_CODER_DECODER_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HC_DECODER
    PORT(
         Sin : IN  std_logic_vector(0 to 6);
         Sout : OUT  std_logic_vector(0 to 3);
         ERR : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT HC_CODER is
    Port ( Sin : in  std_logic_vector(0 to 3);
           Sout : out  std_logic_vector(0 to 6)
			);
	 end COMPONENT;
	 
	 COMPONENT ZBUFF 
		 Generic( N 	: integer := 7 );
		 Port ( SIn 	: in   std_logic_vector( N-1 downto 0 );
				  S 		: in   std_logic;
				  SOut 	: out  std_logic_vector( N-1 downto 0 ));
	 end COMPONENT;
    

   --Inputs
   signal Sin : std_logic_vector(0 to 3) := (others => '0');
	

 	--Outputs
   signal Sout : std_logic_vector(0 to 3);
	signal ERR : std_logic;
 
	constant error_code : std_logic_vector := "1100010";
	signal error_appeared : std_logic := '0';
	signal signal_merge: std_logic_vector(0 to 6) := (others => '0');
	signal coder_out : std_logic_vector(0 to 6) := (others => '0');
	signal temp12 : std_logic_vector(0 to 2);
BEGIN
 
	 uut1: HC_CODER PORT MAP (
          Sin => Sin,
          Sout => coder_out
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
	
   uut2: HC_DECODER PORT MAP (
          Sin => signal_merge,
          Sout => Sout,
			 ERR => ERR
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
			Sin <= Sin + 1;
			wait for 40 ns;
		end if;
		
   end process;

END;
