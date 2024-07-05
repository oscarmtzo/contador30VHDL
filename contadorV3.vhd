library ieee;
use ieee.std_logic_1164.all;

entity contador_30_seg is
port(
    -- Inicialización de 5 bits de entrada para 32 posibles valores
    bit_a : in std_logic;
    bit_b : in std_logic;
    bit_c : in std_logic;
    bit_d : in std_logic;
    bit_e : in std_logic;

    -- Inicialización de salidas hacia display 1 de 7 segmentos para decenas
    bit_decena_a_salida : out std_logic;
    bit_decena_b_salida : out std_logic;
    bit_decena_c_salida : out std_logic;
    bit_decena_d_salida : out std_logic;
    bit_decena_e_salida : out std_logic;
    bit_decena_f_salida : out std_logic;
    bit_decena_g_salida : out std_logic;
    
    -- Inicialización de salidas hacia display 2 de 7 segmentos para unidades
    bit_unidad_a_salida : out std_logic;
    bit_unidad_b_salida : out std_logic;
    bit_unidad_c_salida : out std_logic;
    bit_unidad_d_salida : out std_logic;
    bit_unidad_e_salida : out std_logic;
    bit_unidad_f_salida : out std_logic;
    bit_unidad_g_salida : out std_logic
);
end contador_30_seg;

architecture Behavior of contador_30_seg is
    -- Señal interna para concatenar valores de la entrada
    signal in_bits : std_logic_vector(4 downto 0);

    -- Señales internas para los segmentos de los displays
    signal out_bits_display_decenas : std_logic_vector(6 downto 0);
    signal out_bits_display_unidades : std_logic_vector(6 downto 0);

begin
    -- Concatenación de las señales de entrada
    in_bits <= bit_a & bit_b & bit_c & bit_d & bit_e;

    -- Proceso para manejar las decenas
    process(in_bits)
    begin
        case in_bits is
            when "00000" =>
                out_bits_display_decenas <= "1111110"; -- Ejemplo: 0 en display de 7 segmentos
            when others =>
                out_bits_display_decenas <= "0000000"; -- Apagar el display o algún otro valor
        end case;
    end process;

    -- Asignación de los bits internos del display de decenas a las salidas
    bit_decena_a_salida <= out_bits_display_decenas(6);
    bit_decena_b_salida <= out_bits_display_decenas(5);
    bit_decena_c_salida <= out_bits_display_decenas(4);
    bit_decena_d_salida <= out_bits_display_decenas(3);
    bit_decena_e_salida <= out_bits_display_decenas(2);
    bit_decena_f_salida <= out_bits_display_decenas(1);
    bit_decena_g_salida <= out_bits_display_decenas(0);

    -- Proceso para manejar las unidades
    process(in_bits)
    begin
        case in_bits is
            when "00000" =>
                out_bits_display_unidades <= "1111110"; -- Ejemplo: 0 en display de 7 segmentos
            when others =>
                out_bits_display_unidades <= "0000000"; -- Apagar el display o algún otro valor
        end case;
    end process;

    -- Asignación de los bits internos del display de unidades a las salidas
    bit_unidad_a_salida <= out_bits_display_unidades(6);
    bit_unidad_b_salida <= out_bits_display_unidades(5);
    bit_unidad_c_salida <= out_bits_display_unidades(4);
    bit_unidad_d_salida <= out_bits_display_unidades(3);
    bit_unidad_e_salida <= out_bits_display_unidades(2);
    bit_unidad_f_salida <= out_bits_display_unidades(1);
    bit_unidad_g_salida <= out_bits_display_unidades(0);

end Behavior;
