library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM2 is
    Port 
	 ( 	
			  CLK : in   std_logic;
           RST : in   std_logic;
           IP 	: in   std_logic_vector( 3 downto 0 );
           OP  : out  std_logic_vector( 1 downto 0 )
	 );
end FSM2;

architecture Behavioral of FSM2 is

type states is ( S0, S1, S2, S3, S4 );
signal current_state, next_state : states;
signal fout : std_logic_vector( 1 downto 0 );

begin

	FSM_dff: process( CLK, RST, next_state )
	begin 
		if RST = '1' then
			current_state <= S0;
		elsif rising_edge( CLK ) then
			current_state <= next_state;
		end if;
	end process;
	
	FSM_gamma: process( current_state, IP )
	begin 
		case current_state is 
			when S0 => 	if IP = "0001" then
								next_state <= S1;
							else
								next_state <= S0;
							end if;
			when S1 => 	if IP = "0001" then
								next_state <= S4;
						   elsif IP = "0010" then
								next_state <= S2;
							else
								next_state <= S1;
							end if;
			when S2 => 	if IP = "0001" then
								next_state <= S3;
							else
								next_state <= S2;
							end if;
			when S3 =>	next_state <= S3;
			when S4 =>	if IP = "0100" then
								next_state <= S3;
							else
								next_state <= S4;
							end if;
			when others => next_state <= S0;
		end case;
	end process;
	
	FSM_phi: process( current_state )
		begin 
			case current_state is 
				when S0			=>	fout <= "00";
				when S1 			=> fout <= "10";
				when S2 | S4 	=> fout <= "01";
				when S3			=> fout <= "11";
				when others		=> fout <= "00";
			end case;
	end process;

	OP <= fout;

end Behavioral;

