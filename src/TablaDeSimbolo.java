import java_cup.runtime.Symbol;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class TablaDeSimbolo {
    public static class Simbolo {
        public final String nombre;
        public final String token;
        public String tipo;
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

        public void setType(String tipo) {
            this.tipo = tipo;
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
        String key = token + "|" + nombre;
        if (!symbolsByKey.containsKey(key)) {
            symbolsByKey.put(key, new Simbolo(nombre, token, valor, longitud, linea));
        }
    }

    public synchronized void addtype(Symbol simbolo, String tipo) {
        String key = sym.terminalNames[simbolo.sym] + "|" + simbolo.value;
        if (symbolsByKey.containsKey(key)) {
            Simbolo s = symbolsByKey.get(key);
            s.setType(tipo);
            symbolsByKey.put(key, s);
        } else {
            System.out.println("Advertencia: no se encontró símbolo para " + simbolo.value);
        }
    }


    public synchronized void writeToFile() {
        String userDir = System.getProperty("user.dir");
        File outFile = new File(userDir, "src" + File.separator + "tabla_simbolos.txt");
        File parent = outFile.getParentFile();
        if (parent != null && !parent.exists()) parent.mkdirs();

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(outFile))) {
            bw.write(String.format("%-32s %-20s %-10s %-30s %-10s",
                    "NOMBRE", "TOKEN", "TIPO", "VALOR", "LONGITUD"));
            bw.newLine();
            bw.write(String.format("%-32s %-20s %-10s %-30s %-10s",
                    "------", "-----", "----", "-----", "--------"));
            bw.newLine();

            for (Simbolo s : symbolsByKey.values()) {
                String longitudStr = s.longitud == null ? "-" : s.longitud.toString();
                String valor = s.valor == null ? "-" : s.valor;
                String tipo = s.tipo == null ? "-" : s.tipo;

                if ("CONST_STR".equals(s.token) && valor.startsWith("\"") && valor.endsWith("\"")) {
                    valor = valor.substring(1, valor.length() - 1);
                }

                if ("CONST_HEX".equals(s.token)) {
                    try {
                        int decimalValue = Integer.parseInt(valor.replace("0h", ""), 16);
                        valor = String.valueOf(decimalValue);
                    } catch (NumberFormatException e) {
                        // si hay error, lo dejamos como está
                    }
                }

                bw.write(String.format("%-32s %-20s %-10s %-30s %-10s",
                        s.nombre, s.token, tipo,  valor, longitudStr));
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




