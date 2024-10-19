<%-- 
    Document   : view_book
    Created on : Oct 12, 2024, 2:47:07 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Book</title>
        <%@include file="allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">

    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>

        <div class="container p-4">
            <div class="row">

                <div class="col-md-6 text-center border p-5 bg-light">
                    <img src="${view.photoName}" style="width: 100px" /> <br/>
                    <h4 class="mt-3">Book Name: <span class="text-warning">${view.bookName}</span></h4>
                    <h4>Author Name: <span class="text-warning">${view.author}</span> </h4>
                    <h4>Category: <span class="text-warning">${view.bookCategory}</span> </h4>
                </div>
                <div class="col-md-6 text-center border p-5 bg-light">
                    <h2>Linux With Command</h2>

                    <c:if test="${view.bookCategory == 'Old'}">
                        <h5 class="text-primary">Contact to Seller</h5>
                        <h5 class="text-primary"><i class="fa-regular fa-envelope"></i> EMail: ${view.email}</h5>
                    </c:if>

                    <div class="row mt-3">
                        <div class="col-md-4 text-success text-center p-2">
                            <i class="fa-solid fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-success text-center p-2">
                            <i class="fa-solid fa-rotate-left fa-2x"></i>
                            <p>Return Available</p>

                        </div>
                        <div class="col-md-4 text-success text-center p-2">
                            <i class="fa-solid fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>
                    <c:if test="${view.bookCategory == 'Old'}">
                        <a href="./index.jsp" class="btn btn-success btn-sm ml-1 "><i class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
                        <a class="btn btn-danger btn-sm ml-1 "><i class="fa-solid fa-dollar-sign"></i>${view.price}</a>
                        </c:if>    
                        <c:if test="${view.bookCategory != 'Old'}">

                        <a href="cart?bid=${view.bookId}&&uid=${acc.id}" class="btn btn-info btn-sm ml-1 "><i class="fa-solid fa-cart-plus"></i>Add Card</a>
                        <a class="btn btn-danger btn-sm ml-1 "><i class="fa-solid fa-dollar-sign"></i>${view.price}</a>
                        </c:if>    

                </div>
            </div>
        </div>



    </body>
</html>
