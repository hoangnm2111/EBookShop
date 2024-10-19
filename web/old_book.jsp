<%-- 
    Document   : old_book
    Created on : Oct 15, 2024, 3:10:32 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.User" %>
<%@page import="model.Book" %>
<%@page import="dao.BooksDAO" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User: Old Book</title>
        <%@include file="allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <style>
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
        <h2 class="text-info text-center mt-4">Old Book</h2>
        <div class="container p-4">
            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        User u = (User) session.getAttribute("acc");
                        if (u == null) {
                             response.sendRedirect("login.jsp");
                        }
                        String email = u.getEmail();
                        BooksDAO dao = new BooksDAO();
                        List<Book> list = dao.getBookByOld(email, "Old");
                        int index = 1;
                        for (Book b : list) {
                    %>
                    <tr>
                        <th scope="row"><%= index++ %></th>
                        <td><%= b.getBookName() %></td>
                        <td><%= b.getAuthor() %></td>
                        <td><%= b.getPrice() %></td>
                        <td><%= b.getBookCategory() %></td>
                        <td><a href="delete_old_book?em=<%= email %>&&id=<%= b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <%
                        } 
                    %>
                </tbody>
            </table>
        </div>

        <c:if test="${not empty success}">
            <div id="toast">${success} 
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
            <c:remove var="success" scope="session"/>

        </c:if>

        <c:if test="${not empty fail}">
            <div id="toast">${fail} 
                <div class="progress"></div>
            </div>
            <script type="text/javascript">
                function showToast() {
                    const toast = document.getElementById('toast');
                    const progress = toast.querySelector('.progress');

                    toast.className = 'display error';
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
            <c:remove var="fail" scope="session"/>

        </c:if>

    </body>
</html>
