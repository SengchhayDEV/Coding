library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity multi_switch is
	generic (
		T_DEB_NS : natural := 80;
		F_CLK_MHZ: natural := 50);
	port (
		x1			: in std_logic;
		x2, clk 	: in std_logic;
		x3			: in std_logic;
		y1			: out std_logic;
		y2			: out std_logic;
		y3			: out std_logic);
end entity;

architecture single_switch of multi_switch is
	constant COUNTER_BITS: natural := 1 + integer(ceil(log2(real((T_DEB_NS*F_CLK_MHZ)/1000))));
	signal sclk : std_logic;
	signal x1_reg : std_logic_vector(2 downto 0);
	signal x2_reg : std_logic_vector(2 downto 0);
	signal x3_reg : std_logic_vector(2 downto 0);
begin
	process (clk)
		variable count : unsigned(COUNTER_BITS-1 downto 0);
		begin 
		sclk <= count(COUNTer_BITS-1);
			if sclk then
			count := (others => '0');
			else
			count:= count + 1;
			end if;
		end process;
	process (sclk)
		begin
		if rising_edge (sclk) then
			x1_reg(0) <= x1;
			x1_reg(1) <= x1_reg(0);
		end if;
		if falling_edge (sclk) then
			if x1_reg(0) XNOR x1_reg(1) then 
				y1 <= x1_reg(1);
			end if;
		end if;
	end process;
		
	process (sclk)
		begin
		if rising_edge (sclk) then
			x2_reg(0) <= x2;
			x2_reg(1) <= x2_reg(0);
		end if;
		if falling_edge (sclk) then
			if x2_reg(0) XNOR x2_reg(1) then 
				y2 <= x2_reg(1);
			end if;
		end if;
	end process;
	
	process (sclk)
		begin
		if rising_edge (sclk) then
			x3_reg(0) <= x3;
			x3_reg(1) <= x3_reg(0);
		end if;
		if falling_edge (sclk) then
			if x3_reg(0) XNOR x3_reg(1) then 
				y3 <= x3_reg(1);
			end if;
		end if;
	end process;
end architecture;
