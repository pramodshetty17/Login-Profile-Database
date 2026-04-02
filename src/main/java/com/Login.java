package com;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        LoginDao dao = new LoginDao();

        if(dao.check(uname, pass)) {

            HttpSession session = request.getSession();
            session.setAttribute("username", uname);

            response.sendRedirect("index.jsp");

        } else {
            
            response.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }
}