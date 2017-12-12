
import java.util.stream.*;

class MultiplesSlim {

    public static void main(String [] args) {
        int sum = 0;

	sum = IntStream.range(0, Integer.parseInt(args[0]))
		.filter(x -> ( x % 3 == 0 || x % 5 == 0 ))
		.sum();
	  

        System.out.println("Sum : " + sum);
    }

}
