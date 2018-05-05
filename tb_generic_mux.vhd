--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:43:41 06/15/2017
-- Design Name:   
-- Module Name:   /home/iffat/Desktop/display_module/tb_generic_mux.vhd
-- Project Name:  display_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generic_mux
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_generic_mux IS
END tb_generic_mux;
 
ARCHITECTURE behavior OF tb_generic_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generic_mux
    PORT(
         inp : IN  std_logic_vector(319 downto 0);
         sel : in natural range 0 to 39;
         outp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inp : std_logic_vector(319 downto 0) := (others => '0');
	signal sel :  natural ;

 	--Outputs
   signal outp : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant I_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generic_mux PORT MAP (
          inp => inp,
          sel => sel,
          outp => outp
        );

 
   stim_proc: process
   begin			
      
		wait for 20 ns;

      inp <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		sel <= 0;
		wait for I_period*5;
		
		inp <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		sel <= 1;
		wait for I_period*5;
		
		inp <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		sel <= 2;
		wait for I_period*5;
		
		inp <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		sel <= 39;
		wait for I_period*5;
		
		inp <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		sel <= 40;
		wait for I_period*5;
		
      wait;
   end process;

END;
