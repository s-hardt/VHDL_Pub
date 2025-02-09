LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY traffic_light IS
    PORT (
        clk     : IN std_logic;
        reset   : IN std_logic;
        red     : OUT std_logic;
        yellow  : OUT std_logic;
        green   : OUT std_logic
    );
END traffic_light;

-- More advanced traffic light state machine
-- Clocking, transistion and output logic in different fsms
ARCHITECTURE fsm OF traffic_light IS
    TYPE state_type IS (RED, GREEN, YELLOW);
    SIGNAL current_state, next_state : state_type;

BEGIN
    -- State transition process
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            current_state <= RED;  -- Reset to RED state
        ELSIF rising_edge(clk) THEN
            next_state := current_state;
        END IF;
    END PROCESS;

    -- Next state logic
    PROCESS (current_state)
    BEGIN
        CASE current_state IS
            WHEN RED =>
                next_state <= GREEN;
            WHEN GREEN =>
                next_state <= YELLOW;
            WHEN YELLOW =>
                next_state <= RED;
            WHEN OTHERS =>
                next_state <= RED;
        END CASE;
    END PROCESS;

    -- Output logic
    PROCESS (current_state)
    BEGIN
        CASE current_state IS
            WHEN RED =>
                red <= '1';
            WHEN GREEN =>
                green <= '1';
            WHEN YELLOW =>
                yellow <= '1';
            WHEN OTHERS =>
                red <= '1';
        END CASE;
    END PROCESS;
END fsm;
