LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY loop_example IS
    PORT (
        clk     : IN std_logic;
        reset   : IN std_logic;
        out_sig : OUT std_logic_vector(3 DOWNTO 0)
        out_var : OUT std_logic_vector(3 DOWNTO 0)
    );
END loop_example;

-- Simple loop example with different types of loops
-- What is the result of both?
ARCHITECTURE behavior OF loop_example IS
    SIGNAL sig_counter : std_logic_vector(3 DOWNTO 0) := "0000";
    SIGNAL sig_var : std_logic_vector(3 DOWNTO 0) := "0000";
BEGIN
    PROCESS (clk, reset)
        VARIABLE var_counter : integer := 0;
    BEGIN
        IF reset = '1' THEN
            sig_counter <= "0000";
            sig_var <= "0000";
        ELSIF rising_edge(clk) THEN
            -- FOR loop with a signal
            FOR i IN 0 TO 3 LOOP
                sig_counter <= std_logic_vector(unsigned(sig_counter) + 1);
            END LOOP;

            -- WHILE loop with a variable
            var_counter := 0;
            WHILE var_counter < 4 LOOP
                var_counter := var_counter + 1;
            END LOOP;
            sig_var <= var_counter;
        END IF;
    END PROCESS;

    out_sig <= sig_counter;
    out_var <= sig_var;
END behavior;
