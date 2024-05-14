library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port( 
    x             : in std_logic;            -- Photocell signal for entrance
    y             : in std_logic;            -- Photocell signal for exit
    clk           : in std_logic;            -- Clock signal
    reset         : in std_logic;            -- Reset signal
    max_occupancy : in std_logic_vector(7 downto 0);  -- Maximum occupancy threshold (8-bit signal)
    warning       : out std_logic            -- Signal indicating maximum occupancy reached
  );
end counter;

architecture counter_sample of counter is
  signal stored_value : unsigned(7 downto 0) := (others => '0');  -- Counter for tracking occupancy

begin
  -- Process for updating occupancy counter
  process(clk, reset)
  begin
    if reset = '1' then
      stored_value <= (others => '0');  -- Reset counter to initial state

    elsif rising_edge(clk) then
      if x = '1' then
        stored_value <= stored_value + 1;  -- Increment counter when someone enters the room
      elsif y = '1' then
        stored_value <= stored_value - 1;  -- Decrement counter when someone exits the room
      end if;
    end if;
  end process;

  -- Process for checking maximum occupancy threshold
  process(stored_value, max_occupancy)
  begin
    if stored_value = unsigned(max_occupancy) then
      warning <= '1';  -- Assert warning signal when occupancy reaches maximum
    else
      warning <= '0';  -- Clear warning signal when occupancy is below maximum
    end if;
  end process;

end architecture counter_sample;
