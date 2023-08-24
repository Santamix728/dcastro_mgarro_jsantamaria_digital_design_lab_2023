LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Definicion de la entidad para el sumador de cuatro bits
entity Adder is
	port( display_suma : out std_logic_vector (13 downto 0);
			a   		: in	STD_LOGIC_VECTOR(3 downto 0);
			b        : in	STD_LOGIC_VECTOR(3 downto 0);
	      ans		: buffer	STD_LOGIC_VECTOR(4 downto 0);
			cin      : in  STD_LOGIC
	    );
end Adder;

architecture STRUCTURE of Adder is

--Instancia al sumador de un bit
component BIT_ADDER
	port( a, b, cin		: in  STD_LOGIC;
	      sum, cout		: out STD_LOGIC );
end component;

--Conversor de binario a Hexadecimal

component display is
	     port (
				suma : in std_logic_vector (4 downto 0);
				hexa : out std_logic_vector (13 downto 0)
		  );
end component;

--Estructura del sumador de cutro bits segun el sumador de un bit, repite el sumador de un bit por cuatro veces
signal c0, c1, c2, c3, c4 : STD_LOGIC;
begin

c0 <= cin;
b_adder0: BIT_ADDER port map (a(0), b(0), c0, ans(0), c1);
b_adder1: BIT_ADDER port map (a(1), b(1), c1, ans(1), c2);
b_adder2: BIT_ADDER port map (a(2), b(2), c2, ans(2), c3);
b_adder3: BIT_ADDER port map (a(3), b(3), c3, ans(3), c4);

ans(4) <= c4;

-- Muestra en hexadeciaml el sumador de cuatro bits
disp: display port map(
		 hex => display_suma,
		 sum => ans
);

END STRUCTURE;
