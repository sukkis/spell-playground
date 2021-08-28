
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.HashMap;
    
public class FontChanger {
    
    public static void main(String[] args) {
        
        replaceFont("baaar");
        System.out.println(readLines());
    }

    public static void replaceFont(String font){
        try {
            Path path=Paths.get("/home/$USER/git/spell-playground/java/test.txt");
            Stream <String> lines = Files.lines(path);
            List <String> replaced = lines
                .filter(line -> line.matches("URxvt.font")) 
                .collect(Collectors.toList());
            // Add new font.    
            replaced.add(font);
            Files.write(path, replaced);
            lines.close();
            System.out.println("Find and Replace done!!!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static HashMap readLines() {
        String fileName = "/home/$USER/git/spell-playground/java/fonts.txt";
        HashMap<Integer,String> fonts = new HashMap();
        Integer n = 0;
		//read file into stream, try-with-resources
		try (Stream<String> stream = Files.lines(Paths.get(fileName))) {

            stream.forEach(v -> fonts.put(n+1, v));
		} catch (IOException e) {
			e.printStackTrace();
		}
        return fonts;
    }
}
