import java.util.*;

public class Lookup
{
    private static HashMap<String, Thing> thingMap = new HashMap<String, Thing>();

    public static void main(String[] args)
    {
        Thing thing1 = new Thing("First Thing");
        String key = thing1.getSerialNumber() + "";
        thingMap.put(key, thing1);

        // Print out all things
        for(Map.Entry<String, Thing> entry : thingMap.entrySet())
        {
            System.out.println("----raw instance info----");
            System.out.printf("Key : %s and Value: %s %n", entry.getKey(), entry.getValue());
            entry.getValue().getDescription();
        }
    }
}
