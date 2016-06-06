<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<%@ include file="citat.jsp" %>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">

            <div class="info-tile-header" >
                <h2><i class="fa fa-user"></i>${username}</h2>
                <div class="centerr">
                    <br>
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">My list</a></li>
                        <li><a data-toggle="tab" href="#menu1">Users with Similar Preferences</a></li>
                        <li><a data-toggle="tab" href="#menu2">Suggestions</a></li>
                        <li><a data-toggle="tab" href="#menu3">To avoid</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <div class="col-md-1"></div>
                            <div class="col-md-5">
                                <h3 style="color:#ffb366">Ingredients Likes</h3>
                                <ul>
                                <c:forEach items="${userLikes}" var="userLike" varStatus="i">
                                    <c:set var="queryParameters" value="name=${userLike.name}"/>
                                    <c:set var="queryParam" value="${fn:replace(queryParameters,' ','%20')}"/>
                                    <c:url value="/dislike?${queryParam}" var="dislikeChar" />
                                    <c:url value="/removeLike?${queryParam}" var="removeLike"/>
                                    <li>
                                        <b>${userLike.name}</b>
                                        <a href="${removeLike}"><button type="button" class="btn btn-info btn-xs ">Remove Like</button></a>
                                        <a href="${dislikeChar}"><button type="button" class="btn btn-info btn-xs">Dislike</button></a>
                                    </li>
                                    <br/>
                                </c:forEach>
                                </ul>

                            </div>
                            <div class="col-md-5">
                                <h3 style="color:#ffb366">Ingredients Dislikes</h3>
                                <ul>
                                    <c:forEach items="${userDislikes}" var="userDislike" varStatus="i">
                                        <c:set var="queryParameters" value="name=${userDislike.name}"/>
                                        <c:set var="queryParam" value="${fn:replace(queryParameters,' ','%20')}"/>
                                        <c:url value="/like?${queryParam}" var="likeChar" />
                                        <c:url value="/removeDislike?${queryParam}" var="removeDislike"/>
                                        <li>
                                            <b>${userDislike.name}</b>
                                            <a href="${likeChar}"><button type="button" class="btn btn-info btn-xs ">Like</button></a>
                                            <a href="${removeDislike}"><button type="button" class="btn btn-info btn-xs">Remove Dislike</button></a>
                                        </li>
                                        <br/>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <div class="[ container text-center]">
                                <div class="[ row ]">
                                    <div style="align:center" >
										<div class="[ col-xs-1 col-sm-12 ]">
                                    <!-- Nav tabs -->
                                    <ul class="[ nav nav-justified ]" id="nav-tabs" role="tablist">
                                        <li role="presentation" class="active">
                                            <a href="#user1" aria-controls="dustin" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li role="presentation" class="">
                                            <a href="#user2" aria-controls="daksh" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li role="presentation" class="">
                                            <a href="#user3" aria-controls="anna" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li role="presentation" class="">
                                            <a href="#user4" aria-controls="wafer" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li style="visibility: hidden" role="presentation" class="">
                                            <a href="#user5" aria-controls="wafer" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="[ col-xs-1 col-sm-12 ]">
                                    <!-- Tab panes -->
                                    <div class="tab-content" id="tabs-collapse">

                                        <c:set var="count" value="0"/>
                                        <c:forEach items="${similarUsers}" var="similarUser" varStatus="i">
                                        <c:set var="count" value="${count + 1}"/>

                                        <c:choose>
                                        <c:when test="${count eq 1}">
                                            <div role="tabpanel" class="tab-pane fade in active" id="user${count}">
                                        </c:when>
                                        <c:otherwise>
                                            <div role="tabpanel" class="tab-pane fade" id="user${count}">
                                        </c:otherwise>
                                        </c:choose>
                                                <div class="tab-inner">
                                                    <p class="lead">${similarUser.username} has similar tastes.</p>
                                                    <hr>
                                                    <p><strong class="text-uppercase">${similarUser.username}</strong></p>
                                                </div>
                                            </div>

                                        </c:forEach>




                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                        <div id="menu2" class="tab-pane fade">
                            <div class="single-sidebar">
                                <h2 class="sidebar-title">Suggestions:</h2>
                                <%--<c:forEach items="${suggestions}" var="product" varStatus="i">
                                    <div class="thubmnail-recent">
                                        <img src="img/druide.jpe" class="recent-thumb" alt="">
                                        <h2><a href="">Druide Refreshing Shower Gel</a></h2>
                                        <div class="product-wid-rating">
                                            <p><b>8.9</b></p>
                                        </div>
                                    </div>
                                </c:forEach>--%>
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
                                    <c:forEach items="${suggestions}" var="product" varStatus="i">
                                        <c:set var="url" value="/products/${product.name}"/>
                                        <c:set var="productURL" value="${fn:replace(url,' ','%20')}"/>

                                        <tr>
                                            <td><a href="<c:url value="${productURL}"/>"><img STYLE="max-width:100%; max-height:100%;object-fit:contain;" src="${product.pictureURL}" alt="" class="product-thumb"><h4><b>${product.name}</b></h4></a></td>
                                            <td><div class="product-wid-rating">
                                                <p><b>${product.overallScore}</b></p>
                                            </div>
                                            </td>
                                            <td class="point">
                                                    ${product.description}
                                            </td>
                                            <c:set var="amazon" value="http://www.amazon.com/s?field-keywords=${product.name}"/>
                                            <c:set var="amazonURL" value="${fn:replace(amazon,' ','%20')}"/>
                                            <td><a href="${amazonURL}">Buy this product from Amazon</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <ul class="pagination">
                                    <c:choose>
                                        <c:when test="${nrPaginaS<2}">
                                            <li class="disabled"><a href="#">«</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${not empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaS-1}&category=${category}"/>">«</a></li>
                                            </c:if>

                                            <c:if test="${empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaS-1}&name=${name}"/>">«</a></li>
                                            </c:if>

                                        </c:otherwise>
                                    </c:choose>

                                    <li class="active"><a href="#">${nrPaginaS} <span class="sr-only">(current)</span></a></li>

                                    <c:choose>
                                        <c:when test="${fn:length(products) eq 5}">
                                            <c:if test="${not empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaS+1}&category=${category}"/>">»</a></li>
                                            </c:if>
                                            <c:if test="${empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaS+1}&name=${name}"/>">»</a></li>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="disabled"><a href="#">»</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                        <div id="menu3" class="tab-pane fade">
                            <div class="single-sidebar">
                                <h2 class="sidebar-title">Products to Avoid</h2>
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
                                    <c:forEach items="${toAvoid}" var="product" varStatus="i">
                                        <c:set var="url" value="/products/${product.name}"/>
                                        <c:set var="productURL" value="${fn:replace(url,' ','%20')}"/>

                                        <tr>
                                            <td><a href="<c:url value="${productURL}"/>"><img STYLE="max-width:100%; max-height:100%;object-fit:contain;" src="${product.pictureURL}" alt="" class="product-thumb"><h4><b>${product.name}</b></h4></a></td>
                                            <td><div class="product-wid-rating">
                                                <p><b>${product.overallScore}</b></p>
                                            </div>
                                            </td>
                                            <td class="point">
                                                    ${product.description}
                                            </td>
                                            <c:set var="amazon" value="http://www.amazon.com/s?field-keywords=${product.name}"/>
                                            <c:set var="amazonURL" value="${fn:replace(amazon,' ','%20')}"/>
                                            <td><a href="${amazonURL}">Buy this product from Amazon</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <ul class="pagination">
                                    <c:choose>
                                        <c:when test="${nrPaginaA<2}">
                                            <li class="disabled"><a href="#">«</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${not empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaA-1}&category=${category}"/>">«</a></li>
                                            </c:if>

                                            <c:if test="${empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaA-1}&name=${name}"/>">«</a></li>
                                            </c:if>

                                        </c:otherwise>
                                    </c:choose>

                                    <li class="active"><a href="#">${nrPaginaA} <span class="sr-only">(current)</span></a></li>

                                    <c:choose>
                                        <c:when test="${fn:length(products) eq 5}">
                                            <c:if test="${not empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaA+1}&category=${category}"/>">»</a></li>
                                            </c:if>
                                            <c:if test="${empty category}">
                                                <li><a href="<c:url value="/search?pag=${nrPaginaA+1}&name=${name}"/>">»</a></li>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="disabled"><a href="#">»</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
            </div>
        </div>
    </div>
</div>
</div>
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