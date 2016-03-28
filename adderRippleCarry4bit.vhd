library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity adderRippleCarry4bit is
  port
    (
    Cin : in std_logic;
    X : in signed(3 downto 0);
    Y : in signed(3 downto 0);
    S : out signed(3 downto 0);
    Cout : out std_logic;
    Over : out std_logic
    );
  end adderRippleCarry4bit;

architecture behavior of adderRippleCarry4bit is
	signal Sum,sum1,sum2 : signed(4 downto 0);
  begin
	  sum1 <= ('0'&X);
	  sum2 <= ('0'&Y);
  	Sum <= sum1 + sum2 + Cin;
  	S <= Sum(3 downto 0);
  	Cout <= Sum(4);
  	Over <= Sum(4) xor (X(3) xor (Y(3) xor Sum(3)));
  end behavior;
