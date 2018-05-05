----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:41:34 06/15/2017 
-- Design Name: 
-- Module Name:    generic_mux - Behavioral 
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

entity generic_mux is
generic (
        entries:    natural := 40;
        data_width: natural := 8 
		  );
		  
		  port (
        signal inp:     in  std_logic_vector (entries*data_width-1 downto 0);
        signal sel:     in  natural range 0 to entries-1;
        signal outp:    out std_logic_vector (data_width-1 downto 0)
    );
end generic_mux;

architecture Behavioral of generic_mux is
	type mux_array is array (natural range 0 to entries-1) of std_logic_vector(outp'range);
    signal array_val: mux_array;
begin

GEN: for i in array_val'range generate
        array_val(i) <= inp (outp'LEFT+(i*data_width) downto i*data_width);
    end generate;

    outp <= array_val(sel);
end Behavioral;

