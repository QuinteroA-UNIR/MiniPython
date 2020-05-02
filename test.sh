#!/bin/bash
java -jar Resources/java-cup-11b.jar syntax.cup
java -jar ./Resources/jflex-full-1.8.1.jar ./lexicon.flex
javac -cp .:Resources/jflex-full-1.8.1.jar ./Lexer.java
javac -cp .:Resources/jflex-full-1.8.1.jar ./parser.java
javac -cp .:Resources/jflex-full-1.8.1.jar ./Analyzer.java
for f in ./Ejemplos/*.minipy
do
    echo -e "Processing $f\n"
    java -cp .:Resources/jflex-full-1.8.1.jar Analyzer $f | grep "Cadena correcta"
done
