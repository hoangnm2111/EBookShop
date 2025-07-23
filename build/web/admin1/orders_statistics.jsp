<%-- 
    Document   : orders_statistics.jsp
    Created on : Oct 17, 2024, 7:38:16 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dao.OrderDAO" %>
<%@page import="java.util.List" %>
<%@page import="java.text.DecimalFormat" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Order Statistics</title>
        <%@include file="../allCss.jsp" %>
        <link rel="icon" href="images/iconOrder.png" type="img/x-icon">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .statistics-card {
                background-color: #ffffff;
                border-radius: 15px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s;
            }
            .statistics-card:hover {
                transform: translateY(-5px);
            }
            .statistics-card h4 {
                font-size: 1.5rem;
                color: #343a40;
            }
            .statistics-list {
                list-style: none;
                padding: 0;
            }
            .statistics-list li {
                font-size: 1.2rem;
                padding: 8px 0;
                color: #495057;
            }
            .statistics-list li span {
                font-weight: bold;
                color: #007bff;
            }
            .container {
                margin-top: 50px;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="statistics-card p-4 text-center">
                        <h4>Order Amount Statistics</h4>
                        <ul class="statistics-list mt-4">

                            <%
                            OrderDAO dao = new OrderDAO();
                            List<Double> orderStats = dao.getOrderStatistics();
                            if (orderStats != null && orderStats.size() >= 5) {
                                double maxAmount = orderStats.get(0);
                                double minAmount = orderStats.get(1);
                                double avgAmount = orderStats.get(2);
                                double sumAmount = orderStats.get(3);
                                int countOrders = orderStats.get(4).intValue();

                                DecimalFormat df = new DecimalFormat("#.00");
                                String formattedAvgAmount = df.format(avgAmount);
                            %>
                            <li>Max Amount: <span>$<%= maxAmount %></span></li>
                            <li>Min Amount: <span>$<%= minAmount %></span></li>
                            <li>Average Amount: <span>$<%= formattedAvgAmount %></span></li>
                            <li>Total Amount: <span>$<%= sumAmount %></span></li>
                            <li>Number of Orders: <span><%= countOrders %></span></li>
                                <%
                                    } else {
                                %>
                            <li>No data available.</li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
