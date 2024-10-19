<%-- 
    Document   : sell_book
    Created on : Oct 14, 2024, 10:24:49 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="java.util.List" %>
<%@page import="dao.OrderDAO" %>
<%@page import="model.Order" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Address</title>
        <%@include file="allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <style>
            .status-processing {
                color: #4caf50;
            }
            .status-received {
                color: #2196F3;
            }
            .status-shipped {
                color: #FF9800; 
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>
        <h2 class="text-info text-center mt-4">Your Order</h2>
        <div class="container p-4">
            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                    User u = (User)session.getAttribute("acc");
                    OrderDAO dao = new OrderDAO();
                    List<Order> list = dao.getAllOrdersByEM(u.getEmail());
                    for(Order o : list){
                    String statusClass;
                        switch (o.getStatus()) {
                            case "Processing":
                                statusClass = "status-processing";
                                break;
                            case "Received":
                                statusClass = "status-received";
                                break;
                            case "Shipped":
                                statusClass = "status-shipped";
                                break;
                            default:
                                statusClass = "";
                        }
                    %>
                    <tr>
                        <th scope="row"><%= o.getOrderId()%></th>
                        <td><%= o.getUserName()%></td>
                        <td><%= o.getBookName()%></td>
                        <td><%= o.getAuthor()%></td>
                        <td>$<%= o.getPrice()%></td>
                        <td><%= o.getPaymentType()%></td>
                        <td class="<%= statusClass %>"><%= o.getStatus() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>


    </body>
</html>
