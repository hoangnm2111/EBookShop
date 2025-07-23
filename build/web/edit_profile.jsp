<%-- 
    Document   : sell_book
    Created on : Oct 14, 2024, 10:24:49 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="dao.UserDAO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
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

        <div class="container p-4">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow">
                        <div class="card-header text-center bg-info text-white">
                            <h4>Update Profile</h4>
                        </div>
                        <div class="card-body">



                            <form action="update_profile" method="post">
                                <input type="hidden" name="id" value="${acc.getId()}" />   
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="fullName">Full Name*</label>
                                            <input name="name" type="text" value="${acc.getName()}" class="form-control" id="fullName" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="email">Email Address*</label>
                                            <input name="email" type="email" class="form-control" value="${acc.getEmail()}" id="email" required readonly>
                                        </div>

                                        <div class="form-group">
                                            <label for="phone">Phone No*</label>
                                            <input name="phone" type="tel" class="form-control" value="${acc.getPhone()}" id="phone" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="usercol">ZIP Code*</label>
                                            <input name="usercol" type="text"  class="form-control" id="usercol" required>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="address">Address*</label>
                                            <input name="address" type="text" class="form-control" id="address"  required>
                                        </div>

                                        <div class="form-group">
                                            <label for="landmark">Landmark*</label>
                                            <input name="landmark" type="text" class="form-control" id="landmark"  required>
                                        </div>

                                        <div class="form-group">
                                            <label for="city">City*</label>
                                            <input name="city" type="text" class="form-control" id="city"  required>
                                        </div>

                                        <div class="form-group">
                                            <label for="state">State*</label>
                                            <input name="state" type="text" class="form-control" id="state"  required>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password">Enter password to confirm*</label>
                                    <input name="password" type="password" class="form-control" id="password" required>
                                </div>

                                <button type="submit" class="btn btn-info btn-block">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
