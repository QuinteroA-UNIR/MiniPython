import java_cup.runtime.*;
import java.util.Stack;

%%

%class Lexer
%cup
%unicode
%line
%column

%{
    int dedent, s, num_tab;
    int flag = 0;
    Stack<Integer> stack = new Stack<Integer>();
%}

%state INDENTATION

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
<YYINITIAL> {
// Palabras reservadas
"print"                         {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_PRINT);}
"if"                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_IF);}
"else"                          {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ELSE);}
"endif"                         {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ENDIF);}
"for"                           {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_FOR);}
"in"                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_IN);}
"endfor"                        {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ENDFOR);}
"def"                           {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_DEF);}
"enddef"                        {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_ENDDEF);}
"return"                        {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Palabra reservada: " + yytext());
                                return new Symbol(sym.P_RETURN);}

//Operadores booleanos
"and"                           {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_AND);}
"or"                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_OR);}
"not"                           {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_NOT);}

{ConstanteBooleana}             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Constante booleana: " + yytext());
                                return new Symbol(sym.C_BOOL);}
{Identificador}                 {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Identificador: "+ yytext());
                                return new Symbol(sym.IDENT);}
{ConstanteEntera}               {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Constante Entera: " + yytext());
                                return new Symbol(sym.C_INT);}
{ConstanteReal}                 {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Constante Real: " + yytext());
                                return new Symbol(sym.C_REAL);}
{ConstanteTexto}                {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Constante de texto: " + yytext());
                                return new Symbol(sym.C_TXT);}
{ComentarioLinea}               {System.out.println("Comentario de linea: " + yytext());}

//Operadores Artimeticos
"+"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_PLUS);}
"-"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_MINUS);}
"*"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_MULT);}
"/"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_DIV);}
"%"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_MOD);}
"**"                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_POW);}
"//"                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_FLOOR);}
//Operadores Comparativos
"=="                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_COMPARE);}
"!="                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_DISTINCT);}
"<>"                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_DISTINCT);}
">"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_GT);}
"<"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_LT);}
">="                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_GET);}
"<="                            {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.O_LET);}
//Operadores de asignacion
"="                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Operador: " + yytext());
                                return new Symbol(sym.OP_EQ);}

//Delimitadores
"("                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_PARENTHESIS_L);}

")"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_PARENTHESIS_R);}

"["                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_BRACKET_L);}

"]"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_BRACKET_R);}

"{"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_BRACE_L);}

"}"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_BRACE_R);}

","                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_COMMA);}

":"                             {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: " + yytext());
                                return new Symbol(sym.D_COLON);}

{Tabulador}                     {System.out.println("Delimitador: tabulador");
                                if(yycolumn == 0){num_tab=1;flag=1;yybegin(INDENTATION);}}
{FinLinea}                      {if(!stack.isEmpty() && yycolumn==0){ System.out.println("Dedent"); yypushback(yytext().length()); stack.pop(); return new Symbol(sym.DEDENT);}
                                System.out.println("Delimitador: fin linea");
                                return new Symbol(sym.LINE_END);}
{Espacio}                       {}
// Fin de fichero
// <<EOF>>                         {System.out.println("Fin de ficehro"); System.exit(0);}

// Simbolo inesperado
[^]                             { System.out.println("Simbolo inesperado: \"" + yytext() + "\". linea: " + yyline + " col: " + yycolumn); System.exit(0); }
}

<INDENTATION>{

{Tabulador}                     { num_tab++; }

. {
    if(stack.isEmpty()) { s = 0; } else { s = stack.peek();}
    if (s < num_tab && flag==1){
        yybegin(YYINITIAL);
        yypushback(1);
        stack.push(num_tab);
        return new Symbol(sym.TAB); 
    } else if (s > num_tab && !stack.isEmpty()) {
        flag = 0;
        yypushback(1);
        stack.pop();
        return new Symbol(sym.DEDENT);
    } else if(s == num_tab ) {
        yybegin(YYINITIAL);
        yypushback(1);
    } else {
        System.out.println("Indentacion erronea: linea: " + yyline + " col: " + yycolumn); System.exit(0);
    }
}

}