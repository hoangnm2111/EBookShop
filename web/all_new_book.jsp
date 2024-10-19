<%-- 
    Document   : all_new_book
    Created on : Oct 12, 2024, 1:41:10 AM
    Author     : HIEU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Book" %>
<%@page import="java.util.List" %>
<%@page import="dao.BooksDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Book</title>
        <%@include file="allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <style>
            .mg{
                display: flex;
                justify-content: center;
            }

            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -150px;
                padding: 15px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
            }
            #toast.success {
                background: linear-gradient(135deg, #4caf50, #81c784); /* Màu xanh cho thành công */
            }

            #toast.error {
                background: linear-gradient(135deg, #f44336, #ef5350); /* Màu đỏ cho thất bại */
            }

            #toast .progress {
                height: 5px;
                background: #ffffff;
                border-radius: 5px;
                margin-top: 10px;
                width: 100%;
                opacity: 0;
            }

            @keyframes moveUp {
                from {
                    bottom: 0;
                    opacity: 0;
                }
                to {
                    bottom: 30px;
                    opacity: 1;
                }
            }

            @keyframes fadeOut {
                from {
                    bottom: 30px;
                    opacity: 1;
                }
                to {
                    bottom: 0;
                    opacity: 0;
                }
            }

            @keyframes progress {
                from {
                    width: 100%;
                    opacity: 1;
                }
                to {
                    width: 0;
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>


        <c:if test="${not empty addCart}">
            <div id="toast">${addCart} 
                <div class="progress"></div>
            </div>
            <script type="text/javascript">
                function showToast() {
                    const toast = document.getElementById('toast');
                    const progress = toast.querySelector('.progress');

                    toast.className = 'display success';
                    toast.style.visibility = 'visible';


                    progress.style.width = '100%';
                    progress.style.opacity = '1';
                    progress.style.animation = 'progress 2.5s linear forwards';

                    setTimeout(() => {
                        toast.className = toast.className.replace('display', '');
                        toast.style.visibility = 'hidden';
                    }, 3000);
                }

                showToast();
            </script>
            <c:remove var="addCart" scope="session"/>

        </c:if>

        <c:if test="${not empty fail}">
            <h5 class="text-center text-danger" >${fail}</h5>
            <c:remove var="fail" scope="session"/>
        </c:if>

        <div class="container-fluid ">
            <div class="row justify-content-end">
                <div class="col-md-3 text-right">
                    <form method="GET" action="">
                        <label for="sortOrder" class="mr-2">Sort by Price:</label>
                        <select name="sortOrder" id="sortOrder" class="custom-select" onchange="this.form.submit()" style="width: 150px; display: inline-block;">
                            <option value="">Select</option>
                            <option value="ASC" <%= request.getParameter("sortOrder") != null && request.getParameter("sortOrder").equals("ASC") ? "selected" : "" %>>Ascending</option>
                            <option value="DESC" <%= request.getParameter("sortOrder") != null && request.getParameter("sortOrder").equals("DESC") ? "selected" : "" %>>Descending</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="row ">
                <%
               String sortOrder = request.getParameter("sortOrder");
                BooksDAO dao3 = new BooksDAO();
                List<Book> books3;
                if (sortOrder != null && (sortOrder.equals("ASC") || sortOrder.equals("DESC"))) {
                    books3 = dao3.getAllNewBookSortedByPrice(sortOrder);
                } else {
                    books3 = dao3.getAllNewBook();
                }
                for (Book b : books3) {
                %>
                <div class="col-md-3 p-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="<%=b.getPhotoName()%>" 
                                 style="width:150px;height: 200px" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row mg">
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=${acc.id}" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <a href="viewbook?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                                    }
                %>
            </div>
        </div>


    </body>


</html>