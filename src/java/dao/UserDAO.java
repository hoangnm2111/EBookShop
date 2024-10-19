/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author HIEU
 */
public class UserDAO extends DBContext {

    public User login(String email, String password) {
        String query = "SELECT * FROM USERS where EMAIL=? and password=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkUserExist(String email) {
        String query = "SELECT * FROM USERS where EMAIL=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void register(String name, String email, String phone, String password) {
        String query = "INSERT INTO Users(name, email, phone, password) \n"
                + "VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, password);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean checkPassword(int id, String pw) {
        boolean f = false;
        try {
            String sql = "select * from users where id=? and password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, pw);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public boolean updateProfile(User user) {
        String sql = "UPDATE users SET name = ?, email = ?, phone = ?, usercol = ?, address = ?, landmark = ?, city = ?, state = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPincode());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getLandmark());
            ps.setString(7, user.getCity());
            ps.setString(8, user.getState());
            ps.setInt(9, user.getId());
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePassword(User us) {
        boolean f = false;
        String query = "update users set password = ? where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, us.getPassword());
            ps.setString(2, us.getEmail());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPincode(rs.getString("usercol"));
                user.setAddress(rs.getString("address"));
                user.setLandmark(rs.getString("landmark"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean isEmailInDB(String email) {
        boolean emailExists = false;
        try {
            
            String query = "SELECT email FROM Users WHERE email = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                emailExists = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return emailExists;
    }

}
