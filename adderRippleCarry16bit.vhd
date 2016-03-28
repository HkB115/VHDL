library altera;
USE altera.maxplus2.carry;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library work;
use work.def.all;

entity adderRippleCarry16bit is    
  port
    (
    A_in : in std_logic_vector(15 downto 0);
    B_in : in std_logic_vector(15 downto 0);
    Cin : in std_logic;
    S : out std_logic_vector(15 downto 0);
    Cout : out std_logic
    );
  end adderRippleCarry16bit;

architecture structure of adderRippleCarry16bit is
  signal im : std_logic_vector(14 downto 0);
  signal imi : std_logic_vector(14 downto 0);
  begin
    c0 : fulladd
      port map (A_in(0),B_in(0),Cin,S(0),im(0));
    c01 : carry
      port map (im(0),imi(0));
    c : for i in 1 to 14 generate
      c1to14:  fulladd port map (A_in(i),B_in(i),
      imi(i-1),S(i),im(i));
      c27to32: carry port map (im(i),imi(i));
      end generate;
   c15 : fulladd port map (A_in(15),B_in(1),
      imi(14),S(15),Cout);
  end structure;
