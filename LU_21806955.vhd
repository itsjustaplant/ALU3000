library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity lu is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  F: out STD_LOGIC_VECTOR (2 downto 0));
end lu;

architecture Behavioral of lu is
component mux4to1 is
    Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
           b : in  STD_LOGIC_VECTOR (2 downto 0);
           c : in  STD_LOGIC_VECTOR (2 downto 0);
           d : in  STD_LOGIC_VECTOR (2 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (2 downto 0));
end component;
signal x1,x2,x3,x4:Std_logic_vector (2 downto 0);
begin
x1(0) <= A(0) and B(0);
x1(1) <= A(1) and B(1);
x1(2) <= '0';

x2(0) <= A(0) or B(0);
x2(1) <= A(1) or B(1);
x2(2) <= '0';

x3(0) <= not A(0);
x3(1) <= not A(1);
x3(2) <= '0';

x4(0) <= A(0) xor B(0);
x4(1) <= A(1) xor B(1);
x4(2) <= '0';

mux : mux4to1 port map(x1,x2,x3,x4,sel(1 downto 0),F);
end Behavioral;
