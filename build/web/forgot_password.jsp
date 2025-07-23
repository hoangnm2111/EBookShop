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
        <div>
            <div class="wrapper mb-2 text-white">
                <h4>Forgot your password?</h4>
                <p>Change your password in three easy steps. This will help you to secure your password!</p>
                <ol>
                    <li>Enter your email address below.</li>
                    <li>Our system will send you an OTP to your email.</li>
                    <li>Enter the OTP on the next page.</li>
                </ol>
            </div>
            <div class="wrapper mt-2">
                <form action="forgotPassword" method="post">
                    <div class="input-field">
                        <input type="text" name="email" required>
                        <label>Enter your email address</label>
                    </div>
                    <button type="submit">Get New Password</button>
                    <div class="register">
                        Back to
                        <u><a href="login.jsp">Login</a></u>
                        or
                        <u><a href="register.jsp">Register</a></u>
                    </div>
                </form>
            </div>

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
