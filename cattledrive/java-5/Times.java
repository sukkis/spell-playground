public class Times {
	public static void main (String[] args) {
	
		int i = 0, j=0;
		String str = "";
		
		while (i < 11) {
			// Write numbers horizontally
			while (j < 10) {			
				if (j == 0 && i == 0) {
					System.out.print(rightSpace(" ", 3));
				}			
				if (i == 0) {
					str = String.valueOf(j);
					System.out.print(rightSpace(str, 3));
				} else if (i == 1) {
					System.out.print(rightSpace("0", 3));			
				} else if (i > 1){		
				str = String.valueOf( (i-1) * j);
				System.out.print(rightSpace(str, 3));
				}				
				j++;
			}
			// Step one down
			System.out.println("");
			str = String.valueOf(i);
			if (i < 10) {
			System.out.print(rightSpace(str, 3));
			}
			i++;
			j = 0;
		}		
	}
	
	private static String rightSpace(String inputString, int newLen) {		
		String s = inputString;
		int i = s.length();
		while (i < newLen) {
			s = " " + s;
			i++;
		}
	return s;
	}	
}
