#!/bin/bash
echo -e "BUILD PARSER \n"
java -jar Resources/java-cup-11b.jar syntax.cup
echo -e "BUILD LEXER \n"
java -jar ./Resources/jflex-full-1.8.1.jar ./lexicon.flex
# java -jar ./Resources/jflex-full-1.8.1.jar ./lexicon.old.flex
echo -e "\n COMPILE LEXER"
javac -cp .:Resources/jflex-full-1.8.1.jar ./Lexer.java
# javac -cp .:Resources/jflex-full-1.8.1.jar ./LexerOld.java
echo -e "\n COMPILE PARSER"
javac -cp .:Resources/jflex-full-1.8.1.jar ./parser.java
echo -e "\n COMPILE ANALYZER"
javac -cp .:Resources/jflex-full-1.8.1.jar ./Analyzer.java
echo -e "\n PROCESSING FILE: \n"
# java LexerOld ./Ejemplos/01.minipy
java -cp .:Resources/jflex-full-1.8.1.jar Analyzer ./Ejemplos/00.minipy
# echo -e "\n PROCESSING FILE: \n"
# java Lexer ./ejemplos-pdf.minipy

# CLASSPATH=$CLASSPATH:jflex-full...
