-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TEST is

	port 
	(
		plus	: in std_logic;
		minus : in std_logic;
		clock : in std_logic;
		data	: out std_logic_vector(7 downto 0)
	
	);

end entity;

architecture rtl of TEST is
	
	signal temp 			: std_logic_vector(7 downto 0) := X"00"; 
	signal clocker 		: integer := 0;
	
begin
	
	process(plus, minus, clock)
	
	begin
		if(rising_edge(clock)) then
			if(clocker < 2000000) then
				clocker <= clocker + 1;
			else 
				clocker <= 0;
				if(plus = '0') then
					temp <= temp + '1';
				elsif(minus = '0') then
					temp <= temp - '1';
				end if;
			end if;
		end if;
	end process;
	
	data <= temp;

end rtl;
