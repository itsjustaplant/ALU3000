library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux2to1 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : in  STD_LOGIC_VECTOR (2 downto 0);
           M : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (2 downto 0));
end mux2to1;

architecture Behavioral of mux2to1 is
signal p0,p1,p2,p3,p4,p5:std_logic;
begin
p0 <= X(2) and (not M);
p1 <= X(1) and (not M);
p2 <= X(0) and (not M);

p3 <= Y(2) and M;
p4 <= Y(1) and M;
p5 <= Y(0) and M;

Z(2) <= p0 or p3;
Z(1) <= p1 or p4;
Z(0) <= p2 or p5;
end Behavioral;
