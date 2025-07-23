<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="dao.OrderDAO" %>
<%@page import="model.Order" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Orders</title>
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
            .status-processing {
                color: #4caf50;
            }
            .status-received {
                color: #2196F3;
            }
            .status-shipped {
                color: #FF9800;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>
        <h3 class="text-center p-3">All Orders</h3>
        <table class="table table-hover">
            <thead class="bg-dark text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment type</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    OrderDAO dao = new OrderDAO();
                    List<Order> list = dao.getAllOrder();
                    for(Order o : list){
                        String statusClass;
                        String orderStatus = o.getStatus();
                        
                        if (orderStatus == null) {
                            statusClass = ""; 
                            orderStatus = "Unknown"; 
                        } else {
                            switch (orderStatus) {
                                case "Processing":
                                    statusClass = "status-processing";
                                    break;
                                case "Received":
                                    statusClass = "status-received";
                                    break;
                                case "Shipped":
                                    statusClass = "status-shipped";
                                    break;
                                default:
                                    statusClass = "";
                            }
                        }
                %>
                <tr>
                    <th scope="row"><%= o.getOrderId() %></th>
                    <td><%= o.getUserName() %></td>
                    <td><%= o.getEmail() %></td>
                    <td><%= o.getFullAddress() %></td>
                    <td><%= o.getPhone() %></td>
                    <td><%= o.getBookName() %></td>
                    <td><%= o.getAuthor() %></td>
                    <td>$<%= o.getFormattedPrice() %></td>
                    <td><%= o.getPaymentType() %></td>
                    <td class="<%= statusClass %>"><%= orderStatus %></td>
                    <td>
                        <form action="update_order_status" method="post">
                            <input type="hidden" name="orderId" value="<%= o.getOrderId() %>">
                            <select name="status" class="form-select me-2" aria-label="Select status">
                                <option value="Processing" <%= "Processing".equals(o.getStatus()) ? "selected" : "" %>>Processing</option>
                                <option value="Received" <%= "Received".equals(o.getStatus()) ? "selected" : "" %>>Received</option>
                                <option value="Shipped" <%= "Shipped".equals(o.getStatus()) ? "selected" : "" %>>Shipped</option>
                            </select>
                            <input type="submit" value="Update" class="btn btn-info mt-2">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

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

        <div style="margin-top: 24%">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
