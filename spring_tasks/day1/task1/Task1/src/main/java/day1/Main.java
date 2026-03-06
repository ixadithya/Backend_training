package day1;


import day1.Config.AppConfig;
import day1.Service.UserService;
import day1.Repository.UserRepository;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;



public class Main {

    public static void main(String[] args) {

        ApplicationContext context =
                new AnnotationConfigApplicationContext(AppConfig.class);

        UserService service = context.getBean(UserService.class);

        service.registerUser();
    }
}