import java_cup.runtime.Symbol;

import javax.swing.*;
import java.awt.*;
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

//            Symbol s = lexer.next_token();
//            while (s.sym != sym.EOF) {
//                System.out.println(s.sym + " -> " + s.value + " - " + s.left + " - " + s.right);
//                s = lexer.next_token();
//            }

            Sintactico sintactico = new Sintactico(lexer);
            sintactico.parse();
            ingresarButton.setBackground(Color.green);
            System.out.println("Análisis completado sin errores.");
            TablaDeSimbolo ts = TablaDeSimbolo.getInstance();
            ts.writeToFile();
        } catch (Exception e) {
            System.out.println("error al analizar: " + e.toString());;
            ingresarButton.setBackground(Color.green);
            e.printStackTrace();
        }
    }

    public void mostrarTexto(String texto){
        output.append(texto + "\n");
    }

    public JPanel getVentana(){
        return ventana;
    }
}
