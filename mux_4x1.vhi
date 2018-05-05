
-- VHDL Instantiation Created from source file mux_4x1.vhd -- 15:37:05 06/16/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mux_4x1
	PORT(
		in1 : IN std_logic_vector(159 downto 0);
		in2 : IN std_logic_vector(159 downto 0);
		in3 : IN std_logic_vector(159 downto 0);
		in4 : IN std_logic_vector(159 downto 0);
		control : IN std_logic_vector(1 downto 0);          
		output : OUT std_logic_vector(159 downto 0)
		);
	END COMPONENT;

	Inst_mux_4x1: mux_4x1 PORT MAP(
		in1 => ,
		in2 => ,
		in3 => ,
		in4 => ,
		control => ,
		output => 
	);


