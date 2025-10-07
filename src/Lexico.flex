package src;
import java_cup.runtime.*;
import java.util.*;

%%


%cup
%public
%class Lexico
%line
%column
%char




LETRA = [a-zA-Z]
DIGITO = [0-9]
ESPACIO = [ \t\f\n\r\n]+
ID = {LETRA} ({LETRA}|{DIGITO}|_)*
CONST_STR = \"({DIGITO}|{LETRA}|{ESPACIO})*\"
CONST_INT = {DIGITO}+
CONST_FLOAT = ({DIGITO}+"."{DIGITO}* | "."{DIGITO}+)
CONST_HEX = 0h([0-9A-Fa-f]+)
COMENTARIO = "$*"({LETRA}|{DIGITO}|{ESPACIO})*"*$"



%%

<YYINITIAL> {


":"         {System.out.println("Token DATA_TYPE_ASSIGN encontrado, Lexema "+ yytext());}

"="			{System.out.println("Token ASIGN encontrado, Lexema "+ yytext());}

":="			{System.out.println("Token CONST encontrado, Lexema "+ yytext());}

"+"			{System.out.println("Token SUMA encontrado, Lexema "+ yytext());}

"*"			{System.out.println("Token MULT encontrado, Lexema "+ yytext());}

"/"			{System.out.println("Token DIV encontrado, Lexema "+ yytext());}

"%"			{System.out.println("Token MOD encontrado, Lexema "+ yytext());}

"^"			{System.out.println("Token POT encontrado, Lexema "+ yytext());}

"DECVAR"    {System.out.println("Token DEC_VAR encontrado, Lexema "+ yytext());}

"ENDDECVAR"    {System.out.println("Token END_DEC_VAR encontrado, Lexema "+ yytext());}

"FOR"       { System.out.println("Token PR_FOR encontrado, Lexema "+yytext()); }

"IS"        { System.out.println("Token PR_IS encontrado, Lexema "+yytext()); }

"RANGE"     { System.out.println("Token PR_RANGE encontrado, Lexema "+yytext()); }

"STEP"      { System.out.println("Token PR_STEP encontrado, Lexema "+yytext()); }

"NEXT"   { System.out.println("Token PR_NEXT encontrado, Lexema "+yytext()); }

"while"     { System.out.println("Token PR_WHILE encontrado, Lexema "+yytext()); }

"if"        { System.out.println("Token PR_IF encontrado, Lexema "+yytext()); }

"IF"        { System.out.println("Token PR_IF encontrado, Lexema "+yytext()); }

"else"      { System.out.println("Token PR_ELSE encontrado, Lexema "+yytext()); }

"ELSE"      { System.out.println("Token PR_ELSE encontrado, Lexema "+yytext()); }

"ENDIF"     { System.out.println("Token PR_ENDIF encontrado, Lexema "+yytext()); }

"REPEAT"    { System.out.println("Token PR_REPEAT encontrado, Lexema "+yytext()); }

"UNTIL"    { System.out.println("Token PR_UNTIL encontrado, Lexema "+yytext()); }

"int"       { System.out.println("Token PR_INT encontrado, Lexema "+yytext()); }

"float"     { System.out.println("Token PR_FLOAT encontrado, Lexema "+yytext()); }

"show"      { System.out.println("Token SHOW encontrado, Lexema "+yytext()); }

"["				{System.out.println("Token CLASP_A encontrado, Lexema "+ yytext());}

"]"				{System.out.println("Token CLASP_C encontrado, Lexema "+ yytext());}

"("				{System.out.println("Token PAREN_A encontrado, Lexema "+ yytext());}

")"				{System.out.println("Token PAREN_C encontrado, Lexema "+ yytext());}

"{"				{System.out.println("Token KEY_A encontrado, Lexema "+ yytext());}

"}"				{System.out.println("Token KEY_C encontrado, Lexema "+ yytext());}

"."				{System.out.println("Token PUNTO encontrado, Lexema "+ yytext());}

","				{System.out.println("Token COMA encontrado, Lexema "+ yytext());}

"=="				{System.out.println("Token IGUAL encontrado, Lexema "+ yytext());}

"<="			{System.out.println("Token MENOR_IGUAL encontrado, Lexema "+ yytext());}

">="			{System.out.println("Token MAYOR_IGUAL encontrado, Lexema "+ yytext());}

"<"			{System.out.println("Token MENOR encontrado, Lexema "+ yytext());}

">"			{System.out.println("Token MAYOR encontrado, Lexema "+ yytext());}

"!="			{System.out.println("Token DISTINTO encontrado, Lexema "+ yytext());}

"!"			{System.out.println("Token NOT encontrado, Lexema "+ yytext());}

"+="			{System.out.println("Token MASIGUAL encontrado, Lexema "+ yytext());}

{ID}			{System.out.println("Token ID encontrado, Lexema "+ yytext());}

{CONST_FLOAT}   {System.out.println("Token CONST_FLOAT, encontrado Lexema "+ yytext());}

{CONST_INT}		{System.out.println("Token CONST_INT, encontrado Lexema "+ yytext());}

{CONST_STR}		{System.out.println("Token CONST_STR, encontrado Lexema "+ yytext());}

{CONST_HEX}		{System.out.println("Token CONST_STR, encontrado Lexema "+ yytext());}

{ESPACIO}		{/* no se realiza accion por lo tanto se ignoran*/}

{COMENTARIO}	{/* No se realiza accion por lo tanto se ignoran*/}

}

[^]		{}






















