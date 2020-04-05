library ieee;
use ieee.std_logic_1164.all;

entity shift_reg is 
	port( clk : in std_logic;
		  din : in std_logic_vector(7 downto 0);
		  sel : in std_logic_vector(1 downto 0);
		  dout : out std_logic_vector(7 downto 0));
end shift_reg;

architecture arch of shift_reg is
	signal data : std_logic_vector(7 downto 0);
	
begin
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			
			if(sel = "00") then
				data <= "00000000";
			
			elsif(sel = "01") then 
				data <= din;
				
			elsif(sel = "10") then
				data <= '0' & data(7 downto 1);
			
			else 
				data <= data(6 downto 0) & '0';
			end if;
				
		end if;			
	
	end process;	
	
dout <= data;

end architecture arch;	