
package Secret;

import java.io.*;
import sun.misc.*;

public class Secret {
    sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
    
    sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
    
    public Secret(){
        super();
    }
    
    public String encode(String encodeStr){
        String encrypted = "";
        if(encodeStr == null){
            encodeStr = "";
        }
        if(!encodeStr.equals("")){
            encrypted = encoder.encode(encodeStr.getBytes());
        }
        else{
            encrypted = encodeStr;
        }
        return encrypted;
    }
    
    public String decode(String decodeStr) throws IOException {
        String decrypted = "";
        if(decodeStr == null){
            decodeStr = "";
        }
        if(!decodeStr.equals("")){
            decrypted = new String(decoder.decodeBuffer(decodeStr));
        }
        else{
            decrypted = decodeStr;
        }
        return decrypted;
    }
}
