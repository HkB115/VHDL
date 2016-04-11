library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;
 
entity Counter4bit is
  port
    (
    UP_DOWN: in std_logic;
    CLOCK: in std_logic;
    CLEAR: in std_logic;
    Q: out std_logic_vector(3 to 0)
    );
  end Counter4bit;
 
architecture behavior of Counter4bit is
signal tmp: std_logic_vector(3 to 0);
  begin
  process(CLOCK,CLEAR)
    begin
    if(CLEAR='0')
      then
      tmp <= "0000";
    elsif(CLOCK'event and CLOCK='1')
      then
      if(UP_DOWN='0')
        then
        if(tmp = "1111")
          then
          tmp <= "0000";
        else
          tmp <= tmp + 1;
        end if;
      elsif(UP_DOWN='1')
        then
        if(tmp = "0000")
          then
          tmp <= "1111";
        else
          tmp <= tmp - 1;
        end if;
      end if;
    end if;
    end process;
  Q <= tmp;
  end behavior;
