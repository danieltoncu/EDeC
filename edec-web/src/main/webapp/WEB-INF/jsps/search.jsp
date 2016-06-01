<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EDeC </title>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


	  <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.css" />">
	  <link rel="stylesheet" href="<c:url value="/resources/style.css" />">
	  <link rel="stylesheet" href="<c:url value="/resources/css/responsive.css" />">

    
  </head>
  <body>
   
   
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><b><a href="#"><i class="fa fa-spinner"></i><span>EDeC</span></a></b></h1>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->

	<%@ include file="menu.jsp" %>

    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>"Aici sa avem un citat sau ceva in genul asta"</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <div class="row">
	    <div class="col-md-1"></div>
        <div class="col-md-10">
		    <div class="container">			
				  <table class="table table-striped">
					<thead class="tables">
					  <tr>
						<th>Products</th>
						<th>Overall Score</th>
						<th>Description</th>
						<th>Buy</th>
					  </tr>
					</thead>
					<tbody>
					  <c:forEach items="${products}" var="product" varStatus="i">
					  <tr>
						  <td><a href="<c:url value="/products/${product.name}"/>"><img src="${product.pictureURL}" alt="" class="product-thumb"><h4><b>${product.name}</b></h4></a></td>
						  <td><div class="product-wid-rating">
							  <p><b>${product.overallScore}</b></p>
						  </div>
						  </td>
						  <td class="point">
							  ${product.description}
						  </td>
						  <td><a href="#">Buy this product from Amazon</a></td>
					  </tr>
					  </c:forEach>
					</tbody>
				  </table>
			</div>
		</div>
        
        <div class="col-md-1"></div>
    </div>
    <div class="container">
	  <div class="col-md-1"></div>
        <ul class="pagination">
            <c:choose>
            <c:when test="${nrPagina<2}">
                <li class="disabled"><a href="#">«</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="<c:url value="/search?pag=${nrPagina-1}&name=${name}"/>">«</a></li>
            </c:otherwise>
            </c:choose>
                <li class="active"><a href="#">${nrPagina} <span class="sr-only">(current)</span></a></li>
            <c:choose>
            <c:when test="${not empty products}">
			    <li><a href="<c:url value="/search?pag=${nrPagina+1}&name=${name}"/>">»</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a href="#">»</a></li>
            </c:otherwise>
            </c:choose>
            </ul>
	  <div class="col-md-3"></div>
    </div>

	<%@ include file="footer.jsp" %>
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.sticky.js" />"></script>

	<!-- jQuery easing -->
	<script src="<c:url value="/resources/js/jquery.easing.1.3.min.js" />"></script>

	<!-- Main Script -->
	<script src="<c:url value="/resources/js/main.js" />"></script>
	<script src="<c:url value="/resources/js/menu.js" />"></script>
  </body>
</html>