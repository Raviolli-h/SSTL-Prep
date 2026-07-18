Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

    Entity Data_Packer is
        port(
            clk         : in  std_logic; -- 200 MHZ
            n_reset     : in  std_logic;

            x_data_in   : in  std_logic_vector(7 downto 0)

        );
    end entity;


Architecture RTL of Data_Packer is

signal 3counter : unsigned(2 downto 0) := (others => '0');
signal data_packed : std_logic_vector(31 downto 0);

-- State Machine
type t_state is (FIRST, SECOND, THIRD, FOURTH);
Signal current_state : t_state ; 

begin

data_packed(7 downto 0) <= (others => '0');


Data_packer : process (clk, rst)
begin
if rising_edge(clk) then 
  case current_state is
            when FIRST =>
                data_packed(31 downto 24) <= x_data_in;
                3counter <= "0";
                current_state <= SECOND;

            when SECOND => -- Multiple conditions
                data_packed(23 downto 16) <= x_data_in;;
                3counter <= "1";
                current_state <= THIRD;

            when THIRD => -- Always include "others" to prevent latches
                data_packed(15 downto 8) <= x_data_in;;
                3counter <= "2";
                current_state <= THIRD;

            when FOURTH => -- Always include "others" to prevent latches
                data_packed(7 downto 0) <= x_data_in;;
                3counter <= "2";
                current_state <= THIRD;

            when others => -- Always include "others" to prevent latches
                current_state <= FIRST;
        end case;
end if;
end process;

End architecture;