import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;   
import java.util.List;
import java.util.ArrayList;


public class Problem1{

public static void rev(int st,int ed,String line){
        StringBuilder sb=new StringBuilder();
        for(int i=ed-1;i>=st;i--){
            sb.append(line.charAt(i));
        }
        System.out.println(" reversed string:");
        System.out.println(sb.toString());
        System.out.println(" ");


    }


    

    public static void main(String[] main){


    HashMap<String,Integer> Map=new HashMap<>();

    
    

        
    try{
        BufferedReader br=new BufferedReader(new FileReader("input.txt"));

        String line;
        String temp;
        int wordCount=0;
        int charCount=0;
        int sentenceCount=0;
        

        while((line=br.readLine())!=null){

            for(int i=0;i<line.length();i++){
                if(line.charAt(i)!=' '){
                    charCount++;
                }
                int st=0;
                if(line.charAt(i)=='.' || line.charAt(i)=='!' || line.charAt(i)=='?'){
                    int ed=i;
                    rev(st,ed,line);
                    st=i+1;
                    sentenceCount++;
            }
        }

        
        


        line=line.trim();
        if(!line.isEmpty()){//word count
            String[] words=line.split("\\s+");
            wordCount+=words.length;

            temp=line.toLowerCase();//frequency map
            temp=temp.replaceAll("[^a-zA-Z0-9\\s]", "");
            String[] cleanedWords=temp.split("\\s+");
            for(String word:cleanedWords){
                if(!word.isEmpty()){
                    Map.put(word,Map.getOrDefault(word,0)+1);
                }
            }

            String replacedspaces=line.replaceAll("\\s+"," ");//replaced multiple spaces with single space
            System.out.println("Line with single spaces: ");
            System.out.println(replacedspaces);

        }

        List<Map.Entry<String,Integer>> list=new ArrayList<>(Map.entrySet());

        list.sort((a,b)->b.getValue()-(a.getValue()));//sorting in descending order of frequency and printing top 5
        System.out.println("Top 5 most frequent words:");
        for(int i=0;i<Math.min(5,list.size());i++){
            Map.Entry<String,Integer> entry=list.get(i);
            System.out.println(entry.getKey()+": "+entry.getValue());
        }

    System.out.println("Number of words: "+wordCount);
    System.out.println("Number of characters: "+charCount);     
    System.out.println("Number of sentences: "+sentenceCount);
    System.out.println("Word Frequencies:");
    for(Map.Entry<String,Integer> entry:Map.entrySet()){    
        System.out.println(entry.getKey()+": "+entry.getValue());
        
         }
         
    


    
    br.close();
    }
}

catch(IOException e){
        e.printStackTrace();

        System.out.println("An error occurred while reading the file.");
    }


        String s1 = "HELLO";
        String s2 = "HELLO";
        String s3 =  new String("HELLO");

        System.out.println(s1 == s2);
        System.out.println(s1 == s3); 
        System.out.println(s1.equals(s2));
        System.out.println(s1.equals(s3));



            }
        }
        
       
            