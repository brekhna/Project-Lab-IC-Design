----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:48:35 06/15/2017 
-- Design Name: 
-- Module Name:    lcd_fsm - Behavioral 
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

entity lcd_fsm is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           tx_done : in  STD_LOGIC;
           lines_done : in  STD_LOGIC;
           RS : out  STD_LOGIC;
           fsm_data : out  STD_LOGIC_VECTOR (7 downto 0);
           line : out  STD_LOGIC;
           en : out  STD_LOGIC);
end lcd_fsm;

architecture Behavioral of lcd_fsm is
type state_type is (I0,I1,I2,I3,I4,I5);
signal state: state_type;

begin

process1: process(clk,reset,tx_done,lines_done)
begin
	
	if (reset = '1') then
	state <= I0;
	
	elsif clk'event and clk='1' then
		case state is
		
			when I0 => 
			if tx_done='1' then
				state <= I1; 
			end if; 
			
			when I1 => 
			if tx_done='1' then
				state <= I2; 
			end if; 
			
			when I2 => 
			if tx_done='1' then
				state <= I3; 
			end if; 
			
			when I3 => 
			if lines_done='1' then
				state <= I4; 
			end if; 
			
			when I4 => 
			if tx_done='1' then
				state <= I5; 
			end if; 
			
			when I5 => 
			if lines_done='1' then
				state <= I2; 
			end if; 
			
			
			
	end case;
	end if;
end process process1;

process2: process(state)
begin
case state is  
      when I0 => RS <= '0'; fsm_data <= x"38"; line <= 'X'; en <='X';  
      when I1 => RS <= '0'; fsm_data <= x"0C"; line <= 'X'; en <='X';  
      when I2 => RS <= '0'; fsm_data <= x"80"; line <= '0'; en <='1';   
      when I3 => RS <= '1'; fsm_data <= "XXXXXXXX"; line <= 'X'; en <='0';  	
		when I4 => RS <= '0'; fsm_data <= x"C0"; line <= '1'; en <='1'; 
		when I5 => RS <= '1'; fsm_data <= "XXXXXXXX"; line <= 'X'; en <='0'; 		
    end case;  

end process process2;

end Behavioral;

