<%-- 
    Document   : editBook
    Created on : Oct 7, 2024, 2:23:19 PM
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
        <title>Admin: Edit Books</title>
    </head>
    <body  style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>

        <div class="container">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Edit Books</h4>

                            <form action="${pageContext.request.contextPath}/admin1/editbook" method="post" enctype="multi/edipart/form-data">
                                <input name="idB" type="hidden" value="${edit.bookId}">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input name="name" type="text" value="${edit.bookName}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Author Name*</label>
                                    <input name="author" type="text" value="${edit.author}" class="form-control" id="exampleInputPassword1" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input name="price" type="number" value="${edit.price}" class="form-control" id="exampleInputPassword1" required>
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Categories*</label>
                                    <select id="inputState" name="category" class="form-control">
                                        <option value="New" ${edit.bookCategory == 'New' ? 'selected' : ''}>New Book</option>
                                        <option value="Old" ${edit.bookCategory == 'Old' ? 'selected' : ''}>Old Book</option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Book Status*</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <option value="Active" ${edit.status == 'Active' ? 'selected' : ''}>Active</option>
                                        <option value="Inactive" ${edit.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label for="photoLink">Enter Photo Link*</label>
                                    <input name="photo" type="text" class="form-control" id="photoLink" value="${edit.photoName}" placeholder="Enter image URL" required>
                                </div>


                                <button type="submit" class="btn btn-info">Edit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>