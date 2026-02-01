import java.util.*;

public class Problem2{


    public static void main(String[] args){

        HashMap<String,Integer> map=new HashMap<>();


        String[] words = {"apple", "banana", "apple", "orange", "banana", "apple"};

        List a=Arrays.asList(words);
        System.out.print(a);

        Set<String> hashset=new HashSet<> (a);
        System.out.println(hashset);

        for(String word:words){
            if(map.containsKey(word)){
                map.put(word,map.get(word)+1);
            }
            else{
                map.put(word,1);

            }
        }
        System.out.println(map);



        for(int i=0;i<a.size();i++){
            System.out.println(a.get(i));
        }

        for(String word:words){     
            System.out.println(word);
        }

        List<String> collection=Arrays.asList(words);
        Iterator<String> it=collection.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
            
        }

    }
}
