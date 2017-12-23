package website;
import java.sql.*;
/**
 * 
 * @author Shaokang Jiang
 *
 */
public class En_De {
	/**
	 * 
	 * @param text need to encrypt word
	 * @param user username
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static String Encrypt(String text,String user) throws ClassNotFoundException{
		String re = "";
		try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connectionString =  
        "jdbc:sqlserver://test50.database.windows.net:1433;database=test;user=huangsk100@test50;password=*PASSWORD*;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";  
        Connection conn = DriverManager.getConnection(connectionString); 
		String random = "";
        char[] a=new char[text.length()];
		for(int i=0;i<text.length();i++){
			a[i]=text.charAt(i);
		}
		for(int i=0;i<text.length();i++) {
			int d = (int)(Math.random()*80);
				int u=0;
	        	u = a[i];
	        	u = u+d;
	        	if (u>=127) u -= 127;
	        	a[i] = (char)u;
			while(a[i]<33) {
				d = d+1;
				a[i]+=1;
			}
			random += d + ";";
			re += a[i];
		}
			PreparedStatement tmt2 = conn.prepareStatement("update dbo.favorite set random='"+ random +"' where Name='"+user+"'");
			tmt2.executeUpdate();
			conn.close();
			tmt2.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return re;
	}
	/**
	 * 
	 * @param text need to Decrypt word
	 * @param user username
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static String Decrypt(String text,String user) throws ClassNotFoundException{
		String re = "";
		try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connectionString =  
        "jdbc:sqlserver://test50.database.windows.net:1433;database=test;user=huangsk100@test50;password=*PASSWORD*;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";  
        Connection conn = DriverManager.getConnection(connectionString);
        PreparedStatement pStmt1 = conn.prepareStatement("select * from dbo.favorite where Name = '" + user + "'");  
        ResultSet rs1 = pStmt1.executeQuery();
		if(rs1.next()) {
        String random = rs1.getNString("random");
        String[] d = random.split(";");
        int[] h =new  int[d.length];
        for(int i=0;i<d.length;i++) {
        	h[i]=Integer.parseInt(d[i]);
        }
        
        char[] a = new char[text.length()];
		for(int i=0;i<text.length();i++){
			a[i]=text.charAt(i);
		}
		for(int i=0;i<text.length();i++) {
			re += Decryption(a[i], h[i]);
		}
		
		}else {
			re = "";
		}
		conn.close();
		rs1.close();
		pStmt1.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return re;
	}

	public static char Decryption(char a,int x){
		int u=0;
        	u = a;
        	u = u-x;
        	if(u<0) u = 127 + u;
        	a = (char)u;
        	 return a;
        }
      

	public static void main(String[] args) throws ClassNotFoundException, InterruptedException {
		String re = Encrypt("huangsk100","112dcvf");
		System.out.println(re);
		Thread.sleep(5000);
		String Re = Decrypt(re, "112dcvf");
		System.out.println(Re);

	}

}
