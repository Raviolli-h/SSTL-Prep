Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

    Entity Data_Packer is
        port(
                
        );
    end entity;


Architecture RTL of Data_Packer is

signal 3counter : unsigned(2 downto 0) := (others => '0');


begin

Counter : process (clk,rst)
    if reset = '1' then
        3counter <= '0';
        if rising_edge(clk) then
            if 3counter = '3' then 
                3counter <= 0;
            else
                3counter <= 3counter + 1;
            end if;
        end if; 
    end if;


End architecture;