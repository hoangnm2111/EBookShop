<%-- 
    Document   : index
    Created on : Sep 26, 2024, 10:14:31 PM
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
        <link rel="icon" href="images/iconBook.png" type="img/x-icon">

        <title>Ebook</title>
        <%@include file="allCss.jsp" %>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Barlow Semi Condensed', sans-serif;
            }

            .body {
                display: grid;
                place-content: center;
                min-height: 50vh;
                background: url('https://images.squarespace-cdn.com/content/v1/568ab82d9cadb68804b3c971/1540064574013-IMRIS7WA5IQ909SXWJG2/blur-1868068_1280.jpg');
                background-size: cover;
            }

            .wrapper {
                position: relative;
                display: flex;
                flex-direction: column;
                gap: 3em;
            }

            .a {
                font-size: 5em;
                text-decoration: none;
                text-align: center;
                text-transform: uppercase;
                line-height: 1;
                color: transparent;
                -webkit-text-stroke: 1.5px #17a2b8;
                text-shadow: 0 0 0 #fff;
                transition: all 250ms;
            }

            .a:hover {
                text-shadow: 4px 4px 0 #fff;
                transform: translate(-2px, -2px)
            }

            .crd-ho:hover{
                background-color: #fcf7f7;
            }
            .mg{
                display: flex;
                justify-content: center;
            }
           
        </style>
    </head>
    <body style="background-color: #f7f7f7;">

        <%@include file="navbar.jsp" %>
        <div class="wrapper body">
            <a class="a">EBook Shop</a>
        </div>

        <!--Start Book-->

        <div class="container-fluid">
            <h3 class="text-center mt-3">Recent Book</h3>
            <div class="row">
                <%
                    BooksDAO dao2 = new BooksDAO();
                    List<Book> books2 = dao2.getRecentBook();
                    for(Book b : books2){
                %>
                <div class="col-md-3 ">
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
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getFormattedPrice()%></a>
                            </div>
                            <%
                                }else{
                            %>
                            Categories: <%=b.getBookCategory()%></p>
                            <div class="row mg">
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=${acc.id}" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <a href="viewbook?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i><%=b.getFormattedPrice()%></a>

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

            <div class="text-center">
                <a href="all_recent_book.jsp" class="btn btn-success btn-sm mt-3 " >View All</a>

            </div>            
        </div>
        <!--End Recent Book-->
        <hr>
        <!--Start New Book-->

        <div class="container-fluid">
            <h3 class="text-center">New Book</h3>
            <div class="row">

                <%
                    BooksDAO dao = new BooksDAO();
                    List<Book> books = dao.getNewBook();
                    for(Book b : books){
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="<%=b.getPhotoName()%>" 
                                 style="width:150px;height: 200px" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row mg">
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=${acc.id}" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <a href="viewbook?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getFormattedPrice()%></a>

                            </div>
                        </div>
                    </div>
                </div>
                <%
                                    }
                %>
            </div>

            <div class="text-center">
                <a href="all_new_book.jsp" class="btn btn-success btn-sm mt-3" >View All</a>

            </div>            
        </div>
        <!--End New Book-->

        <hr>

        <!--Start Old Book-->

        <div class="container-fluid">
            <h3 class="text-center">Old Book</h3>
            <div class="row">
                <%
                    BooksDAO dao3 = new BooksDAO();
                    List<Book> books3 = dao3.getOldBook();
                    for(Book b : books3){
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="<%=b.getPhotoName()%>" 
                                 style="width:150px;height: 200px" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row mg">
                                <a href="viewbook?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-info btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getFormattedPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                                   }
                %>
            </div>

            <div class="text-center">
                <a href="all_old_book.jsp" class="btn btn-success btn-sm mt-3" >View All</a>

            </div>            
        </div>
        <!--End Old Book-->

        <!--Start Footer-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--End Footer-->


    </body>
</html>
