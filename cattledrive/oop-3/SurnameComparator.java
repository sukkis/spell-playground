import java.util.*;

class SurnameComparator implements Comparator<String>
{
    public int compare(String s1, String s2)
    {
        String[] s1Array = s1.split(" ");
        String[] s2Array = s2.split(" ");

        return s1Array[1].compareTo(s2Array[1]);
    }
}
