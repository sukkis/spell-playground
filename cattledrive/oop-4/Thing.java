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
        System.out.println("I am a " + this.getClass());
        System.out.println("My name is " + name);
        System.out.println("My serialNumber is " + serialNumber);
        System.out.println("My hashcode is " + this.hashCode());

        return "Thing " + name + serialNumber;
    }

    long getSerialNumber()
    {
        return 1000000 + counter;
    }

}
