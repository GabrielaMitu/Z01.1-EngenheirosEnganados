-- Elementos de Sistemas
-- by Luciano Soares
-- ALU.vhd

-- Unidade L�gica Aritm�tica (ULA)
-- Recebe dois valores de 16bits e
-- calcula uma das seguintes fun��es:
-- X+y, x-y, y-x, 0, 1, -1, x, y, -x, -y,
-- X+1, y+1, x-1, y-1, x&y, x|y
-- De acordo com os 6 bits de entrada denotados:
-- zx, nx, zy, ny, f, no.
-- Tamb�m calcula duas sa�das de 1 bit:
-- Se a sa�da == 0, zr � definida como 1, sen�o 0;
-- Se a sa�da <0, ng � definida como 1, sen�o 0.
-- a ULA opera sobre os valores, da seguinte forma:
-- se (zx == 1) ent�o x = 0
-- se (nx == 1) ent�o x =! X
-- se (zy == 1) ent�o y = 0
-- se (ny == 1) ent�o y =! Y
-- se (f == 1) ent�o sa�da = x + y
-- se (f == 0) ent�o sa�da = x & y
-- se (no == 1) ent�o sa�da = !sa�da
-- se (out == 0) ent�o zr = 1
-- se (out <0) ent�o ng = 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	port (
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC_VECTOR(1 downto 0);  -- se 0 calcula x & y, senão x + y
			no:    in STD_LOGIC;                     -- inverte o valor da saída
			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
			ng:    out STD_LOGIC;                    -- setado se saída é negativa
			carry : out std_logic;
			saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
	);
end entity;

architecture  rtl OF alu is

	component zerador16 IS
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	component inversor16 is
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Add16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			b   :  in STD_LOGIC_VECTOR(15 downto 0);
			q   : out STD_LOGIC_VECTOR(15 downto 0);
			carryout   : out STD_LOGIC
		);
	end component;

	component And16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component comparador16 is
		port(
			a   : in STD_LOGIC_VECTOR(15 downto 0);
			zr   : out STD_LOGIC;
			ng   : out STD_LOGIC
    	);
	end component;

	component Mux16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
    end component;
    
	component left16 is
        port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
        );
	end component;
	
	component right16 is
        port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

   SIGNAL zxout,zyout,nxout,nyout,andout,adderout,leftout,rightout,muxout,precomp: STD_LOGIC_VECTOR(15 downto 0);
   SIGNAL carrout: STD_LOGIC;
	
begin
	
	zeradorX: zerador16
	port map
	(
		z => zx,
		a => x,
		y => zxout
	);

	inversorX: inversor16
	port map
	(
		z => nx,
		a => zxout,
		y => nxout
	);

	zeradorY: zerador16
	port map
	(
		z => zy,
		a => y,
		y => zyout
	);

	inversorY: inversor16
	port map
	(
		z => ny,
		a => zyout,
		y => nyout
	);

	andXY: And16
	port map
	(
		a => nxout,
		b => nyout,
		q => andout
	);

	addXY: Add16
	port map
	(
		a => nxout,
		b => nyout,
		q => adderout,
		carryout => carry
    );

    leftX: left16
	port map
	(
		a => nxout,
		q => leftout
    );
    
  rightX: right16
	port map
	(
		a => nxout,
		q => rightout
	);

	Mux: Mux16
	port map
	(
		a => andout,
		b => adderout,
		c => rightout,
		d => leftout,
		sel => f,
		q => muxout
	);

	inversorXY: inversor16
	port map
	(
		z => no,
		a => muxout,
		y => precomp
	);

	comparadorXY: comparador16
	port map
	(
		a => precomp,
		zr => zr,
		ng => ng
	);

	saida <= precomp;

end architecture;