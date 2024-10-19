<%-- 
    Document   : cart
    Created on : Oct 14, 2024, 5:10:05 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Cart" %>
<%@page import="model.User" %>
<%@page import="dao.BooksDAO" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
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
                background: linear-gradient(135deg, #4caf50, #81c784); 
            }

            #toast.error {
                background: linear-gradient(135deg, #f44336, #ef5350); 
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



        <div class="container-fluid"> 
            <div class="row p-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Select Item</h3>
                            <table class="table">
                                <thead class="thead-light">
                                    <tr>
                                        <th>#</th>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    BooksDAO dao = new BooksDAO();
                                    User u = (User) session.getAttribute("acc");
                                    if(u == null){
                                       response.sendRedirect("login.jsp");
                                    }
                                    List<Cart> cart = dao.getBookByUser(u.getId());
                                    int index = 1;
                                    Double totalPrice = 0.00;
                                    for (Cart c : cart) {
                                    totalPrice = c.getTotalPrice();
                                    %>
                                    <tr>
                                        <th scope="row"><%= index++ %></th>
                                        <td><%= c.getBookName()%></td>
                                        <td><%= c.getAuthor()%></td>
                                        <td>$<%= c.getPrice()%></td>
                                        <td>
                                            <a href="remove_book?cid=<%=c.getCid()%>" class="btn btn-danger">Remove</a> 
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    <tr>
                                        <th>Total Price:</th>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <th>$<%=totalPrice%></th>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>
                            <form action="order" method="post">
                                <input type="hidden" name="id" value="${acc.id}" />
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label >Name:</label>
                                        <input type="text" class="form-control"  value="${acc.name}" name="name" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Email:</label>
                                        <input type="email" class="form-control"  value="${acc.email}" name="email" required readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label >Mobile No:</label>
                                        <input type="number" class="form-control" value="${acc.phone}" name="phone" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Address:</label>
                                        <input type="text" class="form-control"  name="address" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label >Landmark:</label>
                                        <input type="text" class="form-control" value="" name="landmark" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label >City:</label>
                                        <input type="text" class="form-control" value="" name="city" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label >State:</label>
                                        <input type="text" class="form-control" value="" name="state" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Payment Type:</label>
                                        <select  class="form-control" name="paymentType" >
                                            <option value="noselect">----Select----</option>
                                            <option value="COD">Cash on Delivery</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>Zip</label>
                                        <input type="text" class="form-control" name="pincode" required>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-warning text-white">Order Now</button>
                                    <a href="./index.jsp" type="submit" class="btn btn-success">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
