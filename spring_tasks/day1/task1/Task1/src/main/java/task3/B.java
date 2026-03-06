package task3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class B {

    A a;

    public B() {
        System.out.println("B created");
    }

    @Autowired
    public void setA(A a) {
        this.a = a;
    }
}