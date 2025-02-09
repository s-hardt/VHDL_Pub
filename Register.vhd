LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY register_example IS
    PORT (
        enable   : IN std_logic;
        data_in  : IN std_logic_vector(3 DOWNTO 0);
        clk      : IN std_logic;
        reset    : IN std_logic;
        data_out : OUT std_logic_vector(3 DOWNTO 0)
    );
END register_example;

-- Simple register code to have 4 bits stored until reset
ARCHITECTURE behavior OF register_example IS
    SIGNAL data_int : std_logic_vector(3 DOWNTO 0);
BEGIN
    PROCESS (enable, data_in, reset)
    BEGIN
        IF reset = '1' THEN
            data_int <= "0000";
        ELSIF enable = '1' THEN
            data_int <= data_in;
        END IF;
    END PROCESS;

    data_out <= data_int;

END behavior;