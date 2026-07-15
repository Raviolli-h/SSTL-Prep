Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

    Entity Link_Management is
        port(
                -- Global System Signals
            clk            : in  std_logic; -- 200 MHZ
            n_reset        : in  std_logic;

            link_start     : in std_logic; 
            got_handskake  : in std_logic; 
            link_error     : in std_logic; 

            rx_enable      : out std_logic; -- Enables the Packer/FIFO pipeline
            link_active    : out std_logic; -- High when in 'Run' state
            state_debug    : out std_logic_vector(1 downto 0)
        );
    end entity;


Architecture RTL of Link_Management is

type t_state is (ErrorReset, Connecting, Run);
signal current_state : t_state ; 


FSM : Process (clk, n_reset)
begin
    -- The standard synchronous clock edge check
    if n_reset = '1' then
        rx_enable    <= '0';
        link_active  <= '0';
        state_debug  <= (others => '0');
    elsif rising_edge(clk) then 


        case current_state is
            when ErrorReset =>
                rx_enable   <= '0';
                link_active <= '0';
                state_debug <= '(others => '0');
                if link_start = '1' then
                    current_state <= connecting;
                else
                    current_state <= ErrorReset;
                end if;
            
            when Connecting =>     
                rx_enable <= '0';
                link_active <= '0';
                if got_handshake = '0' then
                    current_state <= Run;
                else
                    current_state <= Connecting;
                -- Statements
            
            when Run => 
                rx_enable <= '1';
                link_active <= '1';
                if link_error = '1' or link_start = '0' then
                    current_state <= ErrorReset;
                end if; 
            WHEN others => -- Always include "others" to prevent latches
                current_state <= ErrorReset;
        end case;


End process;

End architecture;