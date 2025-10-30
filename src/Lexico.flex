import java_cup.runtime.*;
import java.util.*;
import java.io.*;

%%

%cup
%public
%class Lexico
%line
%column
%char

%{
    // ===== Código Java insertado dentro de la clase generada =====

    // Instancia única de la tabla de símbolos (Singleton)
    private final TablaDeSimbolo tabla = TablaDeSimbolo.getInstance();
    private GuiAnalizador guiAnalizador;

    public void setGui(GuiAnalizador a) {
            this.guiAnalizador = a;
        }

    // Método auxiliar para agregar símbolos fácilmente
    private void agregarSimbolo(String nombre, String token, String valor) {
        tabla.addSimbolo(nombre, token, valor, nombre.length(), yyline + 1);
    }
%}


LETRA = [a-zA-Z]
DIGITO = [0-9]
ESPACIO = [ \t\f\n\r\n]+
ID = {LETRA} ({LETRA}|{DIGITO}|_)*

CONST_HEX = (0h[0-9A-Fa-f]+)
CONST_INT = {DIGITO}+
CONST_FLOAT = ({DIGITO}+"."{DIGITO}* | "."{DIGITO}+)
CONST_STR = \"({DIGITO}|{LETRA}|{ESPACIO})*\"
COMENTARIO = "$*"({LETRA}|{DIGITO}|{ESPACIO})*"*$" | "$*"({LETRA}|{DIGITO}|{ESPACIO})*"$*"({LETRA}|{DIGITO}|{ESPACIO})*"*$"({LETRA}|{DIGITO}|{ESPACIO})*"*$"


%%

