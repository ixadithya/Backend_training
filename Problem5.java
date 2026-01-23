class Employee{
  private int id;
  private String name;
  private double monthlysalary;

static String companyname="innovatechs";

Employee(int id,String name,double monthlysalary){
  this.id=id;
  this.name=name;
  this.monthlysalary=monthlysalary;
}

double calannualsal(){
  return monthlysalary*12;
}


void dispempdetails(){
  System.out.println("company :"+companyname);
  System.out.println("ID "+id);
  System.out.println("name :"+name);
  System.out.println("monthlysalary :"+monthlysalary);
  System.out.println("annual salary :"+calannualsal());
}
}

class Problem5{
  public static void main(String[] args){
  Employee e1=new Employee(1,"A",1000);
    Employee e2=new Employee(2,"B",2000);

    e1.dispempdetails();
    e2.dispempdetails();
  }
}

