%%

%class LexerOld
%standalone
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
"print"                         {System.out.println("Palabra reservada: " + yytext());}
"if"                            {System.out.println("Palabra reservada: " + yytext());}
"else"                          {System.out.println("Palabra reservada: " + yytext());}
"endif"                         {System.out.println("Palabra reservada: " + yytext());}
"for"                           {System.out.println("Palabra reservada: " + yytext());}
"in"                            {System.out.println("Palabra reservada: " + yytext());}
"endfor"                        {System.out.println("Palabra reservada: " + yytext());}
"def"                           {System.out.println("Palabra reservada: " + yytext());}
"enddef"                        {System.out.println("Palabra reservada: " + yytext());} 

{ConstanteBooleana}             {System.out.println("Constante booleana: " + yytext());}
{Identificador}                 {System.out.println("Identificador: "+ yytext());}
{ConstanteEntera}               {System.out.println("Constante Entera: " + yytext());}
{ConstanteReal}                 {System.out.println("Constante Real: " + yytext());}
{ConstanteTexto}                {System.out.println("Constante de texto: " + yytext());}
{ComentarioLinea}               {System.out.println("Comentario de linea: " + yytext());}

//Operadores Artimeticos
"+"                             {System.out.println("Operador: " + yytext());}
"-"                             {System.out.println("Operador: " + yytext());}
"*"                             {System.out.println("Operador: " + yytext());}
"/"                             {System.out.println("Operador: " + yytext());}
"%"                             {System.out.println("Operador: " + yytext());}
"**"                            {System.out.println("Operador: " + yytext());}
"//"                            {System.out.println("Operador: " + yytext());}
//Operadores Comparativos
"=="                            {System.out.println("Operador: " + yytext());}
"!="                            {System.out.println("Operador: " + yytext());}
"<>"                            {System.out.println("Operador: " + yytext());}
">"                             {System.out.println("Operador: " + yytext());}
"<"                             {System.out.println("Operador: " + yytext());}
">="                            {System.out.println("Operador: " + yytext());}
"<="                            {System.out.println("Operador: " + yytext());}
//Operadores booleanos
"and"                           {System.out.println("Operador: " + yytext());}
"or"                            {System.out.println("Operador: " + yytext());}
"not"                           {System.out.println("Operador: " + yytext());}
//Operadores de asignacion
"="                             {System.out.println("Operador: " + yytext());}

//Delimitadores
"("                             {System.out.println("Delimitador: " + yytext());}
")"                             {System.out.println("Delimitador: " + yytext());}
"["                             {System.out.println("Delimitador: " + yytext());}
"]"                             {System.out.println("Delimitador: " + yytext());}
"{"                             {System.out.println("Delimitador: " + yytext());}
"}"                             {System.out.println("Delimitador: " + yytext());}
","                             {System.out.println("Delimitador: " + yytext());}
":"                             {System.out.println("Delimitador: " + yytext());}
{Tabulador}                     {System.out.println("Delimitador: tabulador");}
{FinLinea}                      {System.out.println("Delimitador: fin linea");}
{Espacio}                       {}

// Fin de fichero
<<EOF>>                         {System.out.println("Fin de ficehro"); System.exit(0);}

// Simbolo inesperado
[^]                             { System.out.println("Simbolo inesperado: \"" + yytext() + "\". linea: " + yyline + " col: " + yycolumn); System.exit(0); }