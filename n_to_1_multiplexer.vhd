library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mux_n_to_1 is
    generic (
        DATA_WIDTH : integer := 8
    );
    port (
        -- input
        a   : in std_logic_vector(DATA_WIDTH-1 downto 0);
        b   : in std_logic_vector(DATA_WIDTH-1 downto 0);
        sel : in std_logic_vector(2 downto 0);
        
        -- output
        r   : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end entity;
architecture alu of mux_n_to_1 is
    signal a_signed : signed(DATA_WIDTH-1 downto 0);
    signal b_signed : signed(DATA_WIDTH-1 downto 0);
    signal r_signed : signed(DATA_WIDTH-1 downto 0);
    signal sum      : signed(DATA_WIDTH-1 downto 0);
    signal mult     : signed(DATA_WIDTH-1 downto 0); -- a, b limited to 4-bit
    signal inc      : signed(DATA_WIDTH-1 downto 0);
    signal s_and    : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal s_or     : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal s_xor    : std_logic_vector(DATA_WIDTH-1 downto 0);
    
begin
    /* Type cast slv -> signed */
    a_signed <= signed(a);
    b_signed <= signed(b);
    
    /* Arithmetic unit */
    sum  <= a_signed + b_signed;
    mult <= a_signed(DATA_WIDTH/2-1 downto 0) * b_signed(DATA_WIDTH/2-1 downto 0);
    inc  <= a_signed + 1;
    
    /* Logic unit */
    s_and <= a and b;
    s_or  <= a or  b;
    s_xor <= a xor b;
    
    /* Multiplexing */
    with sel select
        r <= std_logic_vector(sum)  when o"5",
              std_logic_vector(mult) when o"4",
              std_logic_vector(inc)  when o"3",
              s_and when o"2",
              s_or  when o"1",
              s_xor when o"0",
              (others => '0') when others;
              
    /*
    <sel> is 4-bit
    
    with <sel> select
        <out> <= <i0> when x"..",
                 <i1> when x"..",
                    .
                    .
                    <i10> when x"..",
                    (others => '0') when others;
    */
        
end alu;
