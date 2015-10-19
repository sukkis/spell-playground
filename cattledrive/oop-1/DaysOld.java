import com.javaranch.common.* ;
import java.util.TimeZone;
/*
    java DaysOld 2000-1-2
and see
    You were born on January 2, 2000
    Today is November 18, 2000
    You are now 321 days old.
*/
public class DaysOld {

	public static void main(String[] args) {
		String[] parts = null;
		
		if (args.length > 0) {
			parts = args[0].split("-");
		} else {
			System.out.println("Please give your birthday as an argument in yyyy-MM-dd format, e.g, 1975-03-03");
		}
				
		GDate today = new GDate("GMT+2");
		TimeZone tz = TimeZone.getTimeZone("GMT+2");
		today.setToToday(tz);
		JDate todayInJ = new JDate(today);
		
		JDate myDate = null;
		if (parts.length > 2) {
			myDate = new JDate(Integer.parseInt(parts[0]),Integer.parseInt(parts[1]),Integer.parseInt(parts[2]));
		} else {
			myDate = new JDate(today);
			System.out.println("The calculation only works if your birthday is in yyyy-MM-dd format.");
		}

		System.out.println("You were born on " + myDate.toString());
		System.out.println("Today is " + todayInJ.toString());
		
		int i = todayInJ.get();
		int j = myDate.get();
		int subtraction = i - j;
		
		System.out.println("You are now " + subtraction + " days old.");
	}	
}