import java.io.*; 
public class FileProcessor {
 
    private static String space = "        ";  
    private static String processedLine = "";  
 
    private static void processLine(String line, BufferedWriter writer) throws IOException {
        // Satırın başındaki boşlukları temizleyelim
        line = line.stripLeading();

        // Eğer satır boşsa, hiç işlem yapmadan dön
        if (line.isEmpty()) {   return; }
 
        if (line.startsWith(":") && !line.startsWith("::")) {
            processedLine = space + line;
            space = space+"        "; 
            writer.newLine();writer.write(processedLine);  writer.newLine();  
            return;
        } 

        else if (line.startsWith("if")) { 
            processedLine = space + line;
            writer.newLine();  
            writer.write(processedLine); 
            writer.newLine();  
            space = space + "        ";
            return;
        }

        else if ( line.startsWith(") else")) {
    	    processedLine = space.substring(8) + line;
    	    space = space.substring(8);
            //processedLine = space + line;

            writer.newLine();  
            writer.write(processedLine);
            writer.newLine();  

            space = space + "        ";

            return;
        }

 




        // ")" ile biten satır için girintiyi azaltalım
        else if (line.startsWith(")")) {
            int indentToRemove = Math.min(space.length(), 8);
            processedLine = space.substring(0, space.length() - indentToRemove) + line;
            space = space.substring(0, space.length() - indentToRemove);
            writer.write(processedLine);
            writer.newLine();
            writer.newLine(); 
            return;
        }





        // Diğer satırlar için 16 boşluk ekle
        else {
            processedLine = space + line;   
            writer.write(processedLine); 
            writer.newLine();   
        }





    }





    public static void processFile(String inputFilename, String outputFilename) {
  
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFilename));
             BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilename))) {

            String line;
 	    writer.write("        ::Edited SpaceAdder\n");

            while ((line = reader.readLine()) != null) {
                processLine(line, writer);
            }

            System.out.println(outputFilename + " yazildi");

        } catch (IOException e) {
            System.out.println("Dosya islemi sirasinda bir hata olustu: " + e.getMessage());
        }
    }




public static void main(String[] args) {

    if (args.length == 2) { 
        processFile(args[0], args[1]); 
    } else if (args.length == 1) { 
        processFile(args[0], "output.txt"); 
    } else { 
        System.out.println("Usage: java YourClassName <inputFileName> [<outputFileName>]"); 
    }

}
}

