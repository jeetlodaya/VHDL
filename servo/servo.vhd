library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity servo is
port(
clk : in std_logic ;
pwm : out std_logic  );
end servo; 

architecture arch of servo is 
signal count : integer range 0 to 1048576 := 0 ;-- 20 bit
begin 
process(clk)
begin
--if(count > 540000 ) then
--count <= 0 ;
--elsif(rising_edge(clk)) then 
--count <= count + 1 ;
--end if ;

if(rising_edge(clk)) then
if(count > 539999) then
count <= 0 ;
else
count <= count + 1 ;
end if ;
end if ; 

if(count <= 54000) then
pwm <= '1' ;
else 
pwm <= '0' ;
end if ;

end process ;
end arch ;  
    
  
