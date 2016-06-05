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
                                            <a href="#dustin" aria-controls="dustin" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li role="presentation" class="">
                                            <a href="#daksh" aria-controls="daksh" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li role="presentation" class="">
                                            <a href="#anna" aria-controls="anna" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li role="presentation" class="">
                                            <a href="#wafer" aria-controls="wafer" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                        <li role="presentation" class="">
                                            <a href="#wafer" aria-controls="wafer" role="tab" data-toggle="tab">
                                                <img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="[ col-xs-1 col-sm-12 ]">
                                    <!-- Tab panes -->
                                    <div class="tab-content" id="tabs-collapse">
                                        <div role="tabpanel" class="tab-pane fade in active" id="dustin">
                                            <div class="tab-inner">
                                                <p class="lead">Etiam tincidunt enim et pretium efficitur. Donec auctor leo sollicitudin eros iaculis sollicitudin.</p>
                                                <hr>
                                                <p><strong class="text-uppercase">Dustin Lamont</strong></p>
                                            </div>
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="daksh">
                                            <div class="tab-inner">
                                                <p class="lead">Suspendisse dictum gravida est, nec consequat tortor venenatis a. Suspendisse vitae venenatis sapien.</p>
                                                <hr>
                                                <p><strong class="text-uppercase">Daksh Bhagya</strong></p>
                                            </div>
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="anna">
                                            <div class="tab-inner">
                                                <p class="lead">Nullam suscipit ante ac arcu placerat, nec sagittis quam volutpat. Vestibulum aliquam facilisis velit ut ultrices.</p>
                                                <hr>
                                                <p><strong class="text-uppercase">Anna Pickard</strong></p>
                                            </div>
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="wafer">
                                            <div class="tab-inner">
                                                <p class="lead"> Fusce erat libero, fermentum quis sollicitudin id, venenatis nec felis. Morbi sollicitudin gravida finibus.</p>
                                                <hr>
                                                <p><strong class="text-uppercase">Wafer Baby</strong></p>
                                            </div>
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="wafer">
                                            <div class="tab-inner">
                                                <p class="lead"> Fusce erat libero, fermentum quis sollicitudin id, venenatis nec felis. Morbi sollicitudin gravida finibus.</p>
                                                <hr>
                                                <p><strong class="text-uppercase">Wafer Baby</strong></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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