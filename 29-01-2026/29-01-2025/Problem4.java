import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Problem4 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        
        List<Number> numbers = new ArrayList<>();

        System.out.println("Enter numeric values (type 'end' to stop):");

        while (true) {
            String input = sc.nextLine();

            if (input.equals("end")) {
                break;
            }

            try {
            
                if (input.contains(".")) {
                    Double d = Double.valueOf(input); 
                    numbers.add(d);                  
                } else {
                    Integer i = Integer.valueOf(input); 
                    numbers.add(i);                     
                }

            } catch (NumberFormatException e) {
                
                System.out.println("Invalid input logged: " + input);
            }
        }

        
        int intSum = 0;
        double doubleSum = 0.0;
        int doubleCount = 0;

        
        for (Number n : numbers) {
            if (n instanceof Integer) {
                intSum += n.intValue();     
            } else if (n instanceof Double) {
                doubleSum += n.doubleValue(); 
                doubleCount++;
            }
        }

    
        System.out.println("\nStored Numbers:");
        Iterator<Number> it = numbers.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }

        System.out.println("\nSum of integers: " + intSum);

        if (doubleCount > 0) {
            System.out.println("Average of floating-point numbers: " + (doubleSum / doubleCount));
        } else {
            System.out.println("No floating-point numbers entered");
        }

        sc.close();
    }
}
