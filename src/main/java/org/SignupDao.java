package org;

import java.sql.*;


public class SignupDao {

   
    public boolean isUsernameExists(String uname) {
        boolean exists = false;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT 1 FROM users WHERE username=?"
            );
            ps.setString(1, uname);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                exists = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return exists;
    }

    
    public boolean insert(String uname, String pass) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username,password) VALUES(?,?)"
            );

            ps.setString(1, uname);
            ps.setString(2, pass);

            int rows = ps.executeUpdate();
            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}