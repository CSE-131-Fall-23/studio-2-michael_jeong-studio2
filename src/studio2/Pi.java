package studio2;

import java.util.Scanner;

public class Pi {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
				Scanner reader = new Scanner(System.in);
				double winChance = (10.00*(Math.random()));
				int center = 1;
				int middle = 2;
				int outside = 3;
			
				while (winChance < outside && winChance > center) {
					if (winChance > center && winChance < middle) {
					 System.out.println("center");
						}
					if (winChance > center && winChance < outside) {
						System.out.println("middle");
					}
					if (winChance > middle && winChance < 4) {
						System.out.println("outside");
					}
				}
			
			}
		}

