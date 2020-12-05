library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM1 is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           IP : in  STD_LOGIC;
           OP : out  STD_LOGIC);
end FSM1;

architecture Behavioral of FSM1 is

type states is ( S0, S1, S2, S3, S4 );
signal current_state, next_state : states;
signal fop : std_logic_vector( 1 downto 0 );

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
			when S0 => 	next_state <= S1;
			when S1 => 	if IP = "1101" then
								next_state <= S2;
							else
								next_state <= S1;
							end if;
			when S2 => 	if IP = "0001" then
								next_state <= S4;
						   elsif IP = "1111" then
								next_state <= S3;
							else
								next_state <= S2;
							end if;
			when S3 =>	next_state <= S3;
			when S4 =>	if IP = "1011" then
								next_state <= S0;
							else
								next_state <= S4;
							end if;
			when others => next_state <= S0;
		end case;
	end process;
	
	FSM_phi: process( current_state )
		begin 
			case current_state is 
				when S0			=>	fop <= "00";
				when S1 | S4	=> fop <= "01";
				when S2 			=> fop <= "10";
				when S3			=> fop <= "11";
				when others		=> fop <= "00";
			end case;
	end process;

	OP <= fop;

end Behavioral;

