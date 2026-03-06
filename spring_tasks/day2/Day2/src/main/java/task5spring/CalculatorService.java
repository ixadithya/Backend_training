package task5spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalculatorService {

    @Autowired
    CalculatorRepository repo;

    public int performAddition(int a, int b) {
        return repo.add(a, b);
    }
}
