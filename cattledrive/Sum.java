public class Sum {

	private static double sum = 0.0;

	public static void main(String[] args) {
		for (int i=0; i<1000; i++) {
			sum = sum + 0.1;
		}	
		
		if (sum == 100) {
			System.out.println("Sum equals 100.");
		} else {
			System.out.println("Sum does not equal 100. Sum is: " + sum);	
		}
	}
}