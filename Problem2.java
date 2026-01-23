import java.util.Scanner;

class Problem2{
    public static void main(String[] args) {

    Scanner sc=new Scanner(System.in);
    
    System.out.println("Enter a number:");
    int num=sc.nextInt();
    if(num<0){
        System.out.println("Enter a positive number");
    }
    int sum=0;
    for(int i=1;i<=num;i++){
        System.out.println(i);
        sum=sum+i;
    }
    int j=1;
    System.out.println("even no. are");
    while(j<=num){
        if(j%2==0){
        System.out.println(j);}
        j++;
    }

    System.out.println("sum is"+sum);


}}
