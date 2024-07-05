/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author Asus
 */
public class CategoryDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void insertCategory(String name) {
        String query = "insert into dbo.Category (name) values (?)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addtoDeletedCategory(category category) {
        String query = "insert into dbo.[Deleted_Category] (id, name) values (?, ?)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, category.getCategory_id());
            ps.setString(2, category.getName());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCategory(int category_id) {
        String query = "delete from dbo.Category where category_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, category_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateCategory(String category_id, String name) {
        String sql = "UPDATE dbo.Category SET name = ? WHERE category_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, category_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public category getCategoryByID(int id) {
        String query = "select * from dbo.Category where category_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<category> getAllCategory() {
        List<category> list = new ArrayList<>();
        String query = "Select * from Dbo.Category";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
