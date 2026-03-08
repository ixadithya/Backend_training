package task;

import org.springframework.stereotype.Service;

@Service
public class GreetingService {

    public void greet() {
        System.out.println("Hello from GreetingService!");
    }

    public void greet(String name) {
        System.out.println("Welcome " + name);
    }

    public void greet(String name, String occasion) {
        System.out.println("Happy " + occasion + " " + name + "!");
    }

    public void greet(String name, String occasion, String fromName) {
        System.out.println("Happy " + occasion + " " + name + " from " + fromName + "!");
    }

    
}
