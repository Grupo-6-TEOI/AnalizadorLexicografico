
import javax.swing.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class AnalizadorLexicografico {
    public AnalizadorLexicografico() {
    }

    public static void main(String[] args) throws IOException {
        JFrame frame = new JFrame("Analizador");
        frame.setContentPane(new GuiAnalizador().getVentana());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);

    }
}