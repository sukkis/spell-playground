import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GeekWatch {
	
	private static String options = "";
	private long milliseconds = 0;
	private long seconds = 0;
	private long minutes = 0;
	private long hours = 0;
	private long days = 0;
	private String currentDate = ""; 
	
	public long getMillis() {
		java.util.Date myDate = new java.util.Date();
		milliseconds = myDate.getTime();
		return milliseconds;
	}
	
	public long getDays() {
		java.util.Date myDate = new java.util.Date();
		milliseconds = myDate.getTime();
		seconds = milliseconds / 1000;
		minutes = seconds / 60;
		hours = minutes / 60;
		days = hours / 24;
		return days;		
	}

	public String getCurrentDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		currentDate = " " + dateFormat.format(cal.getTime());
		return currentDate;		
	}	
		
	public static void main(String[] args){
		
		GeekWatch myWatch = new GeekWatch();
		
		if (args.length > 0) {
			options = args[0];
		}
		
		switch (options) {
			case "0": System.out.println("number of milliseconds since January 1, 1970 : " + myWatch.getMillis());
			break;
			
			case "1": System.out.println("number of seconds since January 1, 1970 :" + myWatch.getMillis()/1000);
			break;
			
			case "2": System.out.println("number of days since January 1, 1970 : " + myWatch.getDays());
			break;
			
			case "3": System.out.println("current date and time : " + myWatch.getCurrentDate() );
			break;
			
			default: System.out.println("current date and time : " + myWatch.getCurrentDate() );
			break;
		}	
	}
}