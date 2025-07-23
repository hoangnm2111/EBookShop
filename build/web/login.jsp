<%-- 
    Document   : login
    Created on : Sep 27, 2024, 1:06:56 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ebook: Login</title>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <%@include file="allCss.jsp" %>

        <link href="login.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <%
            Cookie[] cookies = request.getCookies();
            String email = "";
            String password = "";

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("cuser".equals(cookie.getName())) {
                        email = cookie.getValue();
                    } else if ("cpass".equals(cookie.getName())) {
                        password = cookie.getValue();
                    }
                }
            }

            request.setAttribute("email", email);
            request.setAttribute("password", password);
        %>

        <div class="wrapper">
            <form action="login" method="post">
                <h2>Login</h2>
                <div class="input-field">
                    <input type="email" name="email" value="${email}" required>
                    <label>Enter your email</label>
                </div>
                <div class="input-field">
                    <input type="password" name="password" value="${password}" required>
                    <label>Enter your password</label>
                </div>
                <div class="forget">
                    <label for="remember">
                        <input type="checkbox" id="remember" name="check"> 
                        <span>Remember me</span>
                    </label>
                    <a href="forgot_password.jsp">Forgot password?</a>
                </div>
                <button type="submit">Log In</button>
                <div class="register">
                    <p>Don't have an account? <a href="register.jsp">Register</a></p>
                </div>
            </form>
        </div>

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


        <script>
            const inputs = document.querySelectorAll('.input-field input');

            inputs.forEach(input => {
                input.addEventListener('blur', () => {
                    if (input.value) {
                        input.classList.add('filled');
                    } else {
                        input.classList.remove('filled');
                    }
                });
            });
        </script>
    </body>

</html>
