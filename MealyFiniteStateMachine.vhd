library ieee;
use ieee.std_logic_1164.all;

entity MealyFiniteStateMachine is
  port
    (
    Clock: in std_logic;
    Resetn: in std_logic;
    W: in std_logic;
    Z: out std_logic
    );
  end MealyFiniteStateMachine;

architecture behavior of MealyFiniteStateMachine is
type State_type is (A, B);
signal y: State_type;
  begin
  process(Resetn, Clock)
    begin
    if(Resetn = '1')
      then
      y <= A;
    elsif(Clock'EVENT and Clock = '1')
      then
      case y is
        when A =>
          if(w = '0')
            then
            y <= A;
          else
            y <= B;
          end if;
        when B =>
          if(w = '0')
            then
            y <= A;
          else
            y <= B;
          end if;
      end case;
    end if;
    end process;
  process(y, W, Clock)
    begin
    if(Resetn = '0')
      then
      Z <= '0';
    elsif(Clock'event and Clock = '1')
      then
      case y is
        when A =>
          Z <= '0';
        when B =>
          Z <= W;
      end case;
    end if;
    end process;
  end behavior;
  
