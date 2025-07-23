<%-- 
    Document   : newPassword
    Created on : Oct 15, 2024, 6:59:16 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ebook: New Password</title>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <%@include file="allCss.jsp" %>

        <link href="login.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="wrapper">
            <form action="newPassword" method="post">
                <h2>Reset Password</h2>
                <input type="hidden" name="email" value="${email}" />
                <div class="input-field">
                    <input type="password" name="password" required>
                    <label>New Password</label>
                </div>
                <div class="input-field">
                    <input type="password" name="confPassword"  required>
                    <label>Confirm New Password</label>
                </div>
                <button type="submit">Reset</button>
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


</body>
</html>
