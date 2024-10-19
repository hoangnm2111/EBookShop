<%-- 
    Document   : all_recent_book
    Created on : Oct 12, 2024, 1:41:38 AM
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
        <title>All Recent Book</title>
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
            <div class="row">
                <%
                    String ch = request.getParameter("ch");
                    BooksDAO dao = new BooksDAO();
                    List<Book> list = dao.getBookBySearch(ch);
                    for(Book b : list){
                %>
                <div class="col-md-3 p-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="<%= b.getPhotoName()%>" 
                                 style="width:150px;height: 200px" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>
                                <%
                                if(b.getBookCategory().equals("Old")){
                                %>
                                Categories: <%=b.getBookCategory()%></p>
                            <div class="row mg">
                                <a href="viewbook?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1 ">View Details</a>
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                            </div>
                            <%
                                }else{
                            %>
                            Categories: <%=b.getBookCategory()%></p>
                            <div class="row mg">
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=${acc.id}" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <a href="viewbook?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
                            </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
    </body>
</html>
