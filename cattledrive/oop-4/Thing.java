public class Thing
{
    // Variables
    private long serialNumber;
    private static long counter = 0;
    private String name;

    // Constructors
    Thing()
    {
        this.serialNumber = getSerialNumber();
    }

    Thing(String name)
    {
        this.serialNumber = 1000000 + counter;
        this.name = name;
    }

    // Methods
    public String getDescription()
    {
        System.out.println("----from getDescription()----");
        return "I am from " + this.getClass() + "\n my name is " +
            name + "\n my number is " + serialNumber +
            "\n and my hashcode is " + this.hashCode();
    }

    long getSerialNumber()
    {
        long result = counter + 1000000;
        counter++;
        return result;
    }

}
