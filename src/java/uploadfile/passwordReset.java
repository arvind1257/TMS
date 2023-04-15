package uploadfile;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import sun.misc.*;
import Secret.*;

public class passwordReset extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Secret secret = new Secret();
            PrintWriter out = response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/pdms?zeroDateTimeBehavior=CONVERT_TO_NULL";
            Connection con = DriverManager.getConnection(url, "root", "123456");
            Statement stm = con.createStatement();
            ResultSet rs = null;
            String email = request.getParameter("email");
            String emp = request.getParameter("empid");
            
            out.println("hi1");
            int otpvalue = 0;
            HttpSession mySession = request.getSession();
            
                        out.println(emp);
            if (emp!=null) {
                String sql= "select * from login inner join empl on uid=empid where username='" + secret.encode(emp) + "'";
                if(request.getParameter("status")!=null && request.getParameter("status").equals("newuser")){
                    sql = "select * from login inner join empl on uid=empid where uid='" + emp + "'";
                }
                out.println(sql);
                rs = stm.executeQuery(sql);
                while (rs.next()) {
                    out.println("hi");
                    if ((rs.getString("email") != null && rs.getString("email").equals(email)) || (request.getParameter("status")!=null && request.getParameter("status").equals("newuser"))) {
                        Random rand = new Random();
                        out.println("hi1");
                        otpvalue = rand.nextInt(900000) + 100000;
                        String to = email;
                        if(request.getParameter("status")!=null && request.getParameter("status").equals("newuser")){
                            to=rs.getString("email");
                        }
                        
                        out.println(to);
                        Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
                        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                            @Override
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication("mmarvind12@gmail.com", "fgbfktmvfxmydvoh");// Put your email
                                // password here
                            }
                        });
                        try {
                            
                        out.println("hi5");
                            MimeMessage message = new MimeMessage(session);
                            message.setFrom(new InternetAddress(rs.getString("email")));
                            
                        out.println("hi1");
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                            
                        out.println("hi7");
                            if(request.getParameter("status")!=null && request.getParameter("status").equals("newuser")){
                                message.setSubject("TMS Credentials");
                                message.setText("Hello, " + rs.getString("fname") +" "+ rs.getString("lname")+ "\n Your Credentials are \n username: " + secret.decode(rs.getString("username"))+"\n password : "+rs.getString("fname")+"123\n");                            
                            }
                            else{
                                message.setSubject("OTP for Reset Password");
                                message.setText("Hello, " + rs.getString("fname") +" "+ rs.getString("lname")+ "\n Your OTP for resetting the password is " + otpvalue);
                            
                            }
                            Transport.send(message);
                            
                        out.println("hi8");
                        } catch (MessagingException e) {
                            throw new RuntimeException(e);
                        }
                        if(request.getParameter("status")==null){
                        mySession.setAttribute("otp", otpvalue);
                        mySession.setAttribute("empid", secret.encode(emp));
                        response.sendRedirect("EnterOtp.jsp");
                        }
                        else{
                            response.sendRedirect("team_dashboard.jsp");
                        }
                    } else {
                        mySession.setAttribute("msg", "Invalid Username/Email ID");
                        mySession.setAttribute("status", "failed");
                        response.sendRedirect("forgotPassword.jsp");
                    }
                }

            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(passwordReset.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(passwordReset.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