<YYINITIAL> {

":"         { guiAnalizador.mostrarTexto("Token DATA_TYPE_ASSIGN encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DATA_TYPE_ASSIGN", null);
               return new Symbol(sym.DATA_TYPE_ASSIGN, yyline, yycolumn, yytext());
      }

"="         { guiAnalizador.mostrarTexto("Token ASIGN encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "ASIGN", null);
              return new Symbol(sym.ASIGN, yyline, yycolumn, yytext());
      }

"+"         { guiAnalizador.mostrarTexto("Token SUMA encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "SUMA", null);
              return new Symbol(sym.SUMA, yyline, yycolumn, yytext()); }

"-"         { guiAnalizador.mostrarTexto("Token RESTA encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "RESTA", null);
              return new Symbol(sym.RESTA, yyline, yycolumn, yytext()); }

"*"         { guiAnalizador.mostrarTexto("Token MULT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MULT", null);
              return new Symbol(sym.MULT, yyline, yycolumn, yytext()); }

"/"         { guiAnalizador.mostrarTexto("Token DIV encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DIV", null);
              return new Symbol(sym.DIV, yyline, yycolumn, yytext()); }

"%"         { guiAnalizador.mostrarTexto("Token MOD encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MOD", null);
              return new Symbol(sym.MOD, yyline, yycolumn, yytext()); }

"^"         { guiAnalizador.mostrarTexto("Token POT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "POT", null);
              return new Symbol(sym.POT, yyline, yycolumn, yytext()); }

"DECVAR"    { guiAnalizador.mostrarTexto("Token DEC_VAR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DEC_VAR", null);
              return new Symbol(sym.DEC_VAR, yyline, yycolumn, yytext()); }

"ENDDECVAR" { guiAnalizador.mostrarTexto("Token END_DEC_VAR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "END_DEC_VAR", null);
              return new Symbol(sym.END_DEC_VAR, yyline, yycolumn, yytext()); }

"FOR"       { guiAnalizador.mostrarTexto("Token PR_FOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_FOR", null);
              return new Symbol(sym.PR_FOR, yyline, yycolumn, yytext()); }

"IS"        { guiAnalizador.mostrarTexto("Token PR_IS encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_IS", null);
              return new Symbol(sym.PR_IS, yyline, yycolumn, yytext()); }

"RANGE"     { guiAnalizador.mostrarTexto("Token PR_RANGE encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_RANGE", null);
              return new Symbol(sym.PR_RANGE, yyline, yycolumn, yytext()); }

"STEP"      { guiAnalizador.mostrarTexto("Token PR_STEP encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_STEP", null);
              return new Symbol(sym.PR_STEP, yyline, yycolumn, yytext()); }

"NEXT"      { guiAnalizador.mostrarTexto("Token PR_NEXT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_NEXT", null);
              return new Symbol(sym.PR_NEXT, yyline, yycolumn, yytext()); }

"if"|"IF"   { guiAnalizador.mostrarTexto("Token PR_IF encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_IF", null);
              return new Symbol(sym.PR_IF, yyline, yycolumn, yytext()); }

"else"|"ELSE" { guiAnalizador.mostrarTexto("Token PR_ELSE encontrado, Lexema "+ yytext());
                agregarSimbolo(yytext(), "PR_ELSE", null);
              return new Symbol(sym.PR_ELSE, yyline, yycolumn, yytext()); }

"ENDIF"     { guiAnalizador.mostrarTexto("Token PR_ENDIF encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_ENDIF", null);
              return new Symbol(sym.PR_ENDIF, yyline, yycolumn, yytext()); }

"REPEAT"    { guiAnalizador.mostrarTexto("Token PR_REPEAT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_REPEAT", null);
              return new Symbol(sym.PR_REPEAT, yyline, yycolumn, yytext()); }

"UNTIL"     { guiAnalizador.mostrarTexto("Token PR_UNTIL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_UNTIL", null);
              return new Symbol(sym.PR_UNTIL, yyline, yycolumn, yytext()); }

"PROGRAM.SECTION"     { guiAnalizador.mostrarTexto("Token PR_PROGRAM encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_PROGRAM", null);
              return new Symbol(sym.PR_PROGRAM, yyline, yycolumn, yytext()); }

"ENDPROGRAM.SECTION"     { guiAnalizador.mostrarTexto("Token PR_ENDPROGRAM encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_ENDPROGRAM", null);
              return new Symbol(sym.PR_ENDPROGRAM, yyline, yycolumn, yytext()); }

"int"|"INT"  { guiAnalizador.mostrarTexto("Token PR_INT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_INT", null);
              return new Symbol(sym.PR_INT, yyline, yycolumn, yytext()); }

"float"|"FLOAT" { guiAnalizador.mostrarTexto("Token PR_FLOAT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_FLOAT", null);
              return new Symbol(sym.PR_FLOAT, yyline, yycolumn, yytext()); }

"string"|"STRING" { guiAnalizador.mostrarTexto("Token PR_STRING encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_STRING", null);
              return new Symbol(sym.PR_STRING, yyline, yycolumn, yytext()); }

"show"|"SHOW"      { guiAnalizador.mostrarTexto("Token SHOW encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "SHOW", null);
              return new Symbol(sym.SHOW, yyline, yycolumn, yytext()); }

"["         { guiAnalizador.mostrarTexto("Token CLASP_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CLASP_A", null);
              return new Symbol(sym.CLASP_A, yyline, yycolumn, yytext()); }

"]"         { guiAnalizador.mostrarTexto("Token CLASP_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CLASP_C", null);
              return new Symbol(sym.CLASP_C, yyline, yycolumn, yytext()); }

"("         { guiAnalizador.mostrarTexto("Token PAREN_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PAREN_A", null);
              return new Symbol(sym.PAREN_A, yyline, yycolumn, yytext()); }

")"         { guiAnalizador.mostrarTexto("Token PAREN_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PAREN_C", null);
              return new Symbol(sym.PAREN_C, yyline, yycolumn, yytext()); }

"{"         { guiAnalizador.mostrarTexto("Token KEY_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "KEY_A", null);
              return new Symbol(sym.KEY_A, yyline, yycolumn, yytext()); }

"}"         { guiAnalizador.mostrarTexto("Token KEY_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "KEY_C", null);
              return new Symbol(sym.KEY_C, yyline, yycolumn, yytext()); }

"."         { guiAnalizador.mostrarTexto("Token PUNTO encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PUNTO", null);
              return new Symbol(sym.PUNTO, yyline, yycolumn, yytext()); }

","         { guiAnalizador.mostrarTexto("Token COMA encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "COMA", null);
              return new Symbol(sym.COMA, yyline, yycolumn, yytext()); }

"=="        { guiAnalizador.mostrarTexto("Token IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "IGUAL", null);
              return new Symbol(sym.IGUAL, yyline, yycolumn, yytext()); }

"<="        { guiAnalizador.mostrarTexto("Token MENOR_IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MENOR_IGUAL", null);
              return new Symbol(sym.MENOR_IGUAL, yyline, yycolumn, yytext()); }

">="        { guiAnalizador.mostrarTexto("Token MAYOR_IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MAYOR_IGUAL", null);
              return new Symbol(sym.MAYOR_IGUAL, yyline, yycolumn, yytext()); }

"<"         { guiAnalizador.mostrarTexto("Token MENOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MENOR", null);
              return new Symbol(sym.MENOR, yyline, yycolumn, yytext()); }

">"         { guiAnalizador.mostrarTexto("Token MAYOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MAYOR", null);
              return new Symbol(sym.MAYOR, yyline, yycolumn, yytext()); }

"||"         { guiAnalizador.mostrarTexto("Token OR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "OR", null);
              return new Symbol(sym.OR, yyline, yycolumn, yytext()); }

"&&"         { guiAnalizador.mostrarTexto("Token AND encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "AND", null);
              return new Symbol(sym.AND, yyline, yycolumn, yytext()); }

"!="        { guiAnalizador.mostrarTexto("Token DISTINTO encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DISTINTO", null);
              return new Symbol(sym.DISTINTO, yyline, yycolumn, yytext()); }

"!"         { guiAnalizador.mostrarTexto("Token NOT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "NOT", null);
              return new Symbol(sym.NOT, yyline, yycolumn, yytext()); }

{ID}        { guiAnalizador.mostrarTexto("Token ID encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "ID", null);
              return new Symbol(sym.ID, yyline, yycolumn, yytext()); }

{CONST_HEX} { guiAnalizador.mostrarTexto("Token CONST_HEX encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_HEX", yytext());
              return new Symbol(sym.CONST_HEX, yyline, yycolumn, yytext()); }

{CONST_FLOAT} { guiAnalizador.mostrarTexto("Token CONST_FLOAT encontrado, Lexema "+ yytext());
                agregarSimbolo(yytext(), "CONST_FLOAT", yytext());
              return new Symbol(sym.CONST_FLOAT, yyline, yycolumn, yytext()); }

{CONST_INT} { guiAnalizador.mostrarTexto("Token CONST_INT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_INT", yytext());
              return new Symbol(sym.CONST_INT, yyline, yycolumn, yytext()); }

{CONST_STR} { guiAnalizador.mostrarTexto("Token CONST_STR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_STR", yytext());
              return new Symbol(sym.CONST_STR, yyline, yycolumn, yytext()); }

{ESPACIO}   { /* ignorar espacios */ }

{COMENTARIO} { /* ignorar comentarios */ }

}

<<EOF>> {
    return new Symbol(sym.EOF);
}


[^]         { /* cualquier otro carácter desconocido se ignora */ }
