package website;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


public class AesEncryptUtil {

    //ʹ��AES-128-CBC����ģʽ��key��ҪΪ16λ,key��iv������ͬ��
    private static String KEY = "dufy20170329java";

    private static String IV = "dufy20170329java";


    /**
     * ���ܷ���
     * @param data  Ҫ���ܵ�����
     * @param key ����key
     * @param iv ����iv
     * @return ���ܵĽ��
     * @throws Exception
     */
    public static String encrypt(String data, String key, String iv) throws Exception {
        try {

            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");//"�㷨/ģʽ/���뷽ʽ"
            int blockSize = cipher.getBlockSize();

            byte[] dataBytes = data.getBytes();
            int plaintextLength = dataBytes.length;
            if (plaintextLength % blockSize != 0) {
                plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));
            }

            byte[] plaintext = new byte[plaintextLength];
            System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);

            SecretKeySpec keyspec = new SecretKeySpec(key.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes());

            cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
            byte[] encrypted = cipher.doFinal(plaintext);

            return new Base64().encodeToString(encrypted);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * ���ܷ���
     * @param data Ҫ���ܵ�����
     * @param key  ����key
     * @param iv ����iv
     * @return ���ܵĽ��
     * @throws Exception
     */
    public static String desEncrypt(String data, String key, String iv) throws Exception {
        try {
            byte[] encrypted1 = new Base64().decode(data);

            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            SecretKeySpec keyspec = new SecretKeySpec(key.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes());

            cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);

            byte[] original = cipher.doFinal(encrypted1);
            String originalString = new String(original);
            return originalString;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * ʹ��Ĭ�ϵ�key��iv����
     * @param data
     * @return
     * @throws Exception
     */
    public static String encrypt(String data) throws Exception {
        return encrypt(data, KEY, IV);
    }

    /**
     * ʹ��Ĭ�ϵ�key��iv����
     * @param data
     * @return
     * @throws Exception
     */
    public static String desEncrypt(String data) throws Exception {
        return desEncrypt(data, KEY, IV);
    }



    /**
    * ����
    */
    public static void main(String args[]) throws Exception {

        String test = "$;Y-\\N?bYz9q?p.qZB/#@-YN;z";    		
        String key = "dufy20170329java";
        String iv = "dufy20170329java";

       // data = encrypt(test, key, iv);

       // System.out.println(data);
        System.out.println(desEncrypt(test, key, iv));
    }

}