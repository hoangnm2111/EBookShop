<%-- 
    Document   : all_old_book
    Created on : Oct 12, 2024, 1:41:24 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Book" %>
<%@page import="java.util.List" %>
<%@page import="dao.BooksDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Old Book</title>
        <%@include file="allCss.jsp" %>
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">
        <style>
            .mg{
                display: flex;
                justify-content: center;
            }
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row justify-content-end">
                <div class="col-md-3 text-right">
                    <form method="GET" action="">
                        <label for="sortOrder" class="mr-2">Sort by Price:</label>
                        <select name="sortOrder" id="sortOrder" class="custom-select" onchange="this.form.submit()" style="width: 150px; display: inline-block;">
                            <option value="">Select</option>
                            <option value="ASC" <%= request.getParameter("sortOrder") != null && request.getParameter("sortOrder").equals("ASC") ? "selected" : "" %>>Ascending</option>
                            <option value="DESC" <%= request.getParameter("sortOrder") != null && request.getParameter("sortOrder").equals("DESC") ? "selected" : "" %>>Descending</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="row">
                <%
                   String sortOrder = request.getParameter("sortOrder");
                    BooksDAO dao3 = new BooksDAO();
                    List<Book> books3;
                    if (sortOrder != null && (sortOrder.equals("ASC") || sortOrder.equals("DESC"))) {
                        books3 = dao3.getAllOldBookSortedByPrice(sortOrder);
                    } else {
                        books3 = dao3.getAllOldBook();
                    }
                    for (Book b : books3) {
                %>
                <div class="col-md-3 p-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="<%=b.getPhotoName()%>" 
                                 style="width:150px;height: 200px" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row mg">
                                <a href="viewbook?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                                   }
                %>
            </div>


        </div>
    </body>
</html>