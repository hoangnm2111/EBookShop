/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Cart;

/**
 *
 * @author HIEU
 */
public class BooksDAO extends DBContext {

    public boolean addBooks(Book b) {
        boolean f = false;
        String query = "INSERT INTO Books(bookName, author, price, bookCategory, status, photo, email)\n"
                + "VALUES (?, ?,?, ?, ?, ?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setDouble(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM Books";
        Book b = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public Book getBookById(int bookId) {
        String sql = "SELECT * FROM books WHERE bookId=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Book(
                        rs.getInt("bookId"),
                        rs.getString("bookName"),
                        rs.getString("author"),
                        rs.getFloat("price"),
                        rs.getString("bookCategory"),
                        rs.getString("status"),
                        rs.getString("photo"),
                        rs.getString("email")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean editBook(Book b) {
        String sql = "Update books set bookName=?, author=?, price=?, bookCategory=?, status=?, photo=? where bookId=?";
        boolean f = false;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setDouble(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setInt(7, b.getBookId());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public void deleteBook(int bookId) {
        String query = "delete from Books\n"
                + "where bookId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, bookId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Book> getNewBook() {
        String sql = "SELECT * FROM Books where bookCategory = ? and status = ? Order by bookId DESC";
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getRecentBook() {
        String sql = "SELECT * FROM Books where status = ? Order by bookId DESC";
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getOldBook() {
        String sql = "SELECT * FROM Books where bookCategory = ? and status = ? Order by bookId DESC";
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getAllNewBook() {
        String sql = "SELECT * FROM Books where bookCategory = ? and status = ? Order by bookId DESC";
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getAllRecentBook() {
        String sql = "SELECT * FROM Books where status = ? Order by bookId DESC";
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getAllOldBook() {
        String sql = "SELECT * FROM Books where bookCategory = ? and status = ? Order by bookId DESC";
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<>();
        Cart c = null;
        double totalPrice = 0;
        try {
            String sql = "select * from cart where uid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthor(rs.getString(5));
                c.setPrice(rs.getDouble(6));

                totalPrice = totalPrice + rs.getDouble(7);
                c.setTotalPrice(totalPrice);

                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Book> getBookByOld(String email, String cate) {
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            String sql = "Select * from books where bookCategory=? and email=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cate);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean deleteOldBook(String email, String cate, int id) {
        boolean f = false;
        try {
            String sql = "delete from books where bookCategory=? and email=? and bookId=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cate);
            ps.setString(2, email);
            ps.setInt(3, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public List<Book> getBookBySearch(String ch) {
        List<Book> list = new ArrayList<>();
        Book b = null;
        try {
            String sql = "Select * from books where bookname like ? or bookCategory like ? or author like ? or price like ? and status=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + ch + "%");
            ps.setString(2, "%" + ch + "%");
            ps.setString(3, "%" + ch + "%");
            ps.setString(4, "%" + ch + "%");
            ps.setString(5, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getFloat(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Double> getPriceStatistics() {
        List<Double> stats = new ArrayList<>();
        String sql = "SELECT MAX(price) as maxPrice, MIN(price) as minPrice, AVG(price) as avgPrice, SUM(price) as sumPrice, COUNT(price) as countPrice FROM Books";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stats.add(rs.getDouble("maxPrice"));
                stats.add(rs.getDouble("minPrice"));
                stats.add(rs.getDouble("avgPrice"));
                stats.add(rs.getDouble("sumPrice"));
                stats.add(rs.getDouble("countPrice"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }

    public List<Book> getAllRecentBookSortedByPrice(String order) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM Books ORDER BY price " + order;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setBookName(rs.getString("bookName"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setPhotoName(rs.getString("photo")); // Đảm bảo tên cột chính xác
                book.setBookCategory(rs.getString("bookCategory"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public List<Book> getAllOldBookSortedByPrice(String order) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM Books WHERE bookCategory = 'Old' ORDER BY price " + order;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setBookName(rs.getString("bookName"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setPhotoName(rs.getString("photo")); 
                book.setBookCategory(rs.getString("bookCategory"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
    
     public List<Book> getAllNewBookSortedByPrice(String order) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM Books WHERE bookCategory = 'New' ORDER BY price " + order;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setBookName(rs.getString("bookName"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setPhotoName(rs.getString("photo")); 
                book.setBookCategory(rs.getString("bookCategory"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

}
