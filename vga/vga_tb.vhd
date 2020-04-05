library ieee ;
use ieee.std_logic_1164.all ;

entity vga_tb is
end vga_tb ;

architecture vga_arch_tb of vga_tb is 
component vga is 
port(
clk : in std_logic ;
h_sync : out std_logic ;
v_sync : out std_logic ;
red : out std_logic_vector(3 downto 0);
green : out std_logic_vector(3 downto 0);
blue :out std_logic_vector(3 downto 0) );
end component ;

signal clk : std_logic := '0' ;
signal h_sync : std_logic ;
signal v_sync : std_logic ;
signal red : std_logic_vector(3 downto 0);
signal green :std_logic_vector(3 downto 0);
signal blue :std_logic_vector(3 downto 0);  

begin

dut : vga port map (clk , h_sync , v_sync , red ,green ,blue) ;
process 
begin
clk <= not clk ;
wait for 10ns ;
end process ;
end vga_arch_tb ;