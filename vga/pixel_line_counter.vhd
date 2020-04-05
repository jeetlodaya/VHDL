library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;

entity pixel_line_counter is 
port(
clk : in std_logic ;
pixel_count : out std_logic_vector(9 downto 0) ;
line_count : out std_logic_vector(9 downto 0) );
end pixel_line_counter ;

architecture pixel_line_counter_arch of pixel_line_counter is
signal temp_pixel_count : std_logic_vector(9 downto 0) := (others => '0') ;
signal temp_line_count : std_logic_vector(9 downto 0) := (others => '0') ;
signal clk_25mhz : std_logic := '0' ;
begin

process(clk) 
begin
if(rising_edge(clk)) then
clk_25mhz <= not clk_25mhz ;
end if ;

if(rising_edge(clk) and clk_25mhz = '1') then
if(temp_pixel_count = "1100011111") then
temp_pixel_count <= (others => '0') ;
else
temp_pixel_count <= temp_pixel_count + '1' ;
end if ;
end if ;

if(rising_edge(clk) and clk_25mhz = '1') then
if(temp_line_count = "1000001100" and temp_pixel_count = "1100011111" ) then
temp_line_count <= (others => '0') ;
elsif(temp_pixel_count = "1100011111") then
temp_line_count <= temp_line_count + '1' ;
end if ;
end if ;

end process ; 

pixel_count <= temp_pixel_count + '1'  ;
line_count <= temp_line_count + '1' ;

end pixel_line_counter_arch ;

