--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:02:38 06/15/2017
-- Design Name:   
-- Module Name:   /home/iffat/Desktop/display_module/tb_control_fsm.vhd
-- Project Name:  display_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_fsm
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
 
ENTITY tb_control_fsm IS
END tb_control_fsm;
 
ARCHITECTURE behavior OF tb_control_fsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_fsm
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         E : OUT  std_logic;
         tx_done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal E : std_logic;
   signal tx_done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_fsm PORT MAP (
          clk => clk,
          reset => reset,
          E => E,
          tx_done => tx_done
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
      -- hold reset state for 20 ns.
        wait for 20 ns;	
      
      reset <= '1';
		wait for clk_period*3;
		
      reset <= '0';
		wait for clk_period*5;
		
      reset <= '1';
		wait for clk_period*10;
		
      reset <= '0';
		wait for clk_period*10;

      wait;
   end process;

END;
