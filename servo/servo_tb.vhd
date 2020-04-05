library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity servo_tb is
end servo_tb ;

architecture arch_tb of servo_tb is 
component servo is 
port(
clk : in std_logic ;
pwm : out std_logic  );
end component ;

signal clk,pwm : std_logic := '0' ;
begin
dut : servo port map(clk,pwm) ;
process 
begin 
clk <= not clk ;
wait for 18518 ps ;
end process ;
end arch_tb ;
