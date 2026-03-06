package task2;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.stereotype.Component;

@Component
public class MyBean implements InitializingBean, DisposableBean {

    public MyBean() {
        System.out.println("1 Bean created");
    }

    @PostConstruct
    public void init1() {
        System.out.println("2 @PostConstruct called");
    }

    @Override
    public void afterPropertiesSet() {
        System.out.println("3 afterPropertiesSet()");
    }

    public void run() {
        System.out.println("4 Bean working");
    }

    @PreDestroy
    public void end1() {
        System.out.println("5 @PreDestroy called");
    }

    @Override
    public void destroy() {
        System.out.println("6 destroy()");
    }
}