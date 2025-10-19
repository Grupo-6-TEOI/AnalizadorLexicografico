package src;
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

":"         { System.out.println("Token DATA_TYPE_ASSIGN encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DATA_TYPE_ASSIGN", null); }

"="         { System.out.println("Token ASIGN encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "ASIGN", null); }

":="        { System.out.println("Token CONST encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST", null); }

"+"         { System.out.println("Token SUMA encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "SUMA", null); }

"*"         { System.out.println("Token MULT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MULT", null); }

"/"         { System.out.println("Token DIV encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DIV", null); }

"%"         { System.out.println("Token MOD encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MOD", null); }

"^"         { System.out.println("Token POT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "POT", null); }

"DECVAR"    { System.out.println("Token DEC_VAR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DEC_VAR", null); }

"ENDDECVAR" { System.out.println("Token END_DEC_VAR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "END_DEC_VAR", null); }

"FOR"       { System.out.println("Token PR_FOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_FOR", null); }

"IS"        { System.out.println("Token PR_IS encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_IS", null); }

"RANGE"     { System.out.println("Token PR_RANGE encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_RANGE", null); }

"STEP"      { System.out.println("Token PR_STEP encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_STEP", null); }

"NEXT"      { System.out.println("Token PR_NEXT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_NEXT", null); }

"while"     { System.out.println("Token PR_WHILE encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_WHILE", null); }

"if"|"IF"   { System.out.println("Token PR_IF encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_IF", null); }

"else"|"ELSE" { System.out.println("Token PR_ELSE encontrado, Lexema "+ yytext());
                agregarSimbolo(yytext(), "PR_ELSE", null); }

"ENDIF"     { System.out.println("Token PR_ENDIF encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_ENDIF", null); }

"REPEAT"    { System.out.println("Token PR_REPEAT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_REPEAT", null); }

"UNTIL"     { System.out.println("Token PR_UNTIL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_UNTIL", null); }

"int"       { System.out.println("Token PR_INT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_INT", null); }

"float"     { System.out.println("Token PR_FLOAT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PR_FLOAT", null); }

"show"      { System.out.println("Token SHOW encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "SHOW", null); }

"["         { System.out.println("Token CLASP_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CLASP_A", null); }

"]"         { System.out.println("Token CLASP_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CLASP_C", null); }

"("         { System.out.println("Token PAREN_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PAREN_A", null); }

")"         { System.out.println("Token PAREN_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PAREN_C", null); }

"{"         { System.out.println("Token KEY_A encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "KEY_A", null); }

"}"         { System.out.println("Token KEY_C encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "KEY_C", null); }

"."         { System.out.println("Token PUNTO encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "PUNTO", null); }

","         { System.out.println("Token COMA encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "COMA", null); }

"=="        { System.out.println("Token IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "IGUAL", null); }

"<="        { System.out.println("Token MENOR_IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MENOR_IGUAL", null); }

">="        { System.out.println("Token MAYOR_IGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MAYOR_IGUAL", null); }

"<"         { System.out.println("Token MENOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MENOR", null); }

">"         { System.out.println("Token MAYOR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MAYOR", null); }

"!="        { System.out.println("Token DISTINTO encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "DISTINTO", null); }

"!"         { System.out.println("Token NOT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "NOT", null); }

"+="        { System.out.println("Token MASIGUAL encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "MASIGUAL", null); }

{ID}        { System.out.println("Token ID encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "ID", null); }

{CONST_HEX} { System.out.println("Token CONST_HEX encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_HEX", yytext()); }

{CONST_FLOAT} { System.out.println("Token CONST_FLOAT encontrado, Lexema "+ yytext());
                agregarSimbolo(yytext(), "CONST_FLOAT", yytext()); }

{CONST_INT} { System.out.println("Token CONST_INT encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_INT", yytext()); }

{CONST_STR} { System.out.println("Token CONST_STR encontrado, Lexema "+ yytext());
              agregarSimbolo(yytext(), "CONST_STR", yytext()); }

{ESPACIO}   { /* ignorar espacios */ }

{COMENTARIO} { /* ignorar comentarios */ }

}

<<EOF>> {
    tabla.writeToFile();
    return null;
}


[^]         { /* cualquier otro carácter desconocido se ignora */ }
