----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Iffat Brekhna
-- 
-- Create Date:    20:30:07 06/10/2017 
-- Design Name: 
-- Module Name:    main - Behavioral 
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
use IEEE.std_logic_UNSIGNED.ALL;
use ieee.numeric_std.all;
library mux_4x1;
use mux_4x1.all;
library mux_2x1;
use mux_2x1.all;
library mux8_2x1;
use mux8_2x1.all;
library reg_file;
use reg_file.all;
library lcd_fsm;
use lcd_fsm.all;
library control_fsm;
use control_fsm.all;
library counter;
use counter.all;
library generic_mux;
use generic_mux.all;
library clock_gen;
use clock_gen.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( --gclk : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  reset : in  std_logic;
			  
			  disp_mode: in std_logic_vector (2 downto 0);
			  fsm_ts_line1 : in std_logic_vector (159 downto 0);
			  fsm_ts_line2 : in std_logic_vector (159 downto 0);
			  fsm_ts_line3 : in std_logic_vector (159 downto 0);
			  fsm_ts_line4 : in std_logic_vector (159 downto 0);
			  
			  td_line1 : in std_logic_vector (159 downto 0);
			  td_line2 : in std_logic_vector (159 downto 0);
			  td_line3 : in std_logic_vector (159 downto 0);
			  td_line4 : in std_logic_vector (159 downto 0);
			  
			  ac_line3 : in std_logic_vector (159 downto 0);
			  ac_line4 : in std_logic_vector (159 downto 0);
			  
			  cd_line3 : in std_logic_vector (159 downto 0);
			  cd_line4 : in std_logic_vector (159 downto 0);
			  
			  sw_line3 : in std_logic_vector (159 downto 0);
			  sw_line4 : in std_logic_vector (159 downto 0);
			  
			  DB : out std_logic_vector (7 downto 0);
			  RS : out std_logic;
			  RW : out std_logic;
			  E : out std_logic
			  
);
end main;

