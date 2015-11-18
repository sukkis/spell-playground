import java.util.*;

public class Lookup
{
    private static HashMap<String, Thing> thingMap = new HashMap<String, Thing>();

    public static void main(String[] args)
    {
        Thing thing1 = new Thing("First Thing");
        Thing thing2 = new Video("Video dude");
        Thing thing3 = new Furniture("Sofa");
        Thing thing4 = new BookOnTape("Audio book");
        String key = thing1.getSerialNumber() + "";
        String key2 = thing2.getSerialNumber() + "";
        String key3 = thing3.getSerialNumber() + "";
        String key4 = thing4.getSerialNumber() + "";
        thingMap.put(key, thing1);
        thingMap.put(key2, thing2);
        thingMap.put(key3, thing3);
        thingMap.put(key4, thing4);

        // Print out all things
        for(Map.Entry<String, Thing> entry : thingMap.entrySet())
        {
            System.out.println("----raw instance info----");
            System.out.printf("Key : %s and Value: %s %n", entry.getKey(), entry.getValue());
            System.out.println(entry.getValue().getDescription());
        }
    }
}
