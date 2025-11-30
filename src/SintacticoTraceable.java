import java_cup.runtime.Symbol;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SintacticoTraceable extends Sintactico {

    private GuiAnalizador gui;

    private final String[] ruleNames = new String[] {
            "$START ::= Programa EOF",
            "Programa ::= Declaraciones ProgramaPrincipal",
            "Programa ::= ProgramaSecundario",
            "Declaraciones ::= DEC_VAR ListaDeclaraciones END_DEC_VAR",
            "ListaDeclaraciones ::= ListaDeclaraciones Declaracion",
            "ListaDeclaraciones ::= Declaracion",
            "Declaracion ::= ID DATA_TYPE_ASSIGN Tipo",
            "Tipo ::= PR_INT",
            "Tipo ::= PR_FLOAT",
            "Tipo ::= PR_STRING",
            "ProgramaPrincipal ::= PR_PROGRAM Sentencias PR_ENDPROGRAM",
            "ProgramaSecundario ::= PR_PROGRAM ShowsEspeciales PR_ENDPROGRAM",
            "ShowsEspeciales ::= ShowsEspeciales BloqueShowEspecial",
            "ShowsEspeciales ::= BloqueShowEspecial",
            "BloqueShowEspecial ::= SHOW ExpresionShowEspecial",
            "ExpresionShowEspecial ::= CONST_STR",
            "ExpresionShowEspecial ::= CONST_INT",
            "ExpresionShowEspecial ::= CONST_FLOAT",
            "ExpresionShowEspecial ::= CONST_HEX",
            "Sentencias ::= Sentencias Sentencia",
            "Sentencias ::= Sentencia",
            "Sentencia ::= Asignacion",
            "Sentencia ::= BloqueFor",
            "Sentencia ::= BloqueIf",
            "Sentencia ::= BloqueRepeat",
            "Sentencia ::= BloqueShow",
            "Asignacion ::= ID ASIGN Expresion",
            "Expresion ::= Expresion SUMA Termino",
            "Expresion ::= Expresion RESTA Termino",
            "Expresion ::= Termino",
            "Termino ::= Termino MULT Factor",
            "Termino ::= Termino DIV Factor",
            "Termino ::= Factor",
            "Factor ::= PAREN_A Expresion PAREN_C",
            "Factor ::= ID",
            "Factor ::= CONST_INT",
            "Factor ::= CONST_FLOAT",
            "Factor ::= CONST_HEX",
            "Factor ::= CONST_STR",
            "BloqueFor ::= PR_FOR ID PR_IS PR_RANGE CLASP_A Expresion CLASP_C KEY_A PR_STEP CONST_INT KEY_C Sentencias PR_NEXT ID",
            "BloqueFor ::= PR_FOR ID PR_IS PR_RANGE CLASP_A Expresion CLASP_C Sentencias PR_NEXT ID",
            "BloqueIf ::= PR_IF PAREN_A Condicion PAREN_C Sentencias PR_ELSE Sentencias PR_ENDIF",
            "BloqueIf ::= PR_IF PAREN_A Condicion PAREN_C Sentencias PR_ENDIF",
            "BloqueRepeat ::= PR_REPEAT Sentencias PR_UNTIL PAREN_A Condicion PAREN_C",
            "ExpresionShow ::= CONST_STR",
            "ExpresionShow ::= ID",
            "ExpresionShow ::= CONST_INT",
            "ExpresionShow ::= CONST_FLOAT",
            "ExpresionShow ::= CONST_HEX",
            "BloqueShow ::= SHOW ExpresionShow",
            "Condicion ::= NOT PAREN_A Comparacion PAREN_C",
            "Condicion ::= PAREN_A Comparacion PAREN_C AND PAREN_A Comparacion PAREN_C",
            "Condicion ::= PAREN_A Comparacion PAREN_C OR PAREN_A Comparacion PAREN_C",
            "Condicion ::= PAREN_A Comparacion PAREN_C",
            "Condicion ::= Comparacion",
            "Comparacion ::= Expresion OperadorComparacion Expresion",
            "OperadorComparacion ::= IGUAL",
            "OperadorComparacion ::= MENOR",
            "OperadorComparacion ::= MAYOR",
            "OperadorComparacion ::= MENOR_IGUAL",
            "OperadorComparacion ::= MAYOR_IGUAL",
            "OperadorComparacion ::= DISTINTO"
    };

    public SintacticoTraceable(Lexico lexico, GuiAnalizador gui) {
        super(lexico);
        this.gui = gui;
    }

    // Helper interface for replacement logic
    interface Replacer {
        String getName(int index);
    }

    // Generic replace function
    class MessageReplacer {
        String replace(String input, String patternStr, Replacer replacer) {
            Pattern pattern = Pattern.compile(patternStr);
            Matcher matcher = pattern.matcher(input);
            StringBuffer sb = new StringBuffer();
            while (matcher.find()) {
                int index = Integer.parseInt(matcher.group(1));
                String name = replacer.getName(index);
                if (name != null) {
                    // Get the full match
                    String match = matcher.group(0);
                    // Replace the #number part with the name
                    // We assume the pattern always ends with #number corresponding to group 1
                    String numberStr = "#" + index;
                    String replacement = match.replace(numberStr, " " + name);
                    matcher.appendReplacement(sb, Matcher.quoteReplacement(replacement));
                } else {
                    matcher.appendReplacement(sb, matcher.group(0));
                }
            }
            matcher.appendTail(sb);
            return sb.toString();
        }
    }

    // en caso de ejectar en debug imprimir el resultado en ventana
    @Override
    public void debug_message(String mess) {
        if (gui != null) {
            String readableMessage = mess;

            MessageReplacer mr = new MessageReplacer();

            // Reemplazar tokens/terminales
            Replacer tokenReplacer = index -> (index >= 0 && index < sym.terminalNames.length)
                    ? sym.terminalNames[index]
                    : null;

            readableMessage = mr.replace(readableMessage, "term #(\\d+)", tokenReplacer);
            readableMessage = mr.replace(readableMessage, "sym #(\\d+)", tokenReplacer);
            readableMessage = mr.replace(readableMessage, "token (?:is )?#(\\d+)", tokenReplacer);
            readableMessage = mr.replace(readableMessage, "[Ss]ymbol (?:is )?#(\\d+)", tokenReplacer);

            // Reemplazar reglas/producciones (rule #, prod #)
            Replacer ruleReplacer = index -> (index >= 0 && index < ruleNames.length) ? ruleNames[index] : null;

            readableMessage = mr.replace(readableMessage, "rule #(\\d+)", ruleReplacer);
            readableMessage = mr.replace(readableMessage, "prod #(\\d+)", ruleReplacer);

            gui.mostrarTextoSintactico(readableMessage);
        }
    }

    @Override
    public void done_parsing() {
        super.done_parsing();
        if (gui != null) {
            gui.mostrarTextoSintactico("--- ANALISIS SINTACTICO COMPLETADO ---");
        }
    }

    // s.left y s.right denotan inicio y final de linea de error
    @Override
    public void syntax_error(Symbol s) {
        if (s != null) {
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