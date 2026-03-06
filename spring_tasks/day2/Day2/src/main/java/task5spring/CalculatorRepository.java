package task5spring;

import org.springframework.stereotype.Repository;

@Repository
public class CalculatorRepository {

    public int add(int a, int b) {
        return a + b;
    }
}