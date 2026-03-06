package task;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.*;

@Configuration
@ComponentScan("task")
public class App {

    @Bean
    public NotificationService notificationService() {
        return new NotificationService();
    }

    public static void main(String[] args) {

        ApplicationContext context =
                new AnnotationConfigApplicationContext(App.class);

        UserController controller = context.getBean(UserController.class);
        controller.sayHello();

        GreetingService greetingService = context.getBean(GreetingService.class);
        greetingService.greet();

        NotificationService notificationService =
                context.getBean(NotificationService.class);

        notificationService.sendNotification();
    }
}