--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:03:49 06/15/2017
-- Design Name:   
-- Module Name:   /home/iffat/Desktop/display_module/tb_mux_4x1.vhd
-- Project Name:  display_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_4x1
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
 
ENTITY tb_mux_4x1 IS
END tb_mux_4x1;
 
ARCHITECTURE behavior OF tb_mux_4x1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_4x1
    PORT(
         in1 : IN  std_logic_vector(159 downto 0);
         in2 : IN  std_logic_vector(159 downto 0);
         in3 : IN  std_logic_vector(159 downto 0);
         in4 : IN  std_logic_vector(159 downto 0);
         control : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(159 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(159 downto 0) := (others => '0');
   signal in2 : std_logic_vector(159 downto 0) := (others => '0');
   signal in3 : std_logic_vector(159 downto 0) := (others => '0');
   signal in4 : std_logic_vector(159 downto 0) := (others => '0');
   signal control : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(159 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant I_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_4x1 PORT MAP (
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          control => control,
          output => output
        );

   -- Clock process definitions
  I_process :process
   begin
		in1 <= x"0000000000000000000000000000000000000000";
		in2 <= x"0000000000000000000000000000000000000000";
		in3 <= x"0000000000000000000000000000000000000000";
		in4 <= x"0000000000000000000000000000000000000000";
		control <= b"00";		
		wait for I_period/2;
		in1 <= x"0000000000000000000000000000000000000001";
		in2 <= x"0000000000000000000000000000000000000002";
		in3 <= x"0000000000000000000000000000000000000003";
		in4 <= x"0000000000000000000000000000000000000004";
		control <= b"01";	
		wait for I_period/2;
		in1 <= x"0000000000000000000000000000000000000001";
		in2 <= x"0000000000000000000000000000000000000002";
		in3 <= x"0000000000000000000000000000000000000003";
		in4 <= x"0000000000000000000000000000000000000004";
		control <= b"11";	
		wait for I_period/2;
   end process;

END;
