/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.product;

/**
 *
 * @author Asus
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<product> getAllProduct() {
        List<product> list = new ArrayList<>();
        String query = "Select * from Dbo.Product";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalProduct() {
        String query = "Select count(*) from Dbo.Product";
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

    public List<product> getFirst20Product() {
        List<product> list = new ArrayList<>();
        String query = "Select top 16 * from Dbo.Product";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight")));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<product> getNext16Product(int index) {
        List<product> list = new ArrayList<>();
        String query = "Select * from Dbo.Product order by product_id offset ? rows fetch next 16 rows only";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 16);//need to change
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight")));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<product> getProductByCate_ID(String category_id) {
        List<product> list = new ArrayList<>();
        String query = "Select * from Dbo.Product\n where category_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public product getProductByID(String id) {
        String query = "Select * from Dbo.Product\n where product_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<product> searchProductByName(String name) {
        List<product> list = new ArrayList<>();
        String query = "Select * from Dbo.Product where [name] like ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertProduct(product product) {
        String query = "insert into dbo.Product (category_id, name, discount, image, ingredient, user_manual, more_info, created_at, "
                + "updated_at, deleted, price, weight) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, product.getCategory_id());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getDiscount());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getIngredient());
            ps.setString(6, product.getUser_manual());
            ps.setString(7, product.getMore_info());
            ps.setTimestamp(8, product.getCreated_at());
            ps.setTimestamp(9, product.getUpdated_at());
            ps.setInt(10, product.getDeleted());
            ps.setInt(11, product.getPrice());
            ps.setInt(12, product.getWeight());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(int product_id) {
        String query = "delete from dbo.Product where product_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProduct(product product) {
        String query = "Update dbo.Product SET [category_id] = ? ,[name] = ? ,[discount] = ?,[image] = ? ,"
                + "[ingredient] = ? ,[user_manual] = ?,[more_info] = ?,[updated_at] = ? ,[price] = ? ,[weight] = ? where product_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, product.getCategory_id());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getDiscount());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getIngredient());
            ps.setString(6, product.getUser_manual());
            ps.setString(7, product.getMore_info());
            ps.setTimestamp(8, product.getUpdated_at());
            ps.setInt(9, product.getPrice());
            ps.setInt(10, product.getWeight());
            ps.setInt(11, product.getProduct_id());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<product> getNext16ProductASC(int index) {
        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM Dbo.Product ORDER BY price ASC OFFSET ? ROWS FETCH NEXT 16 ROWS ONLY;";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 16);//need to change
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight")));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<product> getNext16ProductDESC(int index) {
        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM Dbo.Product ORDER BY price DESC OFFSET ? ROWS FETCH NEXT 16 ROWS ONLY;";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 16);//need to change
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getString("name"),
                        rs.getInt("discount"), rs.getString("image"), rs.getString("ingredient"),
                        rs.getString("user_manual"), rs.getString("more_info"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("deleted"), rs.getInt("price"),
                        rs.getInt("weight")));

            }
        } catch (Exception e) {
        }
        return list;
    }

}
