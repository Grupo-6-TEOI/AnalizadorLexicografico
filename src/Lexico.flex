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
              agregarSimbolo(yytext(), "DATA_TYPE_ASSIGN", null); }

"="         { guiAnalizador.mostrarTexto("Token ASIGN encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "ASIGN", null); }

":="        { guiAnalizador.mostrarTexto("Token CONST encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST", null); }

"+"         { guiAnalizador.mostrarTexto("Token SUMA encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "SUMA", null); }

"*"         { guiAnalizador.mostrarTexto("Token MULT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MULT", null); }

"/"         { guiAnalizador.mostrarTexto("Token DIV encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DIV", null); }

"%"         { guiAnalizador.mostrarTexto("Token MOD encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MOD", null); }

"^"         { guiAnalizador.mostrarTexto("Token POT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "POT", null); }

"DECVAR"    { guiAnalizador.mostrarTexto("Token DEC_VAR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DEC_VAR", null); }

"ENDDECVAR" { guiAnalizador.mostrarTexto("Token END_DEC_VAR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "END_DEC_VAR", null); }

"FOR"       { guiAnalizador.mostrarTexto("Token PR_FOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_FOR", null); }

"IS"        { guiAnalizador.mostrarTexto("Token PR_IS encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_IS", null); }

"RANGE"     { guiAnalizador.mostrarTexto("Token PR_RANGE encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_RANGE", null); }

"STEP"      { guiAnalizador.mostrarTexto("Token PR_STEP encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_STEP", null); }

"NEXT"      { guiAnalizador.mostrarTexto("Token PR_NEXT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_NEXT", null); }

"while"     { guiAnalizador.mostrarTexto("Token PR_WHILE encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_WHILE", null); }

"if"|"IF"   { guiAnalizador.mostrarTexto("Token PR_IF encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_IF", null); }

"else"|"ELSE" { guiAnalizador.mostrarTexto("Token PR_ELSE encontrado, Lexema "+ yytext());
                agregarSimbolo(yytext(), "PR_ELSE", null); }

"ENDIF"     { guiAnalizador.mostrarTexto("Token PR_ENDIF encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_ENDIF", null); }

"REPEAT"    { guiAnalizador.mostrarTexto("Token PR_REPEAT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_REPEAT", null); }

"UNTIL"     { guiAnalizador.mostrarTexto("Token PR_UNTIL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_UNTIL", null); }

"int"       { guiAnalizador.mostrarTexto("Token PR_INT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_INT", null); }

"float"     { guiAnalizador.mostrarTexto("Token PR_FLOAT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_FLOAT", null); }

"show"      { guiAnalizador.mostrarTexto("Token SHOW encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "SHOW", null); }

"["         { guiAnalizador.mostrarTexto("Token CLASP_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CLASP_A", null); }

"]"         { guiAnalizador.mostrarTexto("Token CLASP_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CLASP_C", null); }

"("         { guiAnalizador.mostrarTexto("Token PAREN_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PAREN_A", null); }

")"         { guiAnalizador.mostrarTexto("Token PAREN_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PAREN_C", null); }

"{"         { guiAnalizador.mostrarTexto("Token KEY_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "KEY_A", null); }

"}"         { guiAnalizador.mostrarTexto("Token KEY_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "KEY_C", null); }

"."         { guiAnalizador.mostrarTexto("Token PUNTO encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PUNTO", null); }

","         { guiAnalizador.mostrarTexto("Token COMA encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "COMA", null); }

"=="        { guiAnalizador.mostrarTexto("Token IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "IGUAL", null); }

"<="        { guiAnalizador.mostrarTexto("Token MENOR_IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MENOR_IGUAL", null); }

">="        { guiAnalizador.mostrarTexto("Token MAYOR_IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MAYOR_IGUAL", null); }

"<"         { guiAnalizador.mostrarTexto("Token MENOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MENOR", null); }

">"         { guiAnalizador.mostrarTexto("Token MAYOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MAYOR", null); }

"!="        { guiAnalizador.mostrarTexto("Token DISTINTO encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DISTINTO", null); }

"!"         { guiAnalizador.mostrarTexto("Token NOT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "NOT", null); }

"+="        { guiAnalizador.mostrarTexto("Token MASIGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MASIGUAL", null); }

{ID}        { guiAnalizador.mostrarTexto("Token ID encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "ID", null); }

{CONST_HEX} { guiAnalizador.mostrarTexto("Token CONST_HEX encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_HEX", yytext()); }

{CONST_FLOAT} { guiAnalizador.mostrarTexto("Token CONST_FLOAT encontrado, Lexema "+ yytext());
                agregarSimbolo(yytext(), "CONST_FLOAT", yytext()); }

{CONST_INT} { guiAnalizador.mostrarTexto("Token CONST_INT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_INT", yytext()); }

{CONST_STR} { guiAnalizador.mostrarTexto("Token CONST_STR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_STR", yytext()); }

{ESPACIO}   { /* ignorar espacios */ }

{COMENTARIO} { /* ignorar comentarios */ }

}

<<EOF>> {
    tabla.writeToFile();
    return null;
}


[^]         { /* cualquier otro carácter desconocido se ignora */ }
