<%-- 
    Document   : register
    Created on : Sep 27, 2024, 1:00:34 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ebook: Register</title>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">


        <link href="login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <form action="register" method="post">
                <h2>Register</h2>
                <div class="input-field">
                    <input type="text" name="name" required>
                    <label>Enter your name</label>
                </div>
                <div class="input-field">
                    <input type="email" name="email" required>
                    <label>Enter your email</label>
                </div>
                <div class="input-field">
                    <input type="number" name="phone" required>
                    <label>Enter your phone</label>
                </div>
                <div class="input-field">
                    <input type="password" name="password" required>
                    <label>Enter your password</label>
                </div>
                <div class="forget">
                    <label for="remember">
                        <input type="checkbox" id="remember" name="check"> 
                        <span>Agree term & Condition</span>
                    </label>
                </div>
                <button type="submit">Register</button>
                <div class="register">
                    <p>Already have an account?<a href="login.jsp"> Login now</a></p>
                </div>
            </form>
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

        <c:if test="${not empty wrong}">
            <div id="toast">${wrong} 
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
            <c:remove var="wrong" scope="session"/>

        </c:if>

        <script>
            const inputs = document.querySelectorAll('.input-field input');

            inputs.forEach(input => {
                input.addEventListener('blur', () => {
                    // Nếu input không trống, giữ label ở trên
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
