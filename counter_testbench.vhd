library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end counter_tb;

architecture tb_arch of counter_tb is
    constant CLOCK_PERIOD : time := 10 ns;
    signal x, y, clk, reset, warning : std_logic := '0';
    signal max_occupancy : std_logic_vector(7 downto 0) := (others => '0');
begin
    UUT: entity work.counter
        port map (
            x             => x,
            y             => y,
            clk           => clk,
            reset         => reset,
            max_occupancy => max_occupancy,
            warning       => warning
        );

    -- Clock generation
    clk_process: process
    begin
        clk <= '0';
        while now < 2000 ns loop 
            clk <= not clk; wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Initial setup
        reset <= '1'; max_occupancy <= "00000100"; -- Testing max occupancy of 4
        wait for CLOCK_PERIOD * 2; reset <= '0';
        
        -- Trial 1: Increment the counter within limits
        x <= '1'; wait for CLOCK_PERIOD; x <= '0'; wait for CLOCK_PERIOD;
        
        -- Trial 2: Decrement the counter
        y <= '1'; wait for CLOCK_PERIOD; y <= '0'; wait for CLOCK_PERIOD;
        
        -- Trial 3: Attempt to exceed the maximum occupancy
        for i in 1 to 5 loop -- 5 attempts to enter
            x <= '1'; wait for CLOCK_PERIOD; x <= '0'; wait for CLOCK_PERIOD;
        end loop;
        
        -- Trial 4: Reduce occupancy and attempt re-entry
        y <= '1'; wait for CLOCK_PERIOD; y <= '0'; wait for CLOCK_PERIOD; -- One exit
        x <= '1'; wait for CLOCK_PERIOD; x <= '0'; wait for CLOCK_PERIOD; -- Attempt re-entry
        
        -- Trial 5: Rapid entries and exits
        for i in 1 to 3 loop -- Simulate rapid movements
            x <= '1'; wait for CLOCK_PERIOD / 4; x <= '0'; y <= '1'; wait for CLOCK_PERIOD / 4; y <= '0'; 
            wait for CLOCK_PERIOD; -- Ensure clock ticks
        end loop;

        -- Trial 6: Reset and rapid fill to max
        reset <= '1'; wait for CLOCK_PERIOD; reset <= '0'; wait for CLOCK_PERIOD;
        for i in 1 to 4 loop -- Fill to max quickly
            x <= '1'; wait for CLOCK_PERIOD; x <= '0'; wait for CLOCK_PERIOD;
        end loop;
        
        -- Trial 7: Test with reset during operation
        x <= '1'; wait for CLOCK_PERIOD / 2; reset <= '1'; wait for CLOCK_PERIOD / 2;
        reset <= '0'; x <= '0';
        
	-- Trial 8: Trial for max capacity of 2
	reset <= '1'; wait for CLOCK_PERIOD * 2; reset <= '0'; -- Reset the system
	max_occupancy <= "00000010"; -- Set max capacity to 2
	wait for CLOCK_PERIOD * 2;

	-- Trial 9: Attempt to fill to max capacity
	x <= '1'; wait for CLOCK_PERIOD; x <= '0'; -- Entry 1
	wait for CLOCK_PERIOD;
	x <= '1'; wait for CLOCK_PERIOD; x <= '0'; -- Entry 2
	wait for CLOCK_PERIOD;

	-- Trial 10: Attempt to exceed max capacity
	x <= '1'; wait for CLOCK_PERIOD; x <= '0';
	wait for CLOCK_PERIOD;

	-- Trial 11: Reset for next trial
	reset <= '1'; wait for CLOCK_PERIOD * 2; reset <= '0';
	wait for CLOCK_PERIOD * 2;

	-- Trial 12: Trial for max capacity of 8
	max_occupancy <= "00001000"; -- Set max capacity to 8
	wait for CLOCK_PERIOD * 2;

	-- Trial 13: Attempt to fill to max capacity
	for i in 1 to 8 loop
	    x <= '1'; wait for CLOCK_PERIOD; x <= '0'; wait for CLOCK_PERIOD; 
	end loop;

	-- Trial 14: Attempt to exceed max capacity
	x <= '1'; wait for CLOCK_PERIOD; x <= '0';
	wait for CLOCK_PERIOD;

        -- Wait and finish
        wait for 100 ns;
        wait;
    end process;

end tb_arch;

