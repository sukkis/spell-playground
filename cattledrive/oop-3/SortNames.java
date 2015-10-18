/*
  Purpose: To learn how to work with an ArrayList, how to implement an interface, and how to use I/O
*/
import java.util.*;
import java.lang.Exception.*;
import com.javaranch.common.TextFileIn;

class SortNames{

    protected ArrayList<String> readNamesFromFile(String fileName) throws Exception {
        ArrayList<String> listOfNames = new ArrayList<String>();
        TextFileIn in = new TextFileIn(fileName);
        boolean done = false;

        while (! done){
            String s = in.readLine();
            if (s == null){
                done = true;
            } else {
                listOfNames.add(s);
                listOfNames.toString();
            }
        }
        in.close();
        return listOfNames;
    }
    // sort by last name

    // sort by first name


    public static void main (String[] args){
        String sortOrder = "";
        if (args.length > 0) {
            sortOrder = args[0];
        }

        // call read-file
        System.out.println("Printing names without sorting: ");
        SortNames sorter = new SortNames();
        try {
            System.out.println(sorter.readNamesFromFile("names.txt"));
        }
        catch (Exception e) {
            System.out.println("File not found, check path and file name.");
            e.printStackTrace();
        }
        // test sort by last name

        // test sort by first name

    }
}
