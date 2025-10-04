
import javax.swing.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class AnalizadorLexicografico {
    public AnalizadorLexicografico() {
    }

    public static void main(String[] args) throws IOException {
        /*try {
            FileReader f = new FileReader("C:\\Users\\facun\\IdeaProjects\\TrabajoIntegradorTEOI\\src\\prueba.txt");
            Lexico Lexer = new Lexico(f);
            Lexer.next_token();
        } catch (FileNotFoundException var3) {
            System.out.println("No se encontró el archivo");
        }*/
        JFrame frame = new JFrame("Analizador");
        frame.setContentPane(new GuiAnalizador().getVentana()); // panel raíz
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack(); // ajusta al contenido
        frame.setVisible(true); // <-- muy importante

    }
}