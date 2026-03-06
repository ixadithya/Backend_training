package task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserController {

    @Autowired
    private GreetingService greetingService;

    public void sayHello() {
        greetingService.greet();
    }
}