/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.*;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.user;

/**
 *
 * @author Asus
 */
public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public user login(String account_name, String password) {
        String query = "select * from [dbo].[User] where account_name COLLATE SQL_Latin1_General_CP1_CS_AS = ? and password COLLATE SQL_Latin1_General_CP1_CS_AS = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, account_name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new user(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getTimestamp(9),
                        rs.getTimestamp(10), rs.getInt(11), rs.getDate(12),
                        rs.getInt(13), rs.getString(14));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public user checkUserExist(String account_name) {
        String query = "select * from [dbo].[User] where account_name like ? ";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, account_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new user(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getTimestamp(9),
                        rs.getTimestamp(10), rs.getInt(11), rs.getDate(12),
                        rs.getInt(13), rs.getString(14));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signupUser(user user) {
        String query = "INSERT INTO [User] (roleNo, fullname, email, phone_number, address, account_name, password, created_at, updated_at, deleted, date_of_birth, gender, avatar) VALUES "
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, ?)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, user.getRoleNo()); // roleNo
            ps.setString(2, user.getFullname());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone_number());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getAccount_name());
            ps.setString(7, user.getPassword());
            ps.setTimestamp(8, user.getCreated_at());
            ps.setTimestamp(9, user.getUpdated_at());
            ps.setDate(10, user.getDate_of_birth());
            ps.setInt(11, user.getGender());
            ps.setString(12, user.getAvatar());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<user> getAllUser() {
        List<user> list = new ArrayList<>();
        String query = "select * from dbo.[User] where roleNo = 0";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new user(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getTimestamp(9),
                        rs.getTimestamp(10), rs.getInt(11), rs.getDate(12),
                        rs.getInt(13), rs.getString(14)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteUser(String user_id, String deleted) {
        String sql = "UPDATE dbo.[User] SET deleted = ? WHERE user_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, deleted);
            ps.setString(2, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateUser(user user) {
        String query = "UPDATE [dbo].[User] SET [fullname] = ?, [phone_number] = ? ,[email] = ? ,[address] = ?, [updated_at] = ? WHERE user_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getPhone_number());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAddress());
            ps.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
            ps.setInt(6, user.getUser_id());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public user getUser(int user_id) {
        String query = "select * from [dbo].[User] where user_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new user(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getTimestamp(9),
                        rs.getTimestamp(10), rs.getInt(11), rs.getDate(12),
                        rs.getInt(13), rs.getString(14));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void changePassword(int user_id, String password) {
        String query = "UPDATE [dbo].[User] SET [password] = ?, [updated_at] = ? WHERE user_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            ps.setInt(3, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countNewUserPerWeek() {
        String query = "SELECT COUNT(*) FROM dbo.[User] WHERE created_at >= DATEADD(WEEK, -1, GETDATE())";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<user> searchUserByName(String name) {
        List<user> list = new ArrayList<>();
        String query = "select * from [dbo].[User] where fullname like ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new user(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getTimestamp(9),
                        rs.getTimestamp(10), rs.getInt(11), rs.getDate(12),
                        rs.getInt(13), rs.getString(14)));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
