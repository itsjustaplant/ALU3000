library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity alu is
    Port ( DataIn : in  STD_LOGIC_VECTOR (1 downto 0);
           Load : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  tempA:out std_logic_vector (1 downto 0);
			  tempB:out std_logic_vector (1 downto 0);
           Y : out  STD_LOGIC_VECTOR (2 downto 0));
end alu;

architecture Behavioral of alu is
component PIPOregister is
    Port ( DataIn : in  STD_LOGIC_VECTOR (1 downto 0);
           Load : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
component mux2to1 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : in  STD_LOGIC_VECTOR (2 downto 0);
           M : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (2 downto 0));
end component;
component lu is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  F: out STD_LOGIC_VECTOR (2 downto 0));
end component;
component au is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  F : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal A,B:std_logic_vector(1 downto 0);
signal p0,p1:std_logic_vector(2 downto 0);
begin
piporegister1 : piporegister port map(DataIn,Load,A);
piporegister2 : piporegister port map(DataIn,not Load,B);
tempA <= A;
tempB <= B;
arithmeticunit: au port map (A,B,sel,p0);
logicunit : lu port map(A,B,sel,p1);
mux : mux2to1 port map(p0,p1,sel(2),Y);

end Behavioral;
