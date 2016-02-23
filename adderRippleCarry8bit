library ieee;
use ieee.std_logic_1164.all;

entity adderRippleCarry8bit is
 port(
  A    :  IN   std_logic_vector(7 downto 0);
  B    :  IN   std_logic_vector(7 downto 0);
  Cin  :  IN   std_logic;
  S    :  OUT  std_logic_vector(7 downto 0);
  Cout :  OUT  std_logic
  );
end adderRippleCarry8bit;

architecture behavioral of adderRippleCarry8bit is
signal  h_sum          :    std_logic_vector(7 downto 0);
signal  c_generate     :    std_logic_vector(7 downto 0);
signal  c_propagate    :    std_logic_vector(7 downto 0);
signal  c_in_internal  :    std_logic_vector(7 downto 1);
begin
    h_sum<=A xor B;
    c_generate<=A and B;
    c_propagate<=A or B;
    process (c_generate,c_propagate,c_in_internal)
    begin
    c_in_internal(1) <= c_generate(0) OR (c_propagate(0) and Cin);
      inst: FOR i IN 1 TO 6 LOOP
        c_in_internal(i+1) <= c_generate(i) or (c_propagate(i) and c_in_internal(i));
        END LOOP;
    Cout<=c_generate(7) or (c_propagate(7) and c_in_internal(7));
    end process;

    S(0)<=h_sum(0) xor Cin;
    S(7 downto 1)<=h_sum(7 downto 1) XOR c_in_internal(7 downto 1);
end behavioral;
