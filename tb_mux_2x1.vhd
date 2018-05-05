--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:27:37 06/16/2017
-- Design Name:   
-- Module Name:   /home/iffat/Desktop/display_module/tb_mux_2x1.vhd
-- Project Name:  display_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_2x1
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mux_2x1 IS
END tb_mux_2x1;
 
ARCHITECTURE behavior OF tb_mux_2x1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_2x1
    PORT(
         in1 : IN  std_logic_vector(319 downto 0);
         in2 : IN  std_logic_vector(319 downto 0);
         control : IN  std_logic;
         output : OUT  std_logic_vector(319 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(319 downto 0) := (others => '0');
   signal in2 : std_logic_vector(319 downto 0) := (others => '0');
   signal control : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(319 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant I_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2x1 PORT MAP (
          in1 => in1,
          in2 => in2,
          control => control,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		
		in1 <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
      in2 <= "00000000000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		control <= '0';
		wait for I_period*10;

		in1 <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
      in2 <= "00000000000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		control <= '1';
		wait for I_period*10;
      
		in1 <= "11111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
      in2 <= "00000000000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100011111111000011110000111100001111101010100001111000111111110000111100001111000011111010101000011110001111111100001111000011110000111110101010000111100000001111111010101010";
		control <= 'X';
		wait for I_period*10;

      wait;
   end process;

END;
