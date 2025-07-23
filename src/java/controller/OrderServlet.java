/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BooksDAO;
import dao.CartDAO;
import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.Cart;
import model.Order;
//import static org.eclipse.jdt.internal.compiler.parser.Parser.name;
/**
 *
 * @author HIEU
 */
public class OrderServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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

        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String landmark = request.getParameter("landmark");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String paymentType = request.getParameter("paymentType");
        int id = Integer.parseInt(request.getParameter("id"));
        String fullAddress = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

        BooksDAO dao = new BooksDAO();
        List<Cart> list = dao.getBookByUser(id);

        if (list.isEmpty()) {
            session.setAttribute("fail", "Add Item, please.");
            response.sendRedirect("checkout.jsp");
        } else {
            OrderDAO dao2 = new OrderDAO();
            Order o = null;

            ArrayList<Order> orderList = new ArrayList<>();
            Random r = new Random();
            for (Cart c : list) {
                o = new Order();
                o.setOrderId("EBook-00" + r.nextInt(10000));
                o.setUserName(name);
                o.setEmail(email);
                o.setPhone(phone);
                o.setFullAddress(fullAddress);
                o.setBookName(c.getBookName());
                o.setAuthor(c.getAuthor());
                o.setPrice(c.getPrice());
                o.setPaymentType(paymentType);
                orderList.add(o);
            }

            if ("noselect".equals(paymentType)) {
                session.setAttribute("fail", "Choose Payment Method");
                response.sendRedirect("checkout.jsp");
            } else {
                boolean f = dao2.saveOrder(orderList);
                if (f) {
                    CartDAO dao3 = new CartDAO();
                    dao3.clearCartByUserId(id);

                    Cookie cartCookie = new Cookie("cart", "");
                    cartCookie.setMaxAge(0);
                    response.addCookie(cartCookie);
                    response.sendRedirect("order_success.jsp");
                } else {
                    session.setAttribute("fail", "Your Order Failed");
                    response.sendRedirect("checkout.jsp");
                }
            }

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
