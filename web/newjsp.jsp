<%@page import="java.sql.*"%>
<%@page import="sun.misc.*"%>
<%@page import="Secret.*" %>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
    public static String getMd5(String input)
    {
        try 
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) 
            {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    } 
%>
        <%
            String encodeStr = "files\\HCI Reseach Paper.pdf";
            Secret secret = new Secret();
            encodeStr = secret.encode(encodeStr);
            
        %>
        <%=encodeStr%>
    </body>
</html>
