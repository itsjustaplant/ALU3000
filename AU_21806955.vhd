library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity au is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  F : out STD_LOGIC_VECTOR (2 downto 0));
end au;
architecture Behavioral of au is
component binaddsubt is
    Port ( X : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : in  STD_LOGIC_VECTOR (1 downto 0);
           Z : out  STD_LOGIC_VECTOR (2 downto 0);
           M : in  STD_LOGIC);
end component;
component comparator is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           Res : out  STD_LOGIC_VECTOR (2 downto 0));
end component;
component mux4to1 is
    Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
           b : in  STD_LOGIC_VECTOR (2 downto 0);
           c : in  STD_LOGIC_VECTOR (2 downto 0);
           d : in  STD_LOGIC_VECTOR (2 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (2 downto 0));
end component;
signal x1,x2,x3,x4:std_logic_vector(2 downto 0);
begin
binaddsubt1 : binaddsubt port map(A,B,x1,'0');
binaddsubt2 : binaddsubt port map(A,B,x2,'1');
binaddsubt3 : binaddsubt port map(A,"01",x3,'0');
comp			: comparator port map(A,B,x4);

mux : mux4to1 port map(x1,x2,x3,x4,sel(1 downto 0),F);
end Behavioral;
