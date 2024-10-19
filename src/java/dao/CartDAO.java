/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import model.Cart;

/**
 *
 * @author HIEU
 */
public class CartDAO extends DBContext {

    public boolean addCard(Cart c) {
        boolean f = false;
        String sql = "insert into cart(bid,uid,bookName,author,price,total_price) values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public boolean deleteBook(int id) {
        boolean f = false;
        String sql = "delete from cart where cid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public void clearCartByUserId(int userId) {
        String query = "DELETE FROM Cart WHERE uid = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
