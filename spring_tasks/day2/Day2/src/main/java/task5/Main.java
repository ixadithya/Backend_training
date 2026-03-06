package task5;

import java.util.*;

public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        try {

            CalRepository repo = new CalRepository();
            CalculatorService service = new CalculatorService(repo);

            System.out.print("Enter a no.: ");
            int num1 = sc.nextInt();

            System.out.print("Enter 2nd no.: ");
            int num2 = sc.nextInt();

            int result = service.performAddition(num1, num2);

            System.out.println("Result: " + result);

        } catch (InputMismatchException e) {

            System.out.println("Invalid input! enter numbers");

        } catch (Exception e) {

            System.out.println("Error occurred: " + e.getMessage());

        }
    }
}