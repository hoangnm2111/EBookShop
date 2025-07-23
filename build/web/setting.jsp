<%-- 
    Document   : setting
    Created on : Oct 14, 2024, 9:56:10 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting</title>
        <%@include file="allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <style>
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
                color: #17a2b8;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">
                <h3 class="text-center mt-3">Hello, ${acc.name}</h3>
            <div class="row p-5">
                <div class="col-md-4">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-info">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h3>Sell Old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="old_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-info">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h3>Old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-info">
                                    <i class="fas fa-edit fa-3x"></i>
                                </div>
                                <h3>Update Profile</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="container-fluid mt-4">                 
                    <div class="row">
                        <div class="col-md-6">
                            <a href="order.jsp">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <div class="text-success">
                                            <i class="fas fa-box-open fa-3x"></i>
                                        </div>
                                        <h3>My Order</h3>
                                        <p>Track Your Order</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="help.jsp">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <div class="text-info">
                                            <i class="fas fa-user-circle fa-3x"></i>
                                        </div>
                                        <h3>Help Center</h3>
                                        <p>24*7 Service</p>
                                    </div>
                                </div>
                            </a>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
