library ieee;
use ieee.std_logic_1164.all;

entity adderCLA4bit is
  port
    (
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Cin : in std_logic;
    S : out std_logic_vector(3 downto 0);
    Cout : out std_logic
    );
  end adderCLA4bit;

architecture behavior of adderCLA4bit is
  signal h_sum : std_logic_vector(3 downto 0);
  signal c_generate : std_logic_vector(3 downto 0);
  signal c_propagate : std_logic_vector(3 downto 0);
  signal c_in_internal : std_logic_vector(3 downto 1);
  begin
    h_sum <= A XOR B;
    c_generate <= A AND B;
    c_propagate <= A OR B;
    process (c_generate,c_propagate,c_in_internal)
      begin
      c_in_internal(1) <= c_generate(0) OR (c_propagate(0) AND Cin);
      inst: for i in 1 to 2 loop
        c_in_internal(i+1) <= c_generate(i) OR (c_propagate(i) AND c_in_internal(i));
        end loop;
      Cout <= c_generate(3) OR (c_propagate(3) AND c_in_internal(3));
      end process;
    S(0) <= h_sum(0) XOR Cin;
    S(3 downto 1) <= h_sum(3 downto 1) XOR c_in_internal(3 downto 1);
  end behavior;
