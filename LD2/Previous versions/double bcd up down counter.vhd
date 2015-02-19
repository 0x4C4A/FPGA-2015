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
	
	shared variable bcd0 			: std_logic_vector(3 downto 0) := X"0"; 
	shared variable bcd1 			: std_logic_vector(7 downto 4) := X"0";
	signal clocker 		: integer := 0;
	
begin
	
	process(plus, minus, clock)
	
	begin
		if(rising_edge(clock)) then
			if(clocker < 5000000) then
				clocker <= clocker + 1;
			else 
				clocker <= 0;
				if(plus = '0') then
					bcd0 := bcd0 + 1;
				elsif(minus = '0') then
					bcd0 := bcd0 - 1;
				end if;
				
				if(bcd0 > X"09") then
					if(plus = '0') then
						bcd1 := bcd1 + 1;
						bcd0 := X"0";
					else
						bcd1 := bcd1 - 1;
						bcd0 := X"9";
					end if;
				end if;
				
				if(bcd1 > X"09") then
					if(plus = '0') then
						bcd1 := X"0";
					else
						bcd1 := X"9";
					end if;
				end if;
			end if;
		end if;
	end process;
	
	data <= bcd1 & bcd0;

end rtl;
