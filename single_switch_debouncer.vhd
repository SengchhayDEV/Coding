library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity single_switch_debouncer is 
	generic (
		T_DEB_NS	: natural := 80;
		F_CLK_MHZ: natural := 50);
	port (
		x, clk 	: in std_logic;
		y 			: out std_logic;
		MSB		: out std_logic);
end entity;

architecture single_switch of single_switch_debouncer is
	constant COUNTER_BITS: natural := 1 + integer(ceil(log2(real((T_DEB_NS*F_CLK_MHZ)/1000))));
	signal x_reg: std_logic;
begin
	--Timer with input register
	process(clk)
		variable count: unsigned(COUNTER_BITS-1 downto 0);
	begin
	MSB <= count(COUNTER_BITS-1);
		
	--Timer with input register
		if rising_edge(clk) then
		x_reg <= x;
			if y = x_reg then
				count := (others => '0');
			else
				count := count + 1;
			end if;
		end if;
		
		-- output register
		if falling_edge(clk) then
			if count(COUNTER_BITS-1) then
			y <= not y;
			end if;
		end if;
	end process;
end architecture;
