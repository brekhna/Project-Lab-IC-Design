--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:43:03 06/15/2017
-- Design Name:   
-- Module Name:   /home/iffat/Desktop/display_module/tb_lcd_fsm.vhd
-- Project Name:  display_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lcd_fsm
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
 
ENTITY tb_lcd_fsm IS
END tb_lcd_fsm;
 
ARCHITECTURE behavior OF tb_lcd_fsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lcd_fsm
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         tx_done : IN  std_logic;
         lines_done : IN  std_logic;
         RS : OUT  std_logic;
         fsm_data : OUT  std_logic_vector(7 downto 0);
         line : OUT  std_logic;
         en : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal tx_done : std_logic := '0';
   signal lines_done : std_logic := '0';

 	--Outputs
   signal RS : std_logic;
   signal fsm_data : std_logic_vector(7 downto 0);
   signal line : std_logic;
   signal en : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lcd_fsm PORT MAP (
          clk => clk,
          reset => reset,
          tx_done => tx_done,
          lines_done => lines_done,
          RS => RS,
          fsm_data => fsm_data,
          line => line,
          en => en
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
      wait for 20 ns;	

      
      reset <= '1';
		lines_done <= '1';
		tx_done <= '1';
		wait for clk_period*3;
		
      reset <= '0';
		lines_done <= '1';
		tx_done <= '1';
		wait for clk_period*1;
		
      reset <= '0';
		lines_done <= '0';
		tx_done <= '1';
		wait for clk_period*10;
		
      reset <= '0';
		lines_done <= '1';
		tx_done <= '0';
		wait for clk_period*1;
		
		reset <= '0';
		lines_done <= '0';
		tx_done <= '1';
		wait for clk_period*10;


      wait;
   end process;

END;
