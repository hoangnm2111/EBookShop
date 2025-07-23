<%-- 
    Document   : add_books
    Created on : Sep 29, 2024, 3:42:25 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../allCss.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <style>
            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 70%;
                right: 30px;
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
    <body  style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>
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
        <div class="container">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>
                            <form action="${pageContext.request.contextPath}/admin1/add_books" method="post" enctype="multipart/form-data">
                                <input type="hidden" value="${userobj.email}" name="admin"/>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Author Name*</label>
                                    <input name="author" type="text" class="form-control" id="exampleInputPassword1" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input name="price" type="text" class="form-control" id="exampleInputPassword1" required step="0.01" pattern="\d+(\.\d{1,2})?">
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Categories*</label>
                                    <select id="inputState" name="category" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="New">New Book</option>
                                        <option value="Old">Old Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Status*</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="photoLink">Enter Photo Link*</label>
                                    <input name="photo" type="text" class="form-control" id="photoLink" placeholder="Enter image URL" required>
                                </div>


                                <button type="submit" class="btn btn-info">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
    <!--<input name="price" type="text" class="form-control" id="exampleInputPassword1" required step="0.01" pattern="\d+(\.\d{1,2})?">-->

    
    <%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>

    <!--<td><fmt:formatNumber value="....." type="number" minFractionDigits="2" maxFractionDigits="2" /></td>-->
