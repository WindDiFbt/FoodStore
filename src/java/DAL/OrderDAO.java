/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.chart;
import model.order_Details;
import model.orders;

/**
 *
 * @author Asus
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void insertOrder(orders order) {
        String query = "insert into dbo.Orders ([user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) "
                + " values (? , ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, order.getUser_id());
            ps.setString(2, order.getFullname());
            ps.setString(3, order.getEmail());
            ps.setString(4, order.getPhone_number());
            ps.setString(5, order.getAddress());
            ps.setString(6, order.getNote());
            ps.setTimestamp(7, order.getOrder_date());
            ps.setInt(8, order.getStatus());
            ps.setInt(9, order.getTotal_money());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertOrderDetail(int order_id, int product_id, int price, int amount) {
        String query = "insert into dbo.Orders_Details ([order_id], [product_id], [price], [amount]) "
                + " values (?, ?, ?, ?)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, order_id);
            ps.setInt(2, product_id);
            ps.setInt(3, price);
            ps.setInt(4, amount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getLastestOrderID() {
        String query = "SELECT MAX(order_id) as latest_order_id " + "FROM dbo.Orders";
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

    public List<orders> getOrder() {
        List<orders> list = new ArrayList<>();
        String query = "Select * from Dbo.Orders";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new orders(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getTimestamp(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public orders getOrderbyID(String order_id) {
        String query = "Select * from Dbo.Orders where order_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, order_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new orders(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getTimestamp(8), rs.getInt(9), rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<orders> getOrderbyStatus(String status) {
        String query = "Select * from Dbo.Orders where status = ?";
        List<orders> list = new ArrayList<>();
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new orders(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getTimestamp(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<order_Details> getDetail(String order_id) {
        List<order_Details> list = new ArrayList<>();
        String query = "SELECT *  FROM [dbo].[Orders_Details] od join dbo.Product p on od.product_id = p.product_id where order_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, order_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new order_Details(rs.getInt(1), rs.getInt(3), rs.getInt(4), rs.getString("name"), rs.getString("image")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateOrder(orders order) {
        String query = "Update dbo.Orders SET [fullname] = ? ,[email] = ? ,[phone_number] = ?,[address] = ? ,"
                + "[note] = ? where order_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, order.getFullname());
            ps.setString(2, order.getEmail());
            ps.setString(3, order.getPhone_number());
            ps.setString(4, order.getAddress());
            ps.setString(5, order.getNote());
            ps.setInt(6, order.getOrder_id());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changeStatusOrder(String order_id, int status) {
        String query = "Update dbo.Orders SET [status] = ? where order_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ps.setString(2, order_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void cancelOrder(int order_id) {
        String query = "Update dbo.Orders set status = 3 where order_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, order_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countOrdersInProcessing() {
        String query = "SELECT COUNT(*) FROM dbo.[Orders] WHERE status = 0";
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

    public int countOrdersForToday() {
        String query = "SELECT COUNT(*) FROM dbo.[Orders] WHERE order_date >= DATEADD(DAY, -1, GETDATE())";
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

    public int ordersPerDay(String date) {
        String query = "SELECT COUNT(*) FROM dbo.[Orders] WHERE CONVERT(date, order_date) = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<chart> getdata() {
        OrderDAO dao = new OrderDAO();
        List<chart> list = new ArrayList<>();
        for (int i = 9; i >= 0; i--) {
            String date = LocalDate.now().minusDays(i).toString();
            list.add(new chart(date, dao.ordersPerDay(date)));
        }
        return list;
    }

    public List<orders> searchOrderbyUserName(String name) {
        String query = "Select * from Dbo.Orders where fullname like ?";
        List<orders> list = new ArrayList<>();
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new orders(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getTimestamp(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
