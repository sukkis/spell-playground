
// Multiples of 3 or 5
// Only count ones, if both conditions are true

import java.util.Optional;
import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.List;

class Multiples {

    public static void main( String[] args ) {
        List<Integer> numbers = new ArrayList<Integer>();
        
        Integer seed = Integer.parseInt(args[0]); 
	System.out.println("Seed is : " + seed);

	for (Integer i = 0; i < seed; i++) {
            numbers.add(i);
	}

	System.out.println("Raw list : " + numbers);
	System.out.println("Filtered : " + filterList(numbers));
	System.out.println("Sum of filtered list : " + sumList(filterList(numbers)));
	
    }

    public static List<Integer> filterList( List<Integer> rawList) {
        List<Integer> filteredNumbers = rawList.stream()
		.filter(x -> (x % 3 == 0 || x % 5 == 0))
		.collect(Collectors.toList());
    
        return filteredNumbers;
    }

    public static Integer sumList(List<Integer> anyList) {
        Integer mySum = anyList.stream()
		.mapToInt(x -> x).sum();
    
        return mySum;
    }
}
