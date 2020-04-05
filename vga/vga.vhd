library ieee ;
use ieee.std_logic_1164.all ;

entity vga is 
port(
clk : in std_logic ;
h_sync : out std_logic ;
v_sync : out std_logic ;
red : out std_logic_vector(3 downto 0);
green : out std_logic_vector(3 downto 0);
blue :out std_logic_vector(3 downto 0) );
end vga ;

architecture vga_arch of vga is
         
component pixel_line_counter is 
port(
clk : in std_logic ;
pixel_count : out std_logic_vector(9 downto 0) ;
line_count : out std_logic_vector(9 downto 0) );
end component ;

component sync_generator is
port(
pixel_count : in std_logic_vector(9 downto 0) ;
line_count : in std_logic_vector(9 downto 0) ;
h_sync : out std_logic ;
v_sync : out std_logic );
end component ;

component pattern_gen is 
port(
pixel_count : in std_logic_vector(9 downto 0) ;
line_count : in std_logic_vector(9 downto 0) ;
red : out std_logic_vector(3 downto 0) ;
green : out std_logic_vector(3 downto 0) ;
blue :out std_logic_vector(3 downto 0) );
end component ;

signal pixel_count : std_logic_vector(9 downto 0) := (others => '0') ;
signal line_count : std_logic_vector(9 downto 0) := (others => '0') ;

begin

b1 : pixel_line_counter  port map(clk , pixel_count , line_count) ;
b2 : sync_generator port map(pixel_count , line_count , h_sync , v_sync) ;
b3 : pattern_gen port map(pixel_count , line_count , red , green , blue) ;

end vga_arch ;


        