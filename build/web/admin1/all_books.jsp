<%-- 
    Document   : all_books
    Created on : Sep 29, 2024, 3:47:15 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Books</title>
        <%@include file="../allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <style>
            #toast {
                min-width: 300px;
                position: fixed;
                top: 30px;
                left: 50%;
                transform: translateX(-50%);
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
        <h3 class="text-center p-3">All Books</h3>



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

        <c:if test="${not empty error}">
            <div id="toast">${error} 
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
            <c:remove var="error" scope="session"/>

        </c:if>

        <table class="table table-hover text-center">
            <thead class="bg-dark text-white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">IMAGE</th>
                    <th scope="col">BOOK NAME</th>
                    <th scope="col">AUTHOR</th>
                    <th scope="col">PRICE</th>
                    <th scope="col">CATEGORIES</th>
                    <th scope="col">STATUS</th>
                    <th scope="col">ACTION</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="b" items="${sessionScope.books}">
                    <tr>
                        <th>${b.bookId}</th>
                        <td><img src="${b.photoName}" style="width: 50px; height: 60px"></td>
                        <td>${b.bookName}</td>
                        <td>${b.author}</td>
                        <td>${b.formattedPrice}</td>
                        <td>${b.bookCategory}</td>
                        <td>${b.status}</td>
                        <td>
                            <a href="editbook?id=${b.bookId}" class="btn btn-sm btn-info"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                            <a href="delete?bookId=${b.bookId}" class="btn btn-sm btn-danger"><i class="fa-solid fa-delete-left"></i> Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>


</html>
