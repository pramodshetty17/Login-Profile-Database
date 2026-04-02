package org;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateDao {

    public boolean updatePassword(String uname, String pass) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "update users set pass=? where uname=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, pass);
            ps.setString(2, uname);

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}