library ieee;
use ieee.std_logic_1164.all;

entity adderRippleCarry8bit is
  port
    (
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Cin : in std_logic;
    S : out std_logic_vector(7 downto 0);
    Cout : out std_logic
    );
  end adderRippleCarry8bit;

architecture behavior of adderRippleCarry8bit is
  signal h_sum : std_logic_vector(7 downto 0);
  signal c_generate : std_logic_vector(7 downto 0);
  signal c_propagate : std_logic_vector(7 downto 0);
  signal c_in_internal : std_logic_vector(7 downto 1);
  begin
    h_sum <= A xor B;
    c_generate <= A and B;
    c_propagate <= A or B;
    process (c_generate,c_propagate,c_in_internal)
    begin
      c_in_internal(1) <= c_generate(0) OR (c_propagate(0) and Cin);
      inst: for i in 1 to 6 loop
        c_in_internal(i+1) <= c_generate(i) or (c_propagate(i) and c_in_internal(i));
        end loop;
      Cout <= c_generate(7) or (c_propagate(7) and c_in_internal(7));
    end process;
    S(0) <= h_sum(0) xor Cin;
    S(7 downto 1) <= h_sum(7 downto 1) XOR c_in_internal(7 downto 1);
  end behavior;
