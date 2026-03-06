package task5spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {

    public static void main(String[] args) {

        try {

            ApplicationContext context =
                    new AnnotationConfigApplicationContext(AppConfig.class);

            CalculatorService service = context.getBean(CalculatorService.class);

            int result = service.performAddition(10, 20);

            System.out.println("Result: " + result);

        } catch (Exception e) {

            System.out.println("Error occurred: " + e.getMessage());

        }

    }
}