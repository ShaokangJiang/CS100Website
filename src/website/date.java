package website;

import java.util.Date; 
import java.util.Calendar; 

import java.text.SimpleDateFormat; 

public class date{ 
public static void main(String[] args){ 
Date now = new Date(); 
SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");//���Է�����޸����ڸ�ʽ 

String hehe = dateFormat.format( now ); 
System.out.println(hehe); 
}
}