package website;

import java.util.Date; 
import java.util.Calendar; 

import java.text.SimpleDateFormat; 

public class date{ 
public static void main(String[] args){ 
Date now = new Date(); 
SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");//可以方便地修改日期格式 

String hehe = dateFormat.format( now ); 
System.out.println(hehe); 
}
}