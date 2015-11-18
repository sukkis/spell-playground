public class Video extends Thing
{
    Video()
    {
        super();
    }

    Video(String name)
    {
        super(name);
    }

    @Override
    public String getDescription()
    {
        return super.getDescription() + "\n I'm a VIDEO! \n";
    }
}
