/*

Purpose: To learn how to work with a HashMap, how to use static blocks to initialize, how to throw and catch exceptions
Write a program that will multiply two numbers in the range of zero to ninety-nine.
In other words, I want to type
    java NaturalLanguageMultiply thirty-two ten
and see

    320
*/

import java.util.*;

public class NaturalLanguageMultiply {

    private static Map<String,Integer> wordMap;

    static {
	wordMap = new HashMap<String,Integer>();
	wordMap.put("zero", 0);
	wordMap.put("one", 1);
	wordMap.put("two", 2);
	wordMap.put("three", 3);
	wordMap.put("four", 4);
	wordMap.put("five", 5);
	wordMap.put("six", 6);
	wordMap.put("seven", 7);
	wordMap.put("eight", 8);
	wordMap.put("nine", 9);
	wordMap.put("ten", 10);
	wordMap.put("eleven", 11);
	wordMap.put("twelve", 12);
	wordMap.put("thirteen", 13);
	wordMap.put("fourteen", 14);
	wordMap.put("fifteen", 15);
	wordMap.put("sixteen", 16);
	wordMap.put("seventeen", 17);
	wordMap.put("eighteen", 18);
	wordMap.put("nineteen", 19);
	wordMap.put("twenty", 20);
	wordMap.put("thirty", 30);
	wordMap.put("fourty", 40);
	wordMap.put("fifty", 50);
	wordMap.put("sixty", 60);
	wordMap.put("seventy", 70);
	wordMap.put("eighty", 80);
	wordMap.put("ninety", 90);
	wordMap.put("hundred", 100);
    }

    public static void main(String[] args) {

	String myString;

	switch (args.length) {
	case 0:
	    System.out.println("No arguments.");
	    myString = "0";
	    break;
	case 1:
	    System.out.println("1 argument.");
	    myString = "1";
	    break;
	case 2:
	    myString = args[0] + " " + args[1];
	    System.out.println("2 arguments.");
	    break;
	default:
	    System.out.println("Too many arguments.");
	    myString = "n";
	    break;
	}

	// Use try catch block for calling the function that throws an exception.
	try {
	    System.out.println("The result is: " + NaturalLanguageMultiply.toInt(myString));
	}
	catch(Exception e) {
	    e.printStackTrace();
	}                         
    }
        
    private static int toInt( String s ) throws Exception {
	
	String[] splitString = s.split(" ");
	int i = wordMap.get(splitString[0]);
	int j = wordMap.get(splitString[1]);

	System.out.println("i*j = " + i * j);

	return i*j;
    }
    
}
