<%-- 
    Document   : home.jsp
    Created on : Sep 29, 2024, 11:38:05 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Home</title>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <%@include file="../allCss.jsp" %>

        <style>
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
                color: black;
            }
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
        </style>

    </head>
    <body  style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>

        <div class="container">
            <div class="row" style="margin-top: 45px">
                <div class="col-md-3">
                    <a href="add_books.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-square-plus fa-3x text-info"></i><br>
                                <h4>Add Books</h4>
                                -----------------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="all_books">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x text-success"></i><br>
                                <h4>All Books</h4>
                                -----------------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="orders.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
                                <h4>Orders</h4>
                                -----------------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a data-toggle="modal" data-target="#exampleModalCenter">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-right-from-bracket fa-3x text-info"></i><br>
                                <h4>Logout</h4>
                                -----------------
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>


        <div style="margin-top: 22%">
            <%@include file="footer.jsp" %>
        </div>
    </body>


</html>
