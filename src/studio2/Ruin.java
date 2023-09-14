package studio2;

import java.util.Scanner;

public class Ruin {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner reader = new Scanner(System.in);
		int totalSimulations = 0;
		double startamount = 10.00;
		System.out.println(startamount);
		double winChance = Math.random();
		double winLimit = 50.00;

	
		while (startamount < winLimit && startamount > 0) {
			if (winChance > 0.5) {
			 System.out.println("You win!");
				startamount++;
				}
			else if (winChance < 0.5) {
				System.out.println("You lose!");
				startamount--;
			}
			totalSimulations++;
			System.out.println("This is totalSimulations: " + totalSimulations);
			System.out.println("This is startamount: " + startamount);
			System.out.println("This is winChance:" + winChance);
			System.out.println("This is winLimit:" + winLimit);
		
	}
	}
}

