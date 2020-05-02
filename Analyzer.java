import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class Analyzer {
    public static void main(String[] args) throws IOException {
        if (args.length < 1) {
            System.out.println("Usage: java Analyzer <inputfile>");
            return;
        }
        Reader reader = new FileReader(args[0]);
        Lexer l = new Lexer(reader);
        parser p = new parser(l);
        try {
            p.parse();
            // p.debug_parse();
            System.out.println("\nCadena correcta:");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}