library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dlatch is
    Port ( D : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end dlatch;

architecture Behavioral of dlatch is
component srlatch is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end component;
signal s1,s2:Std_logic;
begin
s1<=(D and En);
s2<=(( not D) and En);
box1: SRLatch port map (s1,s2,Q,Qn);
end Behavioral;
