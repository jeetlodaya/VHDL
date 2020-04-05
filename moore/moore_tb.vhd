library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

entity moore_tb is 
end moore_tb ;

architecture arch_tb of moore_tb is
component moore is
 
port( clk : in std_logic ;
      bcd : in std_logic_vector(3 downto 0) ;
      z : out std_logic ) ;
end component ;
signal clk1 , z1 : std_logic := '0' ;
signal bcd1 : std_logic_vector(3 downto 0) := "0000" ;

begin

dut : moore port map (clk1,bcd1,z1) ;

process
begin
clk1 <= '1' ;
wait for 5ns ;
clk1 <= '0' ;
wait for 5ns ;
end process ;

process
variable flag :std_logic := '0' ;
begin
wait for 2500ps ;
end if ;
bcd1 <= "0010" ;
wait for 10ns ;
bcd1 <= "0011" ;
wait for 10ns ;
bcd1 <= "0101" ;
wait for 10ns ;
bcd1 <= "1001" ;
wait for 100ns ;
end process ;
end arch_tb ;
                         
            
 