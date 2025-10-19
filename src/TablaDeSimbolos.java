import java.io.*;
import java.util.LinkedHashMap;
import java.util.Map;

public class TablaDeSimbolos {

    private final Map<String, EntradaSimbolo> tabla = new LinkedHashMap<>();

    private static class EntradaSimbolo {
        String nombre;
        String token;
        String valor;
        String longitud;

        EntradaSimbolo(String nombre, String token, String valor, String longitud) {
            this.nombre = nombre;
            this.token = token;
            this.valor = valor;
            this.longitud = longitud;
        }
    }

    public void agregarSimbolo(String nombre, String token, String valor, String longitud) {
        if (tabla.containsKey(nombre)) return;

        if (valor != null && valor.startsWith("\"") && valor.endsWith("\"")) {
            valor = valor.substring(1, valor.length() - 1);
        }
        if (valor != null && valor.matches("0h[0-9a-fA-F]+")) {
            valor = String.valueOf(Integer.parseInt(valor.substring(2), 16));
        }

        tabla.put(nombre, new EntradaSimbolo(nombre, token, valor, longitud));
    }

    public void guardarEnArchivo() {
        try {
            File carpetaSrc = new File("src");
            if (!carpetaSrc.exists()) carpetaSrc.mkdirs();
            File archivo = new File(carpetaSrc, "tabla_de_simbolos.txt");

            try (PrintWriter writer = new PrintWriter(new FileWriter(archivo))) {
                writer.printf("%-32s%-12s%-32s%-10s%n", "NOMBRE", "TOKEN", "VALOR", "LONGITUD");
                writer.printf("%-32s%-12s%-32s%-10s%n", "------", "-----", "-----", "--------");

                for (EntradaSimbolo e : tabla.values()) {
                    writer.printf("%-32s%-12s%-32s%-10s%n",
                            e.nombre,
                            e.token,
                            (e.valor != null ? e.valor : "-"),
                            (e.longitud != null ? e.longitud : "-"));
                }
            }

        } catch (IOException ignored) {}
    }
}




