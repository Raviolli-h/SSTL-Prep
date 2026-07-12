
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity:
entity Top_Level is 
port (
    FirstPort : in std_logic;
    SecondPort : out std_logic;
    ThirdPort : inout std_logic_vector(15 downto 0)
);
end entity;

-- Entity Declaration x 2
    Entity Link_Management is
        port(

        );
    end entity;

    Entity Data_Packer is
        port(

        );
    end entity;


Architecure Instantiation of Top_Level is

-- Component Declaration x 2
    component Link_Management is
        port(
            -- port declaration here.
        );
    end component;

    component Data_Packer is
        port(
            -- port declaration here.
        );
    end component;


End Architecure;
