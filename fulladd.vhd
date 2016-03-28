library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fulladd is
port(
 A : in std_logic;
 B : in std_logic;
 Cin : in std_logic;
 S : out std_logic;
 Cout : out std_logic);
end fulladd;

architecture Behavioral of fulladd is
begin
 S <= A xor B xor Cin;
 Cout <= (A and B) or (Cin and (A or B));
end Behavioral;