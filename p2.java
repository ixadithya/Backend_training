import java.util.Scanner;

class p2{
    public static void main(String[] args) {

        Scanner s=new Scanner(System.in);
        System.out.println("enter a number");
        int a=s.nextInt();
        
        if(a%2==0){
        System.out.print("given no. is even and ");
    }
    else{
        System.out.print("given no. is odd and ");
    }

    

    if(a>0){
        System.out.println("positive");

    }
    else if(a==0){
        System.out.println("zero");

    }
    else{
        System.out.println("negative");
    }



    }
}