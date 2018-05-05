----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:33:43 06/13/2017 
-- Design Name: 
-- Module Name:    mux_2x1 - Behavioral 
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2x1 is
    Port ( in1 : in  STD_LOGIC_VECTOR (319 downto 0);
           in2 : in  STD_LOGIC_VECTOR (319 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (319 downto 0));
end mux_2x1;

architecture Behavioral of mux_2x1 is

begin
	process(in1,in2,control)
	begin
	case control is
	when '0' => output <= in1;
	when '1' => output <= in2;
	when others => output <= std_logic_vector(to_unsigned(0000, output'length));
	end case;
	end process;

end Behavioral;

