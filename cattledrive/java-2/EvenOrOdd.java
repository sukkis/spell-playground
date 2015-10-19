class EvenOrOdd
{
    public static void main(String[] args)
    {
        int inputNumber = 0;
        if (args.length > 0)
        {
            inputNumber = Integer.parseInt(args[0]);
        }
        else
        {
            inputNumber = -9999;
        }

        if (inputNumber % 2 == 0)
        {
            System.out.println("You gave number: " + inputNumber);
            System.out.println(inputNumber + " is an even number");
        }
        else
        {
            System.out.println("You gave number: " + inputNumber);
            System.out.println(inputNumber + " is an odd number");
        }

    }
}
