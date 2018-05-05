-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT main
          PORT( clk : in  STD_LOGIC;
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
			  
			  DB: out std_logic_vector (7 downto 0);
			  RS: out std_logic;
			  RW: out std_logic;
			  E: out std_logic
           );
          END COMPONENT;

			  signal clk : STD_LOGIC;
			  signal reset : std_logic;
			  
			  signal disp_mode: std_logic_vector (2 downto 0);
			  signal fsm_ts_line1 : std_logic_vector (159 downto 0);
			  signal fsm_ts_line2 : std_logic_vector (159 downto 0);
			  signal fsm_ts_line3 : std_logic_vector (159 downto 0);
			  signal fsm_ts_line4 : std_logic_vector (159 downto 0);
			  
			  signal td_line1 : std_logic_vector (159 downto 0);
			  signal td_line2 : std_logic_vector (159 downto 0);
			  signal td_line3 : std_logic_vector (159 downto 0);
			  signal td_line4 : std_logic_vector (159 downto 0);
			  
			  signal ac_line3 : std_logic_vector (159 downto 0);
			  signal ac_line4 : std_logic_vector (159 downto 0);
			  
			  signal cd_line3 : std_logic_vector (159 downto 0);
			  signal cd_line4 : std_logic_vector (159 downto 0);
			  
			  signal sw_line3 : std_logic_vector (159 downto 0);
			  signal sw_line4 : std_logic_vector (159 downto 0);
			  
			  signal DB: std_logic_vector (7 downto 0);
			  signal RS: std_logic;
			  signal RW: std_logic;
			  signal  E: std_logic;
			  
			 constant clk_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: main PORT MAP(
			  clk => clk,
			  reset => reset,
			  
			  disp_mode => disp_mode,
			  fsm_ts_line1 => fsm_ts_line1,
			  fsm_ts_line2 => fsm_ts_line2,
			  fsm_ts_line3 => fsm_ts_line3,
			  fsm_ts_line4 => fsm_ts_line4,
			  
			  td_line1 => td_line1,
			  td_line2 => td_line2,
			  td_line3 => td_line3,
			  td_line4 => td_line4,
			  
			  ac_line3 => ac_line3, 
			  ac_line4 => ac_line4, 
			  
			  cd_line3 => cd_line3,
			  cd_line4 => cd_line4,
			  
			  sw_line3 => sw_line3,
			  sw_line4 => sw_line4,
			  
			  DB => DB, 
			  RS => RS, 
			  RW => RW,
			  E => E
          );
			 
			 
 -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
			
			  reset <= '1'; 
			  disp_mode <= "001"; 
			  fsm_ts_line1 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line2 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line3 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line4 <= x"9292929292929292929292929292929292929292";
			  td_line1 <= x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
			  td_line2 <= x"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
			  td_line3 <= x"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC";
			  td_line4 <= x"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD";
			  ac_line3 <= x"EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE";
			  ac_line4 <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
			  cd_line3 <= x"1111111111111111111111111111111111111111";
			  cd_line4 <= x"2222222222222222222222222222222222222222"; 
			  sw_line3 <= x"3333333333333333333333333333333333333333";
			  sw_line4 <= x"4444444444444444444444444444444444444444";
		     wait for clk_period*5;
			  
			  reset <= '0'; 
			  disp_mode <= "101"; 
			  fsm_ts_line1 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line2 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line3 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line4 <= x"9292929292929292929292929292929292929292";
			  td_line1 <= x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
			  td_line2 <= x"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
			  td_line3 <= x"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC";
			  td_line4 <= x"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD";
			  ac_line3 <= x"EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE";
			  ac_line4 <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
			  cd_line3 <= x"1111111111111111111111111111111111111111";
			  cd_line4 <= x"2222222222222222222222222222222222222222"; 
			  sw_line3 <= x"3333333333333333333333333333333333333333";
			  sw_line4 <= x"4444444444444444444444444444444444444444";
		     wait for clk_period*150;
			  
			  reset <= '0'; 
			  disp_mode <= "011"; 
			  fsm_ts_line1 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line2 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line3 <= x"9292929292929292929292929292929292929292";
			  fsm_ts_line4 <= x"9292929292929292929292929292929292929292";
			  td_line1 <= x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
			  td_line2 <= x"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
			  td_line3 <= x"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC";
			  td_line4 <= x"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD";
			  ac_line3 <= x"EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE";
			  ac_line4 <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
			  cd_line3 <= x"1111111111111111111111111111111111111111";
			  cd_line4 <= x"2222222222222222222222222222222222222222"; 
			  sw_line3 <= x"3333333333333333333333333333333333333333";
			  sw_line4 <= x"4444444444444444444444444444444444444444";
		     wait for clk_period*150;
----
--			  reset <= '0'; 
--			  disp_mode <= "10"; 
--			  td_line1 <= x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
--			  td_line2 <= x"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
--			  td_line3 <= x"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC";
--			  td_line4 <= x"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD";
--			  ac_line3 <= x"EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE";
--			  ac_line4 <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
--			  cd_line3 <= x"1111111111111111111111111111111111111111";
--			  cd_line4 <= x"2222222222222222222222222222222222222222"; 
--			  sw_line3 <= x"3333333333333333333333333333333333333333";
--			  sw_line4 <= x"4444444444444444444444444444444444444444";
--		     wait for clk_period*20;
--			  
--			  reset <= '0'; 
--			  disp_mode <= "11"; 
--			  td_line1 <= x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
--			  td_line2 <= x"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
--			  td_line3 <= x"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC";
--			  td_line4 <= x"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD";
--			  ac_line3 <= x"EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE";
--			  ac_line4 <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
--			  cd_line3 <= x"1111111111111111111111111111111111111111";
--			  cd_line4 <= x"2222222222222222222222222222222222222222"; 
--			  sw_line3 <= x"3333333333333333333333333333333333333333";
--			  sw_line4 <= x"4444444444444444444444444444444444444444";
--			  alarm_state <= "01010101";
--		     wait for clk_period*20;
			  
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
