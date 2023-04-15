package uploadfile;

import java.security.MessageDigest;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class newPassword extends HttpServlet{
	private static final long serialVersionUID = 1L;
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
        @Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
			try {
                            
                                PrintWriter out = response.getWriter(); 
            Class.forName("com.mysql.cj.jdbc.Driver");
                                String url = "jdbc:mysql://localhost:3306/pdms?zeroDateTimeBehavior=CONVERT_TO_NULL";
                                Connection con = DriverManager.getConnection(url, "root", "123456");
                                out.println("test1");
				PreparedStatement pst = con.prepareStatement("update login set password = ? where username = ? ");
				pst.setString(1, getMd5(newPassword));
				pst.setString(2, (String)session.getAttribute("empid"));
				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					session.setAttribute("msg", "Password Successfully Reseted");
                                        session.setAttribute("status", "success");
                                        response.sendRedirect("index.jsp");
                                        
				} else {
					request.setAttribute("msg", "Password Reset Failed");
                                        session.setAttribute("status", "failed");
                                        response.sendRedirect("index.jsp");
				}
			} catch (IOException | ClassNotFoundException | SQLException e) {
			}
		}
                else
                {
                    session.setAttribute("msg","Password and Confirm Password are not same");
                    response.sendRedirect("newPassword.jsp");
                }
	}

}
