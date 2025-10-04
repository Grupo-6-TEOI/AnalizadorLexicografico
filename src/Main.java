//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public Main() {
    }

    public static void main(String[] args) throws IOException {
        try {
            FileReader f = new FileReader("C:\\Users\\facun\\IdeaProjects\\TrabajoIntegradorTEOI\\src\\prueba.txt");
            Lexico Lexer = new Lexico(f);
            Lexer.next_token();
        } catch (FileNotFoundException var3) {
            System.out.println("No se encontró el archivo");
        }

    }
}