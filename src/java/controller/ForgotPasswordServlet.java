/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;

/**
 *
 * @author HIEU
 */
public class ForgotPasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        UserDAO dao = new UserDAO();

        if (email != null || !email.equals("")) {
            // sending otp
            if (dao.isEmailInDB(email)) {

                Random rand = new Random();
                otpvalue = rand.nextInt(1255650);

                String to = email;// change accordingly
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("ebooksp24h@gmail.com", "wsua zmff stcx yxiq");
                        
                    }
                });
                String htmlContent = "<!DOCTYPE html>"
                        + "<html lang='en'>"
                        + "<head>"
                        + "    <meta charset='UTF-8'>"
                        + "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                        + "    <title>Account Recovery</title>"
                        + "    <style>"
                        + "        body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; }"
                        + "        .container { max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 8px; padding: 20px; }"
                        + "        .header { background-color: #007bff; color: #ffffff; padding: 20px; text-align: center; }"
                        + "        .header h1 { margin: 0; font-size: 24px; }"
                        + "        .content { line-height: 1.6; }"
                        + "        .otp-code { font-size: 24px; color: #007bff; font-weight: bold; text-align: center; margin: 20px 0; }"
                        + "        .footer { padding: 10px; text-align: center; font-size: 12px; color: #777; background-color: #f4f4f4; }"
                        + "    </style>"
                        + "</head>"
                        + "<body>"
                        + "    <div class='container'>"
                        + "        <div class='header'>"
                        + "            <h1>Account Recovery</h1>"
                        + "        </div>"
                        + "        <div class='content'>"
                        + "            <p>Hello <strong>" + email + "</strong>,</p>"
                        + "            <p>You have requested to reset your account password.</p>"
                        + "            <p>Your OTP code is:</p>"
                        + "            <div class='otp-code'>" + otpvalue + "</div>"
                        + "            <p>Please enter this code to proceed with the recovery.</p>"
                        + "            <p>If you did not request this, please ignore this email.</p>"
                        + "        </div>"
                        + "        <div class='footer'>"
                        + "            <p>&copy; 2024 EBook Application. All rights reserved.</p>"
                        + "        </div>"
                        + "    </div>"
                        + "</body>"
                        + "</html>";

                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("EBook Account Recovery");
                    message.setContent(htmlContent, "text/html; charset=utf-8");
                    // send message
                    Transport.send(message);
                    System.out.println("message sent successfully");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                dispatcher = request.getRequestDispatcher("enterOtp.jsp");
                request.setAttribute("success", "OTP is sent to your email id");
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);
                dispatcher.forward(request, response);
            } else {
                dispatcher = request.getRequestDispatcher("forgot_password.jsp");
                request.setAttribute("error", "Email not registered, please register!");
                dispatcher.forward(request, response);
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