architecture Behavioral of main is

    COMPONENT mux_4x1
    PORT(
         in1 : IN  std_logic_vector(159 downto 0);
         in2 : IN  std_logic_vector(159 downto 0);
         in3 : IN  std_logic_vector(159 downto 0);
         in4 : IN  std_logic_vector(159 downto 0);
			in5 : IN  std_logic_vector(159 downto 0);
         control : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic_vector(159 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT mux_2x1
    PORT(
         in1 : IN  std_logic_vector(319 downto 0);
         in2 : IN  std_logic_vector(319 downto 0);
         control : IN  std_logic;
         output : OUT  std_logic_vector(319 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT reg_file
    PORT(
         reg_in : IN  std_logic_vector(319 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         en : IN  std_logic;
         reg_out : INOUT  std_logic_vector(319 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT mux8_2x1
    PORT(
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         control : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
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

    COMPONENT control_fsm
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         E : OUT  std_logic;
         tx_done : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT counter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         en : IN  std_logic;
			RS : IN std_logic;
         tx_done : IN  std_logic;
         addr : OUT  std_logic_vector(5 downto 0);
         lines_done : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT generic_mux
    PORT(
         inp : IN  std_logic_vector(319 downto 0);
         sel : in natural range 0 to 39;
         outp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 
	 -------------------------------------------------------------
	 -------------------------------------------------------------
	 
	 
--			  signal disp_mode: std_logic_vector (1 downto 0) := "00";
--			  
--			  signal td_line1 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  signal td_line2 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  signal td_line3 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  signal td_line4 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  
--			  signal ac_line3 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  signal ac_line4 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  
--			  signal cd_line3 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  signal cd_line4 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  
--			  signal sw_line3 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
--			  signal sw_line4 : std_logic_vector (159 downto 0) := x"4D59924E414D4592495392494646415492929292";
			  
			  

	 -------------------------------------------------------------
	 -------------------------------------------------------------
--signal clk : std_logic := '0'; -- Internal clock running at 10.00 kHz
--signal en_1K : std_logic := '0';
--signal en_100 : std_logic := '0';
--signal en_10 : std_logic := '0';
--signal en_1 : std_logic := '0';

signal disp_line1 : std_logic_vector (159 downto 0);
signal disp_line2 : std_logic_vector (159 downto 0);	 
signal disp_line3 : std_logic_vector (159 downto 0);
signal disp_line4 : std_logic_vector (159 downto 0);
signal line1_3 : std_logic_vector (319 downto 0);
signal line2_4 : std_logic_vector (319 downto 0);
signal reg_out : std_logic_vector (319 downto 0);
signal data_out : std_logic_vector (7 downto 0);
signal tx_done : std_logic;
signal lines_done: std_logic;
signal en : std_logic;
signal r_s : std_logic;
signal line : std_logic;
signal fsm_data : std_logic_vector ( 7 downto 0);
signal addr : std_logic_vector ( 5 downto 0);
signal lines_to_reg : STD_LOGIC_VECTOR (319 downto 0);
signal addr_mux : natural range 0 to 39;
signal db_sig : std_logic_vector ( 7 downto 0);
signal enable_out : std_logic;
signal disp_line3_alarm : std_logic_vector ( 159 downto 0);
--signal fsm_ts_line4 : std_logic_vector ( 159 downto 0) := x"9292929292929292929292929292929292929292";
begin 

--	-- Generate 10kHz Clock
--	clock_gen: entity work.clock_gen
--		port map(
--			clk => GCLK,
--			clk_10K => clk,
--			en_1K => en_1K,
--			en_100 => en_100,
--			en_10 => en_10,
--			en_1 => en_1
--		);

	--display mux
	
	display_sel_mux1: mux_4x1 port map(
          in1 => td_line1,
          in2 => td_line1,
          in3 => fsm_ts_line1,
          in4 => td_line1,
			 in5 => td_line1,
          control => disp_mode,
          output => disp_line1
        );
		  
	display_sel_mux2: mux_4x1 port map(
          in1 => td_line2,
          in2 => td_line2,
          in3 => fsm_ts_line2,
          in4 => td_line2,
			 in5 => td_line2,
          control => disp_mode,
          output => disp_line2
        );
		  
	display_sel_mux3: mux_4x1 port map(
          in1 => td_line3,
          in2 => ac_line3,
          in3 => fsm_ts_line3,
          in4 => cd_line3,
			 in5 => sw_line3,
          control => disp_mode,
          output => disp_line3
        );
		  
	display_sel_mux4: mux_4x1 port map(
          in1 => td_line4,
          in2 => ac_line4,
          in3 => fsm_ts_line4,
          in4 => cd_line4,
			 in5 => sw_line4,
          control => disp_mode,
          output => disp_line4
        );
		  
   lines_sel_mux: mux_2x1 PORT MAP (
          in1 => line1_3,
          in2 => line2_4,
          control => line,
          output => lines_to_reg
        );
		  
   regfile: reg_file PORT MAP (
          reg_in => lines_to_reg,
          clk => clk,
          reset => reset,
          en => en,
          reg_out => reg_out
        );
		  
	mux_to_DDRAM: mux8_2x1 PORT MAP (
          in1 => fsm_data,
          in2 => data_out,
          control => r_s,
          output => db_sig
        );
		  
	lcdfsm: lcd_fsm PORT MAP (
          clk => clk,
          reset => reset,
          tx_done => tx_done,
          lines_done => lines_done,
          RS => r_s,
          fsm_data => fsm_data,
          line => line,
          en => en
        );
	
	controlfsm: control_fsm PORT MAP (
          clk => clk,
          reset => reset,
          E => enable_out,
          tx_done => tx_done
        );
		  
	counteri:counter PORT MAP (
          clk => clk,
          reset => reset,
          en => en,
			 RS => r_s,
          tx_done => tx_done,
          addr => addr,
          lines_done => lines_done
        );
		  	 
	genericmux: generic_mux PORT MAP (
          inp => reg_out,
          sel => addr_mux,
          outp => data_out
        );
		  
	process(clk,reset,disp_line3,r_s,db_sig,enable_out,addr,td_line1,td_line2,disp_line3_alarm,disp_line4)
	begin
	
	if(reset = '1') then
	 DB <= "00000000";
    RS <= '0';
    RW <= '0';
    E <= '0';
	 disp_line3_alarm <= std_logic_vector(to_unsigned(0000, disp_line3_alarm'length));
	 line1_3 <= std_logic_vector(to_unsigned(0000, line1_3'length));
	 line2_4 <= std_logic_vector(to_unsigned(0000, line2_4'length));
	 addr_mux <= 0;
	 
	else 
	disp_line3_alarm(159 downto 152) <= ac_line3 (159 downto 152);
	disp_line3_alarm(151 downto 0) <= disp_line3(151 downto 0);
	RW <= '0';
	RS <= r_s;
	DB <= db_sig;
	E <= enable_out;
	addr_mux <= 39-(to_integer(unsigned(addr(5 downto 0))));
	line1_3 <= disp_line1 & disp_line3_alarm;
	line2_4 <= disp_line2 & disp_line4;

	end if;
	end process;
	

end Behavioral;

