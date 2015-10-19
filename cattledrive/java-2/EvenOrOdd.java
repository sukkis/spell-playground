class EvenOrOdd
{
    public static void main(String[] args)
    {
        int inputNumber = 0;
        if (args.length > 0)
        {
            inputNumber = Integer.parseInt(args[0]);
        }

        if (inputNumber % 2 == 0)
        {
            System.out.println(inputNumber + " is an even number.");
        }
        else
        {
            System.out.println(inputNumber + " is an odd number.");
        }
    }
}
