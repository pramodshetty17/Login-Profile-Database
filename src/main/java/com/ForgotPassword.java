package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.UpdateDao;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        
        String pattern = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=!]).{8,}$";

        if(!pass.matches(pattern)) {
            response.sendRedirect("forgot.jsp?msg=Password must be 8 chars, include capital, number & symbol");
            return;
        }

        UpdateDao dao = new UpdateDao();

        if(dao.updatePassword(uname, pass)) {
            response.sendRedirect("login.jsp?msg=Password updated successfully");
        } else {
            response.sendRedirect("forgot.jsp?msg=User not found");
        }
    }
}