<%-- 
    Document   : sell_book
    Created on : Oct 14, 2024, 10:24:49 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Address</title>
        <%@include file="allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>

        <div class="container p-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-info">Edit Profile</h4>
                            <form>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress2">Landmark</label>
                                        <input type="text" class="form-control" id="inputAddress2">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">City</label>
                                        <input type="text" class="form-control" id="inputCity">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputState">State</label>
                                        <input type="text" class="form-control" id="inputCity">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputZip">Zip</label>
                                        <input type="text" class="form-control" id="inputZip">
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-warning text-white">Add Address</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </body>
</html>
