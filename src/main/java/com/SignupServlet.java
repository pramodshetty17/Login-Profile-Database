package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import org.SignupDao;

@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        String pattern = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=!]).{8,}$";

     
        if(!pass.matches(pattern)) {
            response.sendRedirect("Signup.jsp?msg=Invalid Password Format");
            return;
        }

        SignupDao dao = new SignupDao();

       
        if(dao.isUsernameExists(uname)) {
            response.sendRedirect("Signup.jsp?msg=Username already exists");
            return;
        }

       
        if(dao.insert(uname, pass)) {
            response.sendRedirect("login.jsp?msg=Signup Successful");
        } else {
            response.sendRedirect("Signup.jsp?msg=Signup Failed");
        }
    }
}