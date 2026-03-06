package task2;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class Main {

    public static void main(String[] args) {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext(AppConfig.class);

        MyBean b = ctx.getBean(MyBean.class);

        b.run();

        ctx.close();
    }
}