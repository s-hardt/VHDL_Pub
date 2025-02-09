LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY lfsr IS
    PORT (
        clk     : IN std_logic;
        reset   : IN std_logic;
        out_sig : OUT std_logic_vector(3 DOWNTO 0)
    );
END lfsr;

-- LFSR Example with the following Polynom:
-- P(x) = x^8+x^6+x^5+x^3+1
ARCHITECTURE behavior OF lfsr IS
    SIGNAL lfsr_reg : std_logic_vector(7 DOWNTO 0) := "0001";
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            lfsr_reg <= "0000";
        ELSIF rising_edge(clk) THEN
            lfsr_reg(7) <= lfsr_reg(6);
            lfsr_reg(6) <= lfsr_reg(5);
            lfsr_reg(5) <= lfsr_reg(4);
            lfsr_reg(4) <= lfsr_reg(3);
            lfsr_reg(3) <= lfsr_reg(2);
            lfsr_reg(2) <= lfsr_reg(1);
            lfsr_reg(1) <= lfsr_reg(0);
            lfsr_reg(0) <= lfsr_reg(8) XOR lfsr_reg(7) XOR lfsr_reg(4) XOR lfsr_reg(2);
        END IF;
    END PROCESS;

    out_sig <= lfsr_reg;
END behavior;
