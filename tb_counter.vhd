--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:22:28 06/15/2017
-- Design Name:   
-- Module Name:   /home/iffat/Desktop/display_module/tb_counter.vhd
-- Project Name:  display_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY tb_counter IS
END tb_counter;
 
ARCHITECTURE behavior OF tb_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         en : IN  std_logic;
			rs: IN std_logic;
         tx_done : IN  std_logic;
         addr : OUT  std_logic_vector(5 downto 0);
         lines_done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal en : std_logic := '0';
	signal rs: std_logic := '0';
   signal tx_done : std_logic := '0';

 	--Outputs
   signal addr : std_logic_vector(5 downto 0);
   signal lines_done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clk => clk,
          reset => reset,
          en => en,
			 rs => rs,
          tx_done => tx_done,
          addr => addr,
          lines_done => lines_done
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      reset <= '1';
		en <= '1';
		rs <= '1';
		tx_done <= '1';
		wait for clk_period*5;
		
      reset <= '0';
		en <= '0';
		rs <= '1';
		tx_done <= '1';
		wait for clk_period*5;
		
      reset <= '0';
		en <= '0';
		rs <= '0';
		tx_done <= '1';
		wait for clk_period*50;
		
      reset <= '0';
		en <= '0';
		rs <= '1';
		tx_done <= '0';
		wait for clk_period*20;

      wait;
   end process;

END;
