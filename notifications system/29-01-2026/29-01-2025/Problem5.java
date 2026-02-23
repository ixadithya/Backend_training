import java.io.*;
import java.util.*;
import java.util.logging.*;


class InvalidStudentException extends Exception {
    InvalidStudentException(String message) {
        super(message);
    }
}


class Student {

    private Integer id;
    private String name;
    private Integer age;

    Student(Integer id, String name, Integer age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

    Integer getId() {
        return id;
    }

    String toFileString() {
        return id + "," + name + "," + age;
    }

    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Student)) return false;
        Student s = (Student) o;
        return id.equals(s.id);
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }
}


public class Problem5 {

    private static final Logger logger = Logger.getLogger(Problem5.class.getName());

    public static void main(String[] args) {

        configureLogger();

        List<Student> validStudents = new ArrayList<>();
        List<String> invalidRecords = new ArrayList<>();
        Set<Student> uniqueStudents = new HashSet<>();

        File inputFile = new File("students.txt");
        File validFile = new File("valid.txt");
        File invalidFile = new File("invalid.txt");

        try (BufferedReader br = new BufferedReader(new FileReader(inputFile))) {

            logger.info("Started reading input file");

            String line;

            while ((line = br.readLine()) != null) {

                try {
                    Student student = parseAndValidate(line);

                    
                    if (uniqueStudents.add(student)) {
                        validStudents.add(student);
                    } else {
                        throw new InvalidStudentException("Duplicate record: " + line);
                    }

                } catch (Exception e) {
                    invalidRecords.add(line + " --> " + e.getMessage());
                    logger.warning("Invalid record skipped: " + line);
                }
            }

        } catch (IOException e) {
            logger.severe("File reading failed: " + e.getMessage());
        }

        writeToFile(validFile, validStudents);
        writeInvalidToFile(invalidFile, invalidRecords);

        logger.info("Processing completed successfully");
    }

    
    private static Student parseAndValidate(String line) throws InvalidStudentException {

        String[] parts = line.split(","); 

        if (parts.length != 3) {
            throw new InvalidStudentException("Incorrect format");
        }

        try {
            Integer id = Integer.valueOf(parts[0].trim()); 
            String name = cleanName(parts[1]);
            Integer age = Integer.valueOf(parts[2].trim());

            if (age < 18) {
                throw new InvalidStudentException("Age below 18");
            }

            return new Student(id, name, age);

        } catch (NumberFormatException e) {
            throw new InvalidStudentException("Invalid number format");
        }
    }

    
    private static String cleanName(String name) {
        StringBuilder sb = new StringBuilder();
        sb.append(name.trim().replaceAll("\\s+", " "));
        return sb.toString();
    }


    private static void writeToFile(File file, List<Student> students) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
            for (Student s : students) {   // for-each iteration
                bw.write(s.toFileString());
                bw.newLine();
            }
        } catch (IOException e) {
            logger.severe("Writing valid file failed");
        }
    }

    private static void writeInvalidToFile(File file, List<String> records) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
            Iterator<String> it = records.iterator(); // Iterator usage
            while (it.hasNext()) {
                bw.write(it.next());
                bw.newLine();
            }
        } catch (IOException e) {
            logger.severe("Writing invalid file failed");
        }
    }

    
    private static void configureLogger() {
        try {
            FileHandler fh = new FileHandler("app.log");
            fh.setFormatter(new SimpleFormatter());
            logger.addHandler(fh);
            logger.setUseParentHandlers(false);
        } catch (IOException e) {
            
        }
    }
}
