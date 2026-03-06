package task3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class A {

    B b;

    public A() {
        System.out.println("A created");
    }

    @Autowired
    public void setB(B b) {
        this.b = b;
    }
}