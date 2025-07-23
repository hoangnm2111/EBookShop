/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author HIEU
 */
public class OrderDAO extends DBContext {

    public boolean saveOrder(List<Order> order) {
        boolean f = false;
        try {
            String sql = "insert into Orders(orderId,userName,email,address,phone,bookName,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(sql);
            for (Order o : order) {
                ps.setString(1, o.getOrderId());
                ps.setString(2, o.getUserName());
                ps.setString(3, o.getEmail());
                ps.setString(4, o.getFullAddress());
                ps.setString(5, o.getPhone());
                ps.setString(6, o.getBookName());
                ps.setString(7, o.getAuthor());
                ps.setString(8, o.getPrice());
                ps.setString(9, o.getPaymentType());
                ps.addBatch();
            }
            int[] count = ps.executeBatch();
            connection.commit();
            f = true;
            connection.setAutoCommit(true);

        } catch (Exception e) {
            System.out.println(e);
        }

        return f;
    }

    public List<Order> getAllOrdersByEM(String email) {
        List<Order> list = new ArrayList<>();

        String sql = "  SELECT * FROM Orders WHERE email = ? ORDER BY Id DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setId(rs.getInt("id"));
                    o.setOrderId(rs.getString("orderId"));
                    o.setUserName(rs.getString("userName"));
                    o.setEmail(rs.getString("email"));
                    o.setFullAddress(rs.getString("address"));
                    o.setPhone(rs.getString("phone"));
                    o.setBookName(rs.getString("bookName"));
                    o.setAuthor(rs.getString("author"));
                    o.setPrice(rs.getDouble("price"));
                    o.setPaymentType(rs.getString("payment"));
                    o.setStatus(rs.getString("status"));
                    list.add(o); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }

        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();

        String sql = "SELECT * FROM Orders ORDER BY id DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setOrderId(rs.getString("orderId"));
                o.setUserName(rs.getString("userName"));
                o.setEmail(rs.getString("email"));
                o.setFullAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setBookName(rs.getString("bookName"));
                o.setAuthor(rs.getString("author"));
                o.setPrice(rs.getDouble("price"));
                o.setPaymentType(rs.getString("payment"));
                o.setStatus(rs.getString("status"));
                list.add(o); 
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }

        return list;
    }

    public List<Double> getOrderStatistics() {
        List<Double> stats = new ArrayList<>();
        String sql = "SELECT \n"
                + "    MAX(CAST(price AS FLOAT)) AS maxAmount, \n"
                + "    MIN(CAST(price AS FLOAT)) AS minAmount, \n"
                + "    AVG(CAST(price AS FLOAT)) AS avgAmount, \n"
                + "    SUM(CAST(price AS FLOAT)) AS sumAmount, \n"
                + "    COUNT(orderId) AS countOrders \n"
                + "FROM \n"
                + "    Orders\n"
                + "WHERE \n"
                + "    TRY_CAST(price AS FLOAT) IS NOT NULL;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stats.add(rs.getDouble("maxAmount"));
                stats.add(rs.getDouble("minAmount"));
                stats.add(rs.getDouble("avgAmount"));
                stats.add(rs.getDouble("sumAmount"));
                stats.add(rs.getDouble("countOrders"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }

    public boolean updateOrderStatus(String orderId, String status) {
        try {
            String sql = "UPDATE orders SET status = ? WHERE orderId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
