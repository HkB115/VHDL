library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

entity pr_en_8_3 is
  port
    (
    w : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(2 downto 0);
    z : out std_logic
    );
end pr_en_8_3;

architecture priority_enc_arc of pr_en_8_3 is
  begin
  process(w)
    begin
    if w(7)='1' then y <= "111";
    elsif w(6)='1' then y <= "110";
    elsif w(5)='1' then y <= "101";
    elsif w(4)='1' then y <= "100";
    elsif w(3)='1' then y <= "011";
    elsif w(2)='1' then y <= "010";
    elsif w(1)='1' then y <= "001";
    elsif w(0)='1' then y <= "000";
    else y <= "000";
    end if;
    end process; 
  z <= '0' when w="00000000" else '1';
  end priority_enc_arc;
