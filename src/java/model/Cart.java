/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HIEU
 */
public class Cart {
    private int cid;
    private int bid;
    private int userId;
    private String bookName;
    private String author;
    private double price;
    private double totalPrice;

    public Cart() {
    }

    public Cart(int cid, int bid, int userId, String bookName, String author, double price, double totalPrice) {
        this.cid = cid;
        this.bid = bid;
        this.userId = userId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

   

    
    
}
