import javax.swing.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

public class GuiAnalizador {
    private JButton ingresarButton;
    private JTextArea input;
    private JPanel areaTexto;
    private JPanel ventana;
    private JScrollPane scrollInput;
    private JTextArea output;
    private JScrollPane scrollOutput;
    Lexico lexer;

    public GuiAnalizador(){
        ingresarButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                ingresarTexto();
            }
        });
    }

    private void ingresarTexto(){
        try {
            Reader reader = new StringReader(input.getText());
            lexer = new Lexico(reader, this);
            output.setText("");
            lexer.next_token();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void mostrarTexto(String texto){
        output.setText(output.getText() + texto + "\n");
    }

    public JPanel getVentana(){
        return ventana;
    }
}
