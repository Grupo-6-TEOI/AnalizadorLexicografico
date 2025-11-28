import java_cup.runtime.Symbol;
import java.io.Reader;

class SintacticoTraceable extends Sintactico {

    private GuiAnalizador gui;

    public SintacticoTraceable(Lexico lexico, GuiAnalizador gui) {
        super(lexico);
        this.gui = gui;

    }

    // en caso de ejectar en debug imprimir el resultado en ventana
    @Override
    public void debug_message(String mess) {
        if (gui != null) {
            gui.mostrarTextoSintactico(mess);
        }
    }

    @Override
    public void done_parsing() {
        super.done_parsing();
        if (gui != null) {
            gui.mostrarTextoSintactico("--- ANALISIS SINTACTICO COMPLETADO ---");
        }
    }
    //s.left y s.right denotan inicio y final de linea de error
    @Override
    public void syntax_error(Symbol s) {
        if (s != null){
            String errorMsg = "ERROR de sintaxis en línea " + (s.left + 1) +
                    ", columna " + s.right
                    + ", token: " + s.value;
            if (gui != null) {
                gui.mostrarTextoSintactico(errorMsg);
            }
            System.out.println(errorMsg);
        }
    }
}