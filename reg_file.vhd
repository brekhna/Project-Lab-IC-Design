----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:18:51 06/13/2017 
-- Design Name: 
-- Module Name:    reg_file - Behavioral 
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

entity reg_file is
    Port ( reg_in : in  STD_LOGIC_VECTOR (319 downto 0);
           clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reg_out : inout  STD_LOGIC_VECTOR (319 downto 0));
end reg_file;

architecture Behavioral of reg_file is

begin

process (clk,reset)
begin
if(reset='1') then
reg_out <= std_logic_vector(to_unsigned(0000, reg_out'length));

elsif clk'event and clk='1' then
	if(en='1') then
	reg_out <= reg_in;
	end if;

end if;
end process;

end Behavioral;

