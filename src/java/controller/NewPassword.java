/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.sun.jdi.connect.spi.Connection;
import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HIEU
 */
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            try {
                User u = new User();
                u.setPassword(newPassword);
                u.setEmail(email);
                UserDAO dao = new UserDAO();
                boolean f = dao.updatePassword(u);
                if (f) {
                    session.setAttribute("success", "Reset password successfully!");
                    response.sendRedirect("login.jsp");
                } else {
                    session.setAttribute("error", "Password reset failed!");
                    response.sendRedirect("login.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
