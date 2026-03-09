package task3;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class A {

    B b;

    public A() {
        System.out.println("A object created");
    }

    @Autowired
    public void setB(B b) {
        System.out.println("Injecting B into A");
        this.b = b;
    }

    @PostConstruct
    public void init() {
        System.out.println("PostConstruct A");
    }
}
