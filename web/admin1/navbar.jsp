<%-- 
    Document   : navbar
    Created on : Sep 26, 2024, 10:37:19 PM
    Author     : HIEU
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid" style="height:10px;background-color: #17a2b8">

</div>

<div class="container-fluid p-4 bg-light">
    <div class="row">
        <div class="col-md-9">
            <h3><i style="color: #38c5b1; font-size: 50px; font-style: normal;" > <img src="../images/iconBook.png" style="width: 60px" />Ebooks</i></h3>
        </div>

        <div class="col-md-3 mt-4">
            <c:if test="${not empty userobj}">
                <a href="#" class="btn btn-success"><i class="fas fa-user"></i> ${userobj.name}</a>
                <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-info">
                    <i class="fas fa-sign-in-alt"></i> Logout</a>
                </c:if>
                <c:if test="${empty userobj}">
                <a href="../login.jsp" class="btn btn-success"><i class="fa-solid fa-user-plus"></i> Login</a>
                <a href="../register.jsp" class="btn btn-info">
                    <i class="fa-solid fa-right-to-bracket"></i> Register</a>
                </c:if>

        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Do you want to logout?</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>






<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <a class="navbar-brand" href="./home.jsp"><i class="fa-solid fa-house"></i> </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="./home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="./book_statistics.jsp" class="btn btn-light my-2 my-sm-0 " type="submit"><i class="fa-solid fa-chart-simple"></i> Book Statistics</a>
            <a href="./orders_statistics.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-chart-simple"></i> Order Statistics</a>
        </form>
    </div>
</nav>