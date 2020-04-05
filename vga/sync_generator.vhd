library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;

entity sync_generator is
port(
pixel_count : in std_logic_vector(9 downto 0) ;
line_count : in std_logic_vector(9 downto 0) ;
h_sync : out std_logic := '1' ;
v_sync : out std_logic := '1' );
end entity ;

architecture sync_generator_arch of sync_generator is 
begin
process(pixel_count , line_count) 
begin 

if( "1010010000" < pixel_count and pixel_count < "1011110001" ) then
h_sync <= '0' ;
else
h_sync <= '1' ;
end if ;

if( "111101010" < line_count and line_count < "111101101" ) then
v_sync <= '0' ;
else
v_sync <= '1' ;
end if ;
end process ;

end sync_generator_arch ;