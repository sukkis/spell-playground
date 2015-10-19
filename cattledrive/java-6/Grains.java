/*
Grains is the assignment 6 at Java Ranch Cattle Drive
@author petterisu
*/

public class Grains {
	
	private static final int NUMBER_OF_SQUARES_ON_CHESS_BOARD = 64;
	private static int squareNumber = 1;
	public static java.math.BigInteger grains = new java.math.BigInteger("1");
	public static java.math.BigInteger cumulativeGrains = new java.math.BigInteger("0");
	
	public static void main(String[] args) {
		while (squareNumber < NUMBER_OF_SQUARES_ON_CHESS_BOARD + 1) {
			cumulativeGrains = cumulativeGrains.add(grains);
			if (squareNumber == 1) {
				System.out.println("square " + squareNumber + ":  " + grains + " grain" + " cumulative " + cumulativeGrains);
			} else {
				System.out.println("square " + squareNumber + ":  " + grains + " grains" + " cumulative " + cumulativeGrains);
			}

			squareNumber ++;
			grains = grains.add(grains);
		}
		System.out.println("Cumulative grains: " + cumulativeGrains);
	}
}