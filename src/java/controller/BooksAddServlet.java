/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BooksDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import model.Book;

/**
 *
 * @author HIEU
 */
@MultipartConfig
public class BooksAddServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BooksAddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BooksAddServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        request.getRequestDispatcher("/admin1/add_books.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        try {
            String bookName = request.getParameter("name");
            String author = request.getParameter("author");
            Double price = Double.parseDouble(request.getParameter("price"));
            String category = request.getParameter("category");
            String status = request.getParameter("status");
            String photo = request.getParameter("photo");
            String admin = request.getParameter("admin");
            Book b = new Book(bookName, author, price, category, status, photo, admin);
            BooksDAO dao = new BooksDAO();
            boolean f = dao.addBooks(b);
            
            if (f) {
                request.getSession().setAttribute("success", "Book Add Successfully...");
                request.getRequestDispatcher("/admin1/add_books.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("error", "Something wrong on Server");
                request.getRequestDispatcher("/admin1/add_books.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Something wrong on Server");
            request.getRequestDispatcher("/admin1/add_books.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
