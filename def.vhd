library ieee;
use ieee.std_logic_1164.all;
package def is
 component fulladd 
  port(
       A    : in std_logic;
       B    : in std_logic;
       Cin  : in std_logic;
       S    : out std_logic;
       Cout : out std_logic);
 end component;
end def;