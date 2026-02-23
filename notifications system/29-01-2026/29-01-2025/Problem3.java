import java.util.Scanner;

class InvalidAgeException extends Exception {
    InvalidAgeException(String message) {
        super(message);
    }
}

class InvalidEmailException extends RuntimeException {
    InvalidEmailException(String message) {
        super(message);
    }
}


class Validator {

    
    static void validateAge(int age) throws InvalidAgeException {
        if (age < 18) {
            throw new InvalidAgeException("Age must be 18 or above");
        }
    }

    
    static void validateEmail(String email) {
        if (email == null || !email.contains("@")) {
            throw new InvalidEmailException("Invalid email format");
        }
    }

    static void validateUsername(String username) {
        if (username == null || username.length() < 3) {
            throw new IllegalArgumentException("Username must have at least 3 characters");
        }
    }
}

public class Problem3 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        try {
            
            System.out.print("Enter username: ");
            String username = sc.nextLine();

            System.out.print("Enter age: ");
            int age = sc.nextInt();
            sc.nextLine(); 

            System.out.print("Enter email: ");
            String email = sc.nextLine();

        
            Validator.validateUsername(username);
            Validator.validateAge(age);       
            Validator.validateEmail(email);   

            System.out.println("✅ All validations passed");

        } catch (InvalidAgeException e) {     
            System.out.println("Age Error: " + e.getMessage());

        } catch (InvalidEmailException e) {   
            System.out.println("Email Error: " + e.getMessage());

        } catch (Exception e) {               
            System.out.println("Error: " + e.getMessage());

        } finally {
            
            System.out.println("Validation process completed ✔");
            sc.close();
        }
    }
}
