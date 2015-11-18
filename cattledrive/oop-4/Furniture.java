public class Furniture extends Thing
{
    Furniture()
    {
        super();
    }

    Furniture(String name)
    {
        super(name);
    }

    @Override
    public String getDescription()
    {
        return super.getDescription() + "\n I'm furniture!";
    }
}
