
class Student {

    private int id;
    private String name;
    private int marks;

    Student(int id, String name, int marks) {
        this.id = id;
        this.name = name;
        this.marks = marks;
    }

    public int getid() {
        return id;
    }

    public void setid(int id) {
        this.id = id;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }

    public int getmarks() {
        return marks;
    }

    public void setmarks(int marks) {
        this.marks = marks;
    }

    public boolean ispassed() {
        if (marks >=40) {
            return true;
        } else {
            return false;
        }
    }
}

public class Problem4 {

    public static void main(String[] args) {

        Student s1 = new Student(1, "Adithya", 96);
        System.out.println(s1.getname());

        Student s2=new Student(2,"Balu",99);
        System.out.println(s2.getmarks());

    }
}
