<%-- 
    Document   : book_statistics
    Created on : Oct 17, 2024, 7:10:02 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dao.BooksDAO" %>
<%@page import="java.util.List" %>
<%@page import="java.text.DecimalFormat" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Book Statistics</title>
        <%@include file="../allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
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
                        <h4>Book Price Statistics</h4>
                        <ul class="statistics-list mt-4">

                            <%
                            BooksDAO dao = new BooksDAO();
                            List<Double> priceStats = dao.getPriceStatistics();
                            if (priceStats != null && priceStats.size() >= 5) {
                                double maxPrice = priceStats.get(0);
                                double minPrice = priceStats.get(1);
                                double avgPrice = priceStats.get(2);
                                double sumPrice = priceStats.get(3);
                                int countPrice = priceStats.get(4).intValue();

                                DecimalFormat df = new DecimalFormat("#.00");
                                String formattedAvgPrice = df.format(avgPrice);
                            %>
                            <li>Max Price: <span>$<%= maxPrice %></span></li>
                            <li>Min Price: <span>$<%= minPrice %></span></li>
                            <li>Average Price: <span>$<%= formattedAvgPrice %></span></li>
                            <li>Total Price: <span>$<%= sumPrice %></span></li>
                            <li>Number of Books: <span><%= countPrice %></span></li>
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
