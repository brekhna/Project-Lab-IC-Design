----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:39 06/15/2017 
-- Design Name: 
-- Module Name:    control_fsm - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_fsm is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           E : out  STD_LOGIC;
           tx_done : out  STD_LOGIC);
end control_fsm;

architecture Behavioral of control_fsm is
type state_type is (I0,I1,I2);
signal state: state_type;

begin

process1: process(clk,reset)
begin
	
	if (reset = '1') then
	state <= I0;

	elsif clk'event and clk='1' then
		case state is
		
			when I0 => 	state <= I1; 
			when I1 => 	state <= I2; 
			when I2 => 	state <= I0; 
			end case;
	end if;
end process process1;

process2: process(state)
begin
case state is  
      when I0 => E <= '0'; tx_done <= '0';  
      when I1 => E <= '1'; tx_done <= '0';  
      when I2 => E <= '0'; tx_done <= '1';   		
    end case;  

end process process2;
			
end Behavioral;

