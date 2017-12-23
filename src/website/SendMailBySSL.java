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
 
public class SendMailBySSL {
    private final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
    private String smtpServer; // SMTP服务器地址
    private String port; // 端口
    private String username; // 登录SMTP服务器的用户名
    private String password; // 登录SMTP服务器的密码
    private List<String> recipients = new ArrayList<String>(); // 收件人地址集合
    private String subject; // 邮件主题
    private String content; // 邮件正文
    private List<String> attachmentNames = new ArrayList<String>(); // 附件路径信息集合
 
    public SendMailBySSL() {
 
    }
 
    public SendMailBySSL(String smtpServer, String port, String username,
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
     * 进行base64加密，防止中文乱码
     * */
    public String changeEncode(String str) {
        try {
            str = MimeUtility.encodeText(new String(str.getBytes(), "UTF-8"),
                    "UTF-8", "B"); // "B"代表Base64
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return str;
    }
 
    /**
     * 正式发邮件
     * */
    public boolean sendMail() {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", smtpServer);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.socketFactory.class", SSL_FACTORY);  //使用JSSE的SSL socketfactory来取代默认的socketfactory
        properties.put("mail.smtp.socketFactory.fallback", "false");  // 只处理SSL的连接,对于非SSL的连接不做处理
                                                                
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.socketFactory.port", port);
 
        Session session = Session.getInstance(properties);
        session.setDebug(true);
        MimeMessage message = new MimeMessage(session);
 
        try {
            // 发件人
            Address address = new InternetAddress(username);
            message.setFrom(address);
 
            // 收件人
            for (String recipient : recipients) {
                System.out.println("收件人：" + recipient);
                Address toAddress = new InternetAddress(recipient);
                message.setRecipient(MimeMessage.RecipientType.TO, toAddress); // 设置收件人,并设置其接收类型为TO
                /**
                 * TO：代表有健的主要接收者。 CC：代表有健的抄送接收者。 BCC：代表邮件的暗送接收者。
                 * */
            }
 
            // 主题
            message.setSubject(changeEncode(subject));
 
            // 时间
            message.setSentDate(new Date());
 
            Multipart multipart = new MimeMultipart();
            // 添加文本
            BodyPart text = new MimeBodyPart();
            text.setText(content);
            multipart.addBodyPart(text);
            // 添加附件
            for (String fileName : attachmentNames) {
                BodyPart adjunct = new MimeBodyPart();
                FileDataSource fileDataSource = new FileDataSource(fileName);
                adjunct.setDataHandler(new DataHandler(fileDataSource));
                adjunct.setFileName(changeEncode(fileDataSource.getName()));
                multipart.addBodyPart(adjunct);
            }
            // 清空收件人集合，附件集合
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
        //String subject = "这封邮件是为了测试SMTP的SSL加密传输";
       // String content = "这是这封邮件的正文";
        Date now = new Date(); 
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");//可以方便地修改日期格式 

        String date = dateFormat.format( now ); 
        content = "\n\n\n\n\nHello! \n\n Welcome to hatefate.\n   Click this link to finish your registration: " + content + "\n\nFeel free to choose 5 to 10 hates and make new friendds! \n\n\n\n\nThank you\nHatefate account team\n" + date;
        List<String> attachmentNames = new ArrayList<String>();
        //attachmentNames.add("");
        SendMailBySSL sendMailBySSL = new SendMailBySSL("hwsmtp.exmail.qq.com", "465",
                "verificate@huangsk100.me", "*PASSWORD*", recipients, subject, content,
                attachmentNames);
        sendMailBySSL.sendMail();
    }
 
}