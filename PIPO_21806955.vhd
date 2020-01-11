library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PIPOregister is
    Port ( DataIn : in  STD_LOGIC_VECTOR (1 downto 0);
           Load : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (1 downto 0));
end PIPOregister;
architecture Behavioral of PIPOregister is
component dlatch is
    Port ( D : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end component;
begin
dlatch0 : dlatch port map(DataIn(0),Load,DataOut(0));
dlatch1 : dlatch port map(DataIn(1),Load,DataOut(1));
end Behavioral;
