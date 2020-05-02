import java_cup.runtime.*;

%%

%class Lexer
%cup
%unicode
%line
%column

// Macros
Espacio = " "
Tabulador = \t
Identificador = [_a-zA-Z](\w*)
FinLinea = \r\n | \r | \n
Caracter = [^\r\n]
ComentarioLinea = "#" {Caracter}*
ExponenteNumerico = [Ee][+-]?\d+
TextoComillaSimple = \'(\\\'|[^\'\r\n])*\'
TextoComillaDoble = \"(\\\"|[^\"\r\n])*\"


// Constantes
ConstanteEntera = [+-]?\d+
ConstanteReal = {ConstanteEntera} (("." \d* {ExponenteNumerico}?) | {ExponenteNumerico})
ConstanteTexto = {TextoComillaSimple} | {TextoComillaDoble}
Verdadero = "True"
Falso = "False"
ConstanteBooleana = {Verdadero} | {Falso}

%%
// Palabras reservadas
"print"                         {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_PRINT);}
"if"                            {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_IF);}
"else"                          {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ELSE);}
"endif"                         {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ENDIF);}
"for"                           {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_FOR);}
"in"                            {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_IN);}
"endfor"                        {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ENDFOR);}
"def"                           {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_DEF);}
"enddef"                        {System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ENDDEF);}

{ConstanteBooleana}             {System.out.println("Constante booleana: " + yytext());
                                return new Symbol(sym.C_BOOL);}
{Identificador}                 {System.out.println("Identificador: "+ yytext());
                                return new Symbol(sym.IDENT);}
{ConstanteEntera}               {System.out.println("Constante Entera: " + yytext());
                                return new Symbol(sym.C_INT);}
{ConstanteReal}                 {System.out.println("Constante Real: " + yytext());
                                return new Symbol(sym.C_REAL);}
{ConstanteTexto}                {System.out.println("Constante de texto: " + yytext());
                                return new Symbol(sym.C_TXT);}
{ComentarioLinea}               {System.out.println("Comentario de linea: " + yytext());}

//Operadores Artimeticos
"+"                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_PLUS);}
"-"                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_MINUS);}
"*"                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_MULT);}
"/"                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_DIV);}
"%"                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_MOD);}
"**"                            {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_POW);}
"//"                            {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_FLOOR);}
//Operadores Comparativos
"=="                            {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_COMPARE);}
"!="                            {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_DISTINCT);}
"<>"                            {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_DISTINCT);}
">"                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_GT);}
"<"                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_LT);}
">="                            {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_GET);}
"<="                            {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_LET);}
//Operadores booleanos
"and"                           {System.out.println("Operador: " + yytext());}
"or"                            {System.out.println("Operador: " + yytext());}
"not"                           {System.out.println("Operador: " + yytext());}
//Operadores de asignacion
"="                             {System.out.println("Operador: " + yytext());
                                return new Symbol(sym.OP_EQ);}

//Delimitadores
"("                             {System.out.println("Delimitador: " + yytext());}
")"                             {System.out.println("Delimitador: " + yytext());}
"["                             {System.out.println("Delimitador: " + yytext());}
"]"                             {System.out.println("Delimitador: " + yytext());}
"{"                             {System.out.println("Delimitador: " + yytext());}
"}"                             {System.out.println("Delimitador: " + yytext());}
","                             {System.out.println("Delimitador: " + yytext());}
":"                             {System.out.println("Delimitador: " + yytext());}
{Tabulador}                     {System.out.println("Delimitador: tabulador");
                                return new Symbol(sym.TAB);}
{FinLinea}                      {System.out.println("Delimitador: fin linea");
                                return new Symbol(sym.LINE_END);}
{Espacio}                       {}
// Fin de fichero
// <<EOF>>                         {System.out.println("Fin de ficehro"); System.exit(0);}

// Simbolo inesperado
[^]                             { System.out.println("Simbolo inesperado: \"" + yytext() + "\". linea: " + yyline + " col: " + yycolumn); System.exit(0); }