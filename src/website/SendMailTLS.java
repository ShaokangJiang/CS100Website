package website;

import java.util.Properties;  
  
import javax.mail.Message;  
import javax.mail.MessagingException;  
import javax.mail.PasswordAuthentication;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
  
public class SendMailTLS {  
  
    public static void main(String to, String subject, String content) {  
  
        final String username = "hatefate@outlook.com";  
        final String password = "qwerty88";  
          
        //�ռ���  
        //String to = "huangsk100@gmail.com";  
  
        Properties props = new Properties();  
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.starttls.enable", "true");  
          
        //����������֤��У��  
        props.put("mail.smtp.ssl.checkserveridentity", "false");  
          
        //������εķ�������ַ�������ַ֮���ÿո�ֿ�  
        props.put("mail.smtp.ssl.trust", "smtp-mail.outlook.com");  
        props.put("mail.smtp.host", "smtp-mail.outlook.com");  
        props.put("mail.smtp.port", "587");  
  
        Session session = Session.getInstance(props,  
                new javax.mail.Authenticator() {  
                    protected PasswordAuthentication getPasswordAuthentication() {  
                        return new PasswordAuthentication(username, password);  
                    }  
                });  
  
        try {  
  
            Message message = new MimeMessage(session);  
            message.setFrom(new InternetAddress(username));  
            message.setRecipients(Message.RecipientType.TO,  
                    InternetAddress.parse(to));  
              
            message.setSubject(subject);  
            message.setText(content);  
  
            Transport.send(message);  
              
        } catch (MessagingException e) {  
            throw new RuntimeException(e);  
        }  
    }  
}  