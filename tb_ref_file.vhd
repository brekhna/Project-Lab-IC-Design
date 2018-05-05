--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:05:26 06/15/2017
-- Design Name:   
-- Module Name:   /home/iffat/Desktop/display_module/tb_ref_file.vhd
-- Project Name:  display_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_file
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
 
ENTITY tb_ref_file IS
END tb_ref_file;
 
ARCHITECTURE behavior OF tb_ref_file IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_file
    PORT(
         reg_in : IN  std_logic_vector(319 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         en : IN  std_logic;
         reg_out : INOUT  std_logic_vector(319 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reg_in : std_logic_vector(319 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal reg_out : std_logic_vector(319 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_file PORT MAP (
          reg_in => reg_in,
          clk => clk,
          reset => reset,
          en => en,
          reg_out => reg_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		wait for 20 ns;	
      
      reset <= '1';
		reg_in <= std_logic_vector(to_unsigned(1111111111, reg_in'length));
		en <= '0';
		wait for clk_period*3;
		
      reset <= '0';
		reg_in <= std_logic_vector(to_unsigned(111111, reg_in'length));
		en <= '0';
		wait for clk_period*2;
		
	   reset <= '0';
		reg_in <= "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
		en <= '1';
		wait for clk_period*2;
		
		reset <= '0';
		reg_in <= std_logic_vector(to_unsigned(00111, reg_in'length));
		en <= '0';
		wait for clk_period*3;
		
		reset <= '0';
		reg_in <= std_logic_vector(to_unsigned(00111, reg_in'length));
		en <= '0';
		wait for clk_period*3;
		

      wait;
   end process;

END;
