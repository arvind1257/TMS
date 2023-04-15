package uploadfile;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession mySession = request.getSession();
        int otp = (int) mySession.getAttribute("otp");
        if (value == otp) {
            response.sendRedirect("newPassword.jsp");
        } else {
            mySession.setAttribute("msg", "Invalid OTP");
            mySession.setAttribute("status", "failed");
            response.sendRedirect("EnterOtp.jsp");
        }

    }

}
