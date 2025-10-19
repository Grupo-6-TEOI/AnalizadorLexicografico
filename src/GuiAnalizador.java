import javax.swing.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.*;


public class GuiAnalizador {
    private JButton ingresarButton;
    private JTextArea input;
    private JPanel areaTexto;
    private JPanel ventana;
    private JScrollPane scrollInput;
    private JTextArea output;
    private JScrollPane scrollOutput;
    private JButton abrirArchivoButton;
    private JLabel inputLabel;
    Lexico lexer;

    public GuiAnalizador(){
        ingresarButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                ingresarTexto();
            }
        });
        abrirArchivoButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                String ubicacion = JOptionPane.showInputDialog(null, "Ingrese la ubicacion del archivo:","src/prueba.txt");
                ingresarArchivo(ubicacion);
            }
        });
    }

    private void ingresarArchivo(String ubicacionArchivo) {
        try {
            FileReader fr = new FileReader(ubicacionArchivo);
            BufferedReader br = new BufferedReader(fr);

            StringBuilder contenido = new StringBuilder();
            String linea;


            while ((linea = br.readLine()) != null) {
                contenido.append(linea).append("\n");
            }

            br.close();

            input.setText(contenido.toString());
        } catch (IOException e) {
            JOptionPane.showMessageDialog(null, "Archivo no encontrado");
            throw new RuntimeException(e);
        }
    }

    private void ingresarTexto(){
        try {
            Reader reader = new StringReader(input.getText());
            lexer = new Lexico(reader);
            lexer.setGui(this);
            output.setText("");
            while (lexer.next_token() != null) {}
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void mostrarTexto(String texto){
        output.append(texto + "\n");
    }

    public JPanel getVentana(){
        return ventana;
    }
}
