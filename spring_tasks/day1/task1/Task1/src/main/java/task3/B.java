package task3;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class B {

    A a;

    public B() {
        System.out.println("B object created");
    }

    @Autowired
    public void setA(A a) {
        System.out.println("Injecting A into B");
        this.a = a;
    }

    @PostConstruct
    public void init() {
        System.out.println("PostConstruct B ");
    }
}
