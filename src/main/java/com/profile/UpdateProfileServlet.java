package com.profile;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

int id = Integer.parseInt(request.getParameter("id"));
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");
String city = request.getParameter("city");



String[] skills = request.getParameterValues("skills");

String skillData = "";


if(skills != null){
    skillData = String.join(",", skills);
}

try{

Connection con = DBConnection.getConnection();

CallableStatement ps = con.prepareCall("{call update_profile(?,?,?,?,?)}");

ps.setInt(1, id);          
ps.setInt(2, age);         
ps.setString(3, gender);   
ps.setString(4, skillData);
ps.setString(5, city);    

ps.executeUpdate();

response.sendRedirect("index.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}