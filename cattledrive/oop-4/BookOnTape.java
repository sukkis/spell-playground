public class BookOnTape extends Thing
{
    BookOnTape()
    {
        super();
    }

    BookOnTape(String name)
    {
        super(name);
    }

    @Override
    public String getDescription()
    {
        return super.getDescription() + "\n I'm an audio book! \n";
    }
}
