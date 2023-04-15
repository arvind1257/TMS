<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sun.misc.*"%>
<%@page import="Secret.*" %>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="logo.jpg">
        <title>PDMS</title>
        <script>
            function submit1()
            {
                if(document.getElementById("check").value==="done1")
                {
                    document.form1.submit();
                    alert("Successfully Modified");
                }
                if(document.getElementById("check").value==="done2")
                {
                    document.form1.action="passwordReset";
                    document.form1.submit();
                    alert("Successfully Saved");
                }
                else
                {
                    alert(document.getElementById("check").value);
                    history.back();
                }
            }
        </script>
    </head>
    <body onload="submit1()">
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
    try{    
    
        Connection con = (Connection)session.getAttribute("connection");
        Secret secret = new Secret();
        String uid = (String)session.getAttribute("uid");
        String uname = (String)session.getAttribute("uname");
        String udesi = (String)session.getAttribute("udesi");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String dob = request.getParameter("dob");
        String empid = request.getParameter("empid");
        String email = request.getParameter("email");
        String phone = secret.encode(request.getParameter("phone"));
        String role = secret.encode(request.getParameter("role"));
        if(request.getParameter("status")!=null && request.getParameter("status").equals("newuser")){
            PreparedStatement ps = con.prepareStatement("insert into empl(fname,lname,dob,email,phone,empid,desi) values(?,?,?,?,?,?,?)");
            ps.setString(1,fname);
            ps.setString(2,lname);
            ps.setString(3,dob);
            ps.setString(4,email);
            ps.setString(5,phone);
            ps.setString(6,empid);
            ps.setString(7,role);
            ps.executeUpdate();
            ps = con.prepareStatement("insert into login (uid,username,password) values(?,?,?)");
            ps.setString(1,empid);
            ps.setString(2,secret.encode(fname+"-123")); 
            ps.setString(3,getMd5(fname+"123"));
            ps.executeUpdate();
            %><input type="hidden" value="done2" id="check"/>
            <input form="form1" type="hidden" value="<%=empid%>" name="empid"/>
            <input form="form1" type="hidden" value="newuser" name="status"/><%
        }else{
        PreparedStatement ps = con.prepareStatement("update empl set fname=?,lname=?,dob=?,email=?,phone=? where empid=?");
        ps.setString(1,fname);
        ps.setString(2,lname);
        ps.setString(3,dob);
        ps.setString(4,email);
        ps.setString(5,phone);
        ps.setString(6,empid);
        ps.executeUpdate();
        session.setAttribute("uname",fname+" "+lname);
        %><input type="hidden" value="done1" id="check"/><%
        }
    }
    catch(Exception e)
    {
        %><input type="hidden" value="<%=e%>" id="check"/><%
    }
    %>
    <form name="form1"id="form1" action="profile.jsp" method="post"></form>    
        
    </body>
</html>

