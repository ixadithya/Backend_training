package task5;

public class CalculatorService {

    CalRepository repo;

    public CalculatorService(CalRepository repo) {
        this.repo = repo;
    }

    public int performAddition(int a, int b) {
        return repo.add(a, b);
    }
}
