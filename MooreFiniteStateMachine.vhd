library ieee;
use ieee.std_logic_1164.all;

entity MooreFiniteStateMachine is
  port
    (
    Clock: in std_logic;
    Resetn: in std_logic;
    W: in std_logic;
    Z: out std_logic
    );
  end MooreFiniteStateMachine;

architecture behavior of MooreFiniteStateMachine is
type State_type is (A, B, C);
signal y: State_type;
  begin
  process(Resetn, Clock)
    begin
    if(Resetn = '0')
      then
      y <= A;
    elsif(Clock'EVENT and Clock = '1')
      then
      case y is
        when A =>
          if(W = '0')
            then
            y <= A;
          else
            y <= B;
          end if;
        when B =>
          if(W = '0')
            then
            y <= A;
          else
            y <= C;
          end if;
        when C =>
          if(W = '0')
            then
            y <= A;
          else
            y <= C;
          end if;
      end case;
    end if;
    end process;
  Z <= '1' when y = C else '0';
  end behavior;
