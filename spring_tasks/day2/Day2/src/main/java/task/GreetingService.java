package task;

import org.springframework.stereotype.Service;

@Service
public class GreetingService {

    public void greet() {
        System.out.println("Hello from GreetingService!");
    }
}