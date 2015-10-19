
import java.util.Arrays;
import java.lang.Integer;

public class Say
{

	  public static void main(String[] args)
    {
        String argString = "";

        if (args[0] != null)
        {
            argString = args[0];
        }
        System.out.println("Calling giveString");
        System.out.println("---------------------------------------");
        new Say().giveString(argString);
	  }

	  public void giveString(String input)
    {
        char[] inputArray = input.toCharArray();
        int ones = 0, tens = 0, hundreds = 0, thousands = 0;
        int tenthousands = 0, hundredthousands = 0, millions = 0;
        int tenmillions = 0, hundredmillions = 0, billions = 0;
        int tenbillions = 0, hundredbillions = 0;

        // Check that the input fits in array bounds.
        // Assign the input number to variables, e.g. from "235" take "2" and put into "hundreds".
        if (inputArray.length > 0)
        {
            ones = Character.getNumericValue(inputArray[inputArray.length -1]);
        }
        if (inputArray.length > 1)
        {
            tens = Character.getNumericValue(inputArray[inputArray.length - 2]);
        }
        if (inputArray.length > 2)
        {
            hundreds = Character.getNumericValue(inputArray[inputArray.length - 3]);
        }
        if (inputArray.length > 3)
        {
            thousands = Character.getNumericValue(inputArray[inputArray.length - 4]);
        }
        if (inputArray.length > 4)
        {
            tenthousands = Character.getNumericValue(inputArray[inputArray.length - 5]);
        }
        if (inputArray.length > 5)
        {
            hundredthousands = Character.getNumericValue(inputArray[inputArray.length - 6]);
        }
        if (inputArray.length > 6)
        {
            millions = Character.getNumericValue(inputArray[inputArray.length - 7]);
        }
        if (inputArray.length > 7)
        {
            tenmillions = Character.getNumericValue(inputArray[inputArray.length - 8]);
        }
        if (inputArray.length > 8)
        {
            hundredmillions = Character.getNumericValue(inputArray[inputArray.length - 9]);
        }
        if (inputArray.length > 9)
        {
            billions = Character.getNumericValue(inputArray[inputArray.length - 10]);
        }
        if (inputArray.length > 10)
        {
            tenbillions = Character.getNumericValue(inputArray[inputArray.length - 11]);
        }
        if (inputArray.length > 11)
        {
            hundredbillions = Character.getNumericValue(inputArray[inputArray.length - 12]);
        }

        String[] oneArray = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}; // 0-9
        String[] tenArray = {"", "ten", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"}; // 1-9 -> 0-9
        String[] teenArray = {"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"}; // 11-19 -> 0-9
        String[] multiArray = {"hundred", "thousand", "million", "billion"};

        // Set limits with boolean inBounds. Do following steps only if arguments within limits.
        boolean inBounds = false;
        if ( inputArray.length < 13 && inputArray.length > 0 && ones >= 0 && tens >= 0)
        {
            inBounds = true;
        }
        else
        {
            System.out.println("This won't do! You gotta give a proper number.");
        }

        // Try it out with a single results string
        String resultString = "";

        // Do once, if within the limits.
        // If cases for teen values and values where something in between is zero, like 106, or 10 008.
        while (inBounds)
        {
            if (hundredbillions != 0)
            {
                resultString = resultString + oneArray[hundredbillions] + "-" + multiArray[0] + "-";
            }
            if (tenbillions > 1 && tenbillions < 10)
            {
                resultString = resultString + tenArray[tenbillions] + "-" + oneArray[billions] + "-" + multiArray[3] + "-";
            }
            // Handle teen billions
            if (tenbillions == 1)
            {
                resultString = resultString + teenArray[billions] + "-" + multiArray[3] + "-";
            }
            if (billions != 0 && tenbillions == 0)
            {
                resultString = resultString + oneArray[billions] + "-" + multiArray[3] + "-";
            }
            if (hundredmillions != 0)
            {
                resultString = resultString + oneArray[hundredmillions] + "-" + multiArray[0] + "-";
            }
            if (tenmillions > 1 && tenmillions < 10)
            {
                resultString = resultString + tenArray[tenmillions] + "-" + oneArray[millions] + "-" + multiArray[2] + "-";
            }
            // Handle teen millions
            if (tenmillions == 1)
            {
                resultString = resultString + teenArray[millions] + "-" + multiArray[2] + "-";
            }
            if (millions != 0 && tenmillions == 0)
            {
                resultString = resultString + oneArray[millions] + "-" + multiArray[2] + "-";
            }
            if (hundredthousands != 0)
            {
                resultString = resultString + oneArray[hundredthousands] + "-" + multiArray[0] + "-";
            }
            if (tenthousands > 1 && tenthousands < 10)
            {
                resultString = resultString + tenArray[tenthousands] + "-" + oneArray[thousands] + "-" + multiArray[1] + "-";
            }
            // Handle teen thousands
            if (tenthousands == 1)
            {
                resultString = resultString + teenArray[thousands] + "-" + multiArray[1] + "-";
            }
            if (thousands != 0 && tenthousands == 0)
            {
                resultString = resultString + oneArray[thousands] + "-" + multiArray[1] + "-";
            }
            if (hundreds != 0)
            {
                resultString = resultString + oneArray[hundreds] + "-" + multiArray[0] + "-";
            }
            if (tens > 1 && tens < 10)
            {
                resultString = resultString + tenArray[tens] + "-" + oneArray[ones];
            }
            // Handle teen values
            if (tens == 1)
            {
                resultString = resultString + teenArray[ones];
            }
            // Like 100
            if (tens == 0 && ones != 0)
            {
                resultString = resultString + oneArray[ones];
            }
            if (inputArray.length == 1 && ones == 0)
                resultString = oneArray[ones];

            System.out.println(resultString);
            System.out.println("-------------------------------");

            inBounds = false;
        }
    }
}
