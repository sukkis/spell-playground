/*
  Purpose: To learn how to work with an ArrayList, how to implement an interface, and how to use I/O
*/
import java.util.*;
import java.lang.Exception.*;
import com.javaranch.common.TextFileIn;

class SortNames
{

    ArrayList<String> listOfNames = new ArrayList<String>();
    private static final String INPUT_FILE = "names.txt";

    protected ArrayList<String> readNamesFromFile(String fileName) throws Exception {
        TextFileIn in = new TextFileIn(fileName);
        boolean done = false;

        while (! done)
        {
            String s = in.readLine();
            if (s == null)
            {
                done = true;
            }
            else
            {
                listOfNames.add(s);
                listOfNames.toString();
            }
        }
        in.close();
        return listOfNames;
    }

    protected ArrayList<String> sortedByFirstName(String inputFile)
    {
        return sort(readNamesFromFile(inputFile));
    }

    public static void main (String[] args)
    {
        String sortOrder = "";
        if (args.length > 0) {
            sortOrder = args[0];
        }

        // call read-file
        System.out.println("Printing names without sorting: ");
        SortNames sorter = new SortNames();
        try
        {
            System.out.println(sorter.readNamesFromFile("names.txt"));
            System.out.println("Trying to sort by first name: ");
            System.out.println(sorter.sortedByFirstName(INPUT_FILE));
        }
        catch (Exception e) {
            System.out.println("File not found, check path and file name.");
            e.printStackTrace();
        }
        // test sort by last name

        // test sort by first name


    }
}
