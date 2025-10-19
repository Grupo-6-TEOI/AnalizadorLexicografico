import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class TablaDeSimbolo {
    public static class Simbolo {
        public final String nombre;
        public final String token;
        public final String valor;
        public final Integer longitud;
        public final Integer linea;

        public Simbolo(String nombre, String token, String valor, Integer longitud, Integer linea) {
            this.nombre = nombre;
            this.token = token;
            this.valor = valor;
            this.longitud = longitud;
            this.linea = linea;
        }
    }

    private final Map<String, Simbolo> symbolsByKey;
    private static TablaDeSimbolo instance;

    private TablaDeSimbolo() {
        symbolsByKey = new LinkedHashMap<>();
    }

    public static synchronized TablaDeSimbolo getInstance() {
        if (instance == null) instance = new TablaDeSimbolo();
        return instance;
    }


    public synchronized void addSimbolo(String nombre, String token, String valor, Integer longitud, Integer linea) {
        String key = token + "|" + nombre + "|" + valor;
        if (!symbolsByKey.containsKey(key)) {
            symbolsByKey.put(key, new Simbolo(nombre, token, valor, longitud, linea));
        }
    }


    public synchronized void writeToFile() {
        String userDir = System.getProperty("user.dir");
        File outFile = new File(userDir, "src" + File.separator + "tabla_simbolos.txt");
        File parent = outFile.getParentFile();
        if (parent != null && !parent.exists()) parent.mkdirs();

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(outFile))) {
            bw.write(String.format("%-32s %-12s %-32s %-8s", "NOMBRE", "TOKEN", "VALOR", "LONGITUD"));
            bw.newLine();
            bw.write(String.format("%-32s %-12s %-32s %-8s", "------", "-----", "-----", "--------"));
            bw.newLine();

            for (Simbolo s : symbolsByKey.values()) {
                String longitudStr = s.longitud == null ? "-" : s.longitud.toString();
                String valor = s.valor == null ? "-" : s.valor;
                bw.write(String.format("%-32s %-12s %-32s %-8s", s.nombre, s.token, valor, longitudStr));
                bw.newLine();
            }
            bw.flush();
            System.out.println("Tabla de símbolos guardada en: " + outFile.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Error al escribir tabla de símbolos: " + e.getMessage());
        }
    }

    public synchronized List<Simbolo> getAllSymbols() {
        return new ArrayList<>(symbolsByKey.values());
    }
}




