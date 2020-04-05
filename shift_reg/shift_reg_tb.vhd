library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_tb is
end shift_reg_tb;

architecture arch of shift_reg_tb is 
	component shift_reg is 	
		port(   clk : in std_logic;
				din : in std_logic_vector(7 downto 0);
				sel : in std_logic_vector(1 downto 0);
				dout : out std_logic_vector(7 downto 0));
	end component;

	signal clk : std_logic := '0';
	signal din : std_logic_vector(7 downto 0);
	signal sel : std_logic_vector(1 downto 0);
	signal dout : std_logic_vector(7 downto 0);

begin

	dut : shift_reg port map (clk , din , sel , dout);

	process 
		begin
			clk <= not clk;
			wait for 10ns;
	end process;

	process
		begin
			sel <= "00";
			wait for 40ns;
			sel <= "01";
			din <= "01100010";
			wait for 40ns;
			sel <= "10";
			wait for 40ns;
			sel <= "11";
			wait for 40ns;

	end process;

end arch;