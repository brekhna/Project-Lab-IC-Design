----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:29 06/15/2017 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  RS : in  STD_LOGIC;
           tx_done : in  STD_LOGIC;
			  --addr: out  natural range 0 to 39;
           addr : out  STD_LOGIC_VECTOR (5 downto 0);
           lines_done : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is
begin
process (clk,reset,en,tx_done)
variable pre_count: unsigned(5 downto 0);
begin
	if (reset = '1') then
		pre_count := "000000";
		addr <= std_logic_vector(pre_count);
		lines_done <= '0';
		
	elsif (clk='1' and clk'event) then
		if (en = '0' and tx_done = '1' and RS = '1') then
			pre_count := pre_count + 1;
			addr <= std_logic_vector(pre_count);
			lines_done <= '0';
							
				if (pre_count = "100111") then
					lines_done <= '1';
				--	pre_count := "000000";
				--	addr <= std_logic_vector(pre_count);
					
				elsif (pre_count = "101000") then
					lines_done <= '1';
					pre_count := "000000";
					addr <= std_logic_vector(pre_count);
					
				else 
				lines_done <= '0';
				end if;
				
			elsif (RS = '0') then
			pre_count := "000000";
		   addr <= std_logic_vector(pre_count);
			lines_done <= '0';
			
		end if;
	end if;

end process;

end Behavioral;

