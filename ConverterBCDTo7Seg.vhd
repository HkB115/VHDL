library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ConverterBCDTo7Seg is
  port
    (
    clk : in std_logic;
    bcd : in std_logic_vector(3 downto 0); --BCD input
    y : out std_logic_vector(0 to 6) -- 7 bit decoded output.
    );
  end ConverterBCDTo7Seg;

architecture behavior of ConverterBCDTo7Seg is
  begin
  process(clk,bcd)
    begin
    if(clk'event and clk='1')
	   then
      case bcd is
        when "0000" => y <= NOT("1111110"); -- 0
        when "0001" => y <= NOT("0110000"); -- 1
        when "0010" => y <= NOT("1101101"); -- 2
        when "0011" => y <= NOT("1111001"); -- 3
        when "0100" => y <= NOT("0110011"); -- 4
        when "0101" => y <= NOT("1011011"); -- 5
        when "0110" => y <= NOT("1011111"); -- 6
        when "0111" => y <= NOT("1110000"); -- 7
        when "1000" => y <= NOT("1111111"); -- 8
        when "1001" => y <= NOT("1110011"); -- 9
        when "1010" => y <= NOT("1110111"); -- a
        when "1011" => y <= NOT("0011111"); -- b
        when "1100" => y <= NOT("1001110"); -- c
        when "1101" => y <= NOT("0111101"); -- d
        when "1110" => y <= NOT("1001111"); -- e
        when "1111" => y <= NOT("1000111"); -- f
        end case;
      end if;
    end process;
  end behavior;
