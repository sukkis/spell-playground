/* Purpose: To learn how to follow the style guide, how to get the argument from the command line,
 * how to use variables, how to concatenate strings, how to use a loop effectively,
 * and how to output to the screen (standard out).
 *
 */
class Hundred {
    public static void main(String[] args){
        final int MAX_ROW_LENGTH = 80;
        final int MAX_PRINT = 100;

        int printCounter = 0;
        int rowCounter = 0;
        String inputString = "";
        if (args.length > 0) {
            inputString = args[0];
        }

        while (printCounter < MAX_PRINT) {

            if (rowCounter < MAX_ROW_LENGTH - inputString.length()) {
                System.out.print(inputString + " ");
                rowCounter = rowCounter + inputString.length() + 1;
                printCounter ++;
            } else {
                System.out.println("");
                rowCounter = 0;
            }


        }

    }
}
