library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_testbench is
--  Port ( );
end seven_segment_testbench;

architecture Behavioral of seven_segment_testbench is
component seven_segment_display_VHDL is
    Port ( clock_100Mhz : in STD_LOGIC;-- 100Mhz clock on Basys 3 FPGA board
           reset : in STD_LOGIC; -- reset
           Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);-- 4 Anode signals
           LED_out : out STD_LOGIC_VECTOR (6 downto 0));-- Cathode patterns of 7-segment display
end component;
signal CLK: STD_logic := '0';
signal RESET: STD_logic :='0';
signal Anode_Active: STD_logic_vector (3 downto 0);
signal LED_O: STD_logic_vector (6 downto 0);
begin
dut:seven_segment_display_VHDL
port map (
clock_100Mhz => CLK,
reset => RESET,
Anode_Activate => Anode_Active,
LED_out => LED_O
);

CLK <= not CLK after 5ns;
process
begin
reset <= '1';
wait for 10ns;
reset <= '0';
wait;
end process;
end Behavioral;