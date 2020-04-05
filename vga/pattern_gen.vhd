library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;

entity pattern_gen is 
port(
pixel_count : in std_logic_vector(9 downto 0) ;
line_count : in std_logic_vector(9 downto 0) ;
red : out std_logic_vector(3 downto 0) ;
green : out std_logic_vector(3 downto 0) ;
blue :out std_logic_vector(3 downto 0) );
end pattern_gen ;

architecture pattern_gen_arch of pattern_gen is 
begin
process(pixel_count , line_count)
begin

if("111100000" < line_count or "1010000000"  < pixel_count ) then
red <= "0000" ;
green <= "0000" ;
blue <= "0000" ;
else 
if(pixel_count < "101000001") then
red <= "1111" ;
green <= "1111" ;
blue <= "1111" ;
else
red <= "0000";
green <= "0000" ;
blue <= "0000" ;
end if ;
end if ;
end process ;

end pattern_gen_arch ;
