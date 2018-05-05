----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:02:34 06/10/2017 
-- Design Name: 
-- Module Name:    mux_4x1 - Behavioral 
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
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_4x1 is
    Port ( in1 : in  STD_LOGIC_VECTOR (159 downto 0);
           in2 : in  STD_LOGIC_VECTOR (159 downto 0);
           in3 : in  STD_LOGIC_VECTOR (159 downto 0);
           in4 : in  STD_LOGIC_VECTOR (159 downto 0);
			  in5 : in  STD_LOGIC_VECTOR (159 downto 0);
           control : in  STD_LOGIC_VECTOR (2 downto 0);
           output : out  STD_LOGIC_VECTOR (159 downto 0));
end mux_4x1;

architecture Behavioral of mux_4x1 is

begin
	process(in1,in2,in3,in4,in5,control)
	begin
	case control is
	when "001" => output <= in1;--time or date depending on line number
	when "010" => output <= in2;--alarm
	when "011" => output <= in3;--ts on
	when "100" => output <= in3;--ts off
	when "101" => output <= in4;--countdown
	when "110" => output <= in5;--stopwatch
	when others => output <= std_logic_vector(to_unsigned(0000, output'length));
	end case;
	end process;

end Behavioral;

