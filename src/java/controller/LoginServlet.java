/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HIEU
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("login.jsp").forward(request, response);
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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String check = request.getParameter("check");

            if ("ebooksp24h@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User();
                us.setName("Admin");
                us.setEmail("ebooksp24h@gmail.com");
                request.getSession().setAttribute("userobj", us);
                response.sendRedirect("admin1/home.jsp");
            } else {
                UserDAO dao = new UserDAO();
                User u = dao.login(email, password);
                if (u == null) {
                    request.setAttribute("error", "Wrong email or password!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.getSession().setAttribute("acc", u);
                    HttpSession session = request.getSession();
                    session.setAttribute("id", u.getId());
                    System.out.println(u.getId());
                    Cookie c_u = new Cookie("cuser", email);
                    Cookie c_p = new Cookie("cpass", password);
                    Cookie c_r = new Cookie("crem", check != null ? "checked" : "");

                    if (check != null) {
                        c_u.setMaxAge(60 * 60 * 24);
                        c_p.setMaxAge(60);
                        c_r.setMaxAge(10);
                    } else {
                        c_u.setMaxAge(0);
                        c_p.setMaxAge(0);
                        c_r.setMaxAge(0);
                    }
                    response.addCookie(c_u);
                    response.addCookie(c_p);
                    response.addCookie(c_r);

                    response.sendRedirect("index.jsp");

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
