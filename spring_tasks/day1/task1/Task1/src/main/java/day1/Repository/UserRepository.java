package day1.Repository;

import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {

    public void saveUser() {
            System.out.println("User saved in database");
        }
}
