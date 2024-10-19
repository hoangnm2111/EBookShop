<%-- 
    Document   : order_success
    Created on : Oct 16, 2024, 12:24:51 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
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

            .body {
                background-color: #f8f9fa;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                height: 10vh;
                padding-top: 60px;
            }
            .thank-you-container {
                background-color: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .thank-you-container img {
                width: 100px;
                margin-bottom: 20px;
            }
            .thank-you-container h1 {
                color: #28a745;
                font-size: 2.5rem;
                margin-bottom: 20px;
            }
            .thank-you-container p {
                font-size: 1.2rem;
                margin-bottom: 30px;
            }
            .btn-home {
                background-color: #007bff;
                color: white;
            }
            .btn-view-order {
                background-color: #dc3545;
                color: white;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>
        <div class="body">
            <div class="thank-you-container">
                <img src="https://img.icons8.com/color/100/000000/checked.png" alt="Success Icon">
                <h1>Thank You</h1>
                <p>Your Order Has Been Successfully Placed</p>
                <p>Within 7 Days Your Product Will Be Delivered to Your Address</p>
                <div>
                    <a href="index.jsp" class="btn btn-info btn-lg mr-2">Home</a>
                    <a href="order.jsp" class="btn btn-warning btn-lg">View Order</a>
                </div>
            </div>
        </div>

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


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>




    </body>
</html>
