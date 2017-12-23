package website;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

 
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
 
public class sendmailreset {
    private final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
    private String smtpServer; // SMTP��������ַ
    private String port; // �˿�
    private String username; // ��¼SMTP���������û���
    private String password; // ��¼SMTP������������
    private List<String> recipients = new ArrayList<String>(); // �ռ��˵�ַ����
    private String subject; // �ʼ�����
    private String content; // �ʼ�����
    private List<String> attachmentNames = new ArrayList<String>(); // ����·����Ϣ����
 
    public sendmailreset() {
 
    }
 
    public sendmailreset(String smtpServer, String port, String username,
            String password, List<String> recipients, String subject,
            String content, List<String> attachmentNames) {
        this.smtpServer = smtpServer;
        this.port = port;
        this.username = username;
        this.password = password;
        this.recipients = recipients;
        this.subject = subject;
        this.content = content;
        this.attachmentNames = attachmentNames;
    }
 
    public void setSmtpServer(String smtpServer) {
        this.smtpServer = smtpServer;
    }
 
    public void setPort(String port) {
        this.port = port;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
 
    public void setRecipients(List<String> recipients) {
        this.recipients = recipients;
    }
 
    public void setSubject(String subject) {
        this.subject = subject;
    }
 
    public void setContent(String content) {
        this.content = content;
    }
 
    public void setAttachmentNames(List<String> attachmentNames) {
        this.attachmentNames = attachmentNames;
    }
 
    /**
     * ����base64���ܣ���ֹ��������
     * */
    public String changeEncode(String str) {
        try {
            str = MimeUtility.encodeText(new String(str.getBytes(), "UTF-8"),
                    "UTF-8", "B"); // "B"����Base64
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return str;
    }
 
    /**
     * ��ʽ���ʼ�
     * */
    public boolean sendMail() {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", smtpServer);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.socketFactory.class", SSL_FACTORY);  //ʹ��JSSE��SSL socketfactory��ȡ��Ĭ�ϵ�socketfactory
        properties.put("mail.smtp.socketFactory.fallback", "false");  // ֻ����SSL������,���ڷ�SSL�����Ӳ�������
                                                                
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.socketFactory.port", port);
 
        Session session = Session.getInstance(properties);
        session.setDebug(true);
        MimeMessage message = new MimeMessage(session);
 
        try {
            // ������
            Address address = new InternetAddress(username);
            message.setFrom(address);
 
            // �ռ���
            for (String recipient : recipients) {
                System.out.println("�ռ��ˣ�" + recipient);
                Address toAddress = new InternetAddress(recipient);
                message.setRecipient(MimeMessage.RecipientType.TO, toAddress); // �����ռ���,���������������ΪTO
                /**
                 * TO�������н�����Ҫ�����ߡ� CC�������н��ĳ��ͽ����ߡ� BCC�������ʼ��İ��ͽ����ߡ�
                 * */
            }
 
            // ����
            message.setSubject(changeEncode(subject));
 
            // ʱ��
            message.setSentDate(new Date());
 
            Multipart multipart = new MimeMultipart();
            // �����ı�
            BodyPart text = new MimeBodyPart();
            text.setText(content);
            multipart.addBodyPart(text);
            // ���Ӹ���
            for (String fileName : attachmentNames) {
                BodyPart adjunct = new MimeBodyPart();
                FileDataSource fileDataSource = new FileDataSource(fileName);
                adjunct.setDataHandler(new DataHandler(fileDataSource));
                adjunct.setFileName(changeEncode(fileDataSource.getName()));
                multipart.addBodyPart(adjunct);
            }
            // ����ռ��˼��ϣ���������
            recipients.clear();
            attachmentNames.clear();
 
            message.setContent(multipart);
            message.saveChanges();
 
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
 
        try {
            Transport transport = session.getTransport("smtp");
            transport.connect(smtpServer, username, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
 
        return true;
    }
 
    public static void main(String to, String subject, String content) {
        List<String> recipients = new ArrayList<String>();
//        recipients.add("123456789@qq.com");
        recipients.add(to);
        //String subject = "����ʼ���Ϊ�˲���SMTP��SSL���ܴ���";
       // String content = "��������ʼ�������";
        Date now = new Date(); 
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");//���Է�����޸����ڸ�ʽ 

        String date = dateFormat.format( now ); 
        content = "\n\n\n\n\nHello! \n\nWe received a request to reset your account's password just now.\n   Click this link to reset your password: " + content + "\n\nIf you didn't request just now. Please ignore this email.  \n\n\n\n\nThank you\nHatefate account team\n" + date;
        List<String> attachmentNames = new ArrayList<String>();
        //attachmentNames.add("");
        sendmailreset sendmailreset = new sendmailreset("hwsmtp.exmail.qq.com", "465",
                "verificate@huangsk100.me", "*PASSWORD*", recipients, subject, content,
                attachmentNames);
        sendmailreset.sendMail();
    }
 
}