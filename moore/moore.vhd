library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

entity moore is 
port( clk : in std_logic ;
      bcd : in std_logic_vector(3 downto 0) ;
      z : out std_logic ) ;
end moore ;

architecture arch of moore is 

type mystate is (rst,got2,got23,got235,got2359) ;
signal ns,ps : mystate := rst ;

begin

process(clk)
begin 
if(clk'event and clk = '0') then
ps <= ns ;
end if  ;
end process ;

process(ps,bcd)
variable x : integer ;
begin

x := conv_integer(unsigned(bcd));

case ps is

when rst =>
z <= '0' ;
if(x = 2) then 
ns <= got2 ;
else 
ns <= rst ;
end if ;

when got2 =>
z <= '0' ;
if(x = 3) then 
ns <= got23 ;
else 
ns <= rst ;
end if ;

when got23 =>
z <= '0' ;
if(x = 5) then 
ns <= got235 ;
else 
ns <= rst ;
end if ;

when got235 =>
z <= '0' ;
if(x = 9) then 
ns <= got2359 ;
else 
ns <= rst ;
end if ;

when got2359 =>
z <= '1' ;
ns <= rst ;

end case ;
end process;

end arch ;




