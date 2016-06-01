
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EDeC</title>

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
</div>


<%@ include file="menu.jsp" %>

<div class="slider-area">
    <div class="zigzag-bottom"></div>
    <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">

        <div class="slide-bulletz">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ol class="carousel-indicators slide-indicators">
                            <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                            <li data-target="#slide-list" data-slide-to="1"></li>
                            <li data-target="#slide-list" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="single-slide">
                    <div class="slide-bg slide-one"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are awesome</h2>
                                            <p>Find safe, healthy, green, & ethical product reviews based on scientific ratings.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-two"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are great</h2>
                                            <p>With over 250,000 products on our site, we can help you find what you're looking for.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-three"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are superb</h2>
                                            <p>EDeC scientists rate products on a 0 to 10 scale for their health, environment, and social impact.</p>
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

<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4">
                <div class="single-promo">
                    <i class="fa fa-heartbeat"></i>
                    <p><b>Health</b></p>
                    <p>Ingredients</p>
                    <p>Impacts</p>
                    <p>Certifications</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-4">
                <div class="single-promo">
                    <i class="fa fa-leaf"></i>
                    <p><b>Environment</b></p>
                    <p>Resource Use</p>
                    <p>Environmental</p>
                    <p>Trasparency</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-4">
                <div class="single-promo">
                    <i class="fa fa-child"></i>
                    <p><b>Society</b></p>
                    <p>Consumers</p>
                    <p>Safety</p>
                    <p>Community</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="maincontent-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="latest-product">
                    <h2 class="section-title">Latest Products</h2>
                    <div class="related-products-carousel">

                        <c:forEach items="${latestProducts}" var="latestProduct" varStatus="i">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="${latestProduct.pictureURL}" alt="">
                                    <div class="product-hover">
                                        <a href="<c:url value="/products/${latestProduct.name}"/>" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="<c:url value="/products/${latestProduct.name}"/>">${latestProduct.name}</a></h2>
                                <div class="product-wid-rating">
                                    <p><b>${latestProduct.overallScore}</b></p>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="brands-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="brand-wrapper">
                    <h2 class="section-title">Brands</h2>
                    <div class="brand-list">
                        <img src="<c:url value="/resources/img/services_logo__1.jpg" />" alt="">
                        <img src="<c:url value="/resources/img/services_logo__2.jpg" />" alt="">
                        <img src="<c:url value="/resources/img/services_logo__3.jpg" />" alt="">
                        <img src="<c:url value="/resources/img/services_logo__4.jpg" />" alt="">
                        <img src="<c:url value="/resources/img/services_logo__1.jpg" />" alt="">
                        <img src="<c:url value="/resources/img/services_logo__2.jpg" />" alt="">
                        <img src="<c:url value="/resources/img/services_logo__3.jpg" />" alt="">
                        <img src="<c:url value="/resources/img/services_logo__4.jpg" />" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End brands area -->

<div class="product-widget-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">Top Health</h2>

                    <c:forEach items="${topHealthProducts}" var="topHealthProduct" varStatus="i">
                        <div class="single-wid-product">
                            <a href="<c:url value="/products/${topHealthProduct.name}"/>"><img src="${topHealthProduct.pictureURL}" alt="" class="product-thumb"></a>
                            <h2><a href="<c:url value="/products/${topHealthProduct.name}"/>">${topHealthProduct.name}</a></h2>
                            <div class="product-wid-rating">
                                <p><b>H:${topHealthProduct.healthScore}</b></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget" data-url="<c:url value="/products/"/>" id="society-append">
                    <h2 class="product-wid-title">Top Society</h2>
                    <%--Aici ar trebui ca prin Ajax sa appendez la div#society-append cele 5 produse cu scorul cel mai mare la societyScore
                    Primesc eroarea asta:
                    XMLHttpRequest cannot load http://localhost:8181/edec/top5society.
                    No 'Access-Control-Allow-Origin' header is present on the requested resource.
                    Origin 'http://localhost:8282' is therefore not allowed access.--%>

                    <%--<c:forEach items="${topSocietyProducts}" var="topSocietyProduct" varStatus="i">
                        <div class="single-wid-product">
                            <a href="<c:url value="/products/${topSocietyProduct.name}"/>"><img src="${topSocietyProduct.pictureURL}" alt="" class="product-thumb"></a>
                            <h2><a href="<c:url value="/products/${topSocietyProduct.name}"/>">${topSocietyProduct.name}</a></h2>
                            <div class="product-wid-rating">
                                <p><b>S:${topSocietyProduct.societyScore}</b></p>
                            </div>
                        </div>
                    </c:forEach>--%>

                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">Top Environment</h2>

                    <c:forEach items="${topEnvironmentProducts}" var="topEnvironmentProduct" varStatus="i">
                        <div class="single-wid-product">
                            <a href="<c:url value="/products/${topEnvironmentProduct.name}"/>"><img src="${topEnvironmentProduct.pictureURL}" alt="" class="product-thumb"></a>
                            <h2><a href="<c:url value="/products/${topEnvironmentProduct.name}"/>">${topEnvironmentProduct.name}</a></h2>
                            <div class="product-wid-rating">
                                <p><b>E:${topEnvironmentProduct.environmentScore}</b></p>
                            </div>
                        </div>
                    </c:forEach>
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
<%--Asta e scriptul care contine AJAX-ul--%>
<script src="<c:url value="/resources/js/MONIRY.js" />"></script>
<script src="<c:url value="/resources/js/menu.js" />"></script>
</body>
</html>