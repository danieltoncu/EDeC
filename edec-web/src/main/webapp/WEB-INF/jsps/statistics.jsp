<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
                        <h2><i class="fa fa-bar-chart"></i>Statistics</h2>
                        <div class="centerr">
						 <br> 
                          <ul class="nav nav-tabs">
                             <li class="active"><a data-toggle="tab" href="#home">Top 10 Ingredients</a></li>
                             <li><a data-toggle="tab" href="#menu1">Users with the most restrictions</a></li>
                             <li><a data-toggle="tab" href="#menu2">Users with the less restrictions</a></li>
                          </ul>

                        <div class="tab-content">
                            <div id="home" class="tab-pane fade in active" style="padding-top: 25px;">
							    <div class="col-md-1"></div>
                                    <div class="col-md-5">
											   <h3 style="color:#ffb366">Top 10 Desirable Ingredients</h3>
											    <ul>
													<c:forEach items="${topLikedCharacteristics}" var="characteristic" varStatus="i">
														<li>${characteristic.name} has ${characteristic.nrLikes} likes</li>
														<br/>
													</c:forEach>
												</ul>
									</div>
									<div class="col-md-5">
											   <h3 style="color:#ffb366">Top 10 Indesirable Ingredients</h3>
											   <ul>
												   <c:forEach items="${topDislikedCharacteristics}" var="characteristic" varStatus="i">
													   <li>${characteristic.name} has ${characteristic.nrDislikes} dislikes</li>
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
											<ul class="[ nav nav-justified ]" id="nav-tabs1" role="tablist">
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
												<li role="presentation" class="">
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
												<c:forEach items="${topRestrictiveUsers}" var="userPreferenceCount" varStatus="i">
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
															<p class="lead">${userPreferenceCount.user.username} dislikes ${userPreferenceCount.countDislikes} characteristics and likes only  ${userPreferenceCount.countLikes} characteristics.</p>
															<hr>
															<p><strong class="text-uppercase">${userPreferenceCount.user.username}</strong></p>
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
							<div class="[ container text-center]">
								<div class="[ row ]">
									<div style="align:center">
										<div class="[ col-xs-1 col-sm-12 ]">
											<!-- Nav tabs -->
											<ul class="[ nav nav-justified ]" id="nav-tabs2" role="tablist">
												<li role="presentation" class="active">
													<a href="#user6" aria-controls="dustin" role="tab" data-toggle="tab">
														<img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
													</a>
												</li>
												<li role="presentation" class="">
													<a href="#user7" aria-controls="daksh" role="tab" data-toggle="tab">
														<img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
													</a>
												</li>
												<li role="presentation" class="">
													<a href="#user8" aria-controls="anna" role="tab" data-toggle="tab">
														<img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
													</a>
												</li>
												<li role="presentation" class="">
													<a href="#user9" aria-controls="wafer" role="tab" data-toggle="tab">
														<img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
													</a>
												</li>
												<li role="presentation" class="">
													<a href="#user10" aria-controls="wafer" role="tab" data-toggle="tab">
														<img class="img-circle" src="<c:url value="/resources/img/user.png" />" alt="" />
													</a>
												</li>
											</ul>
										</div>
										<div class="[ col-xs-1 col-sm-12 ]">
											<!-- Tab panes -->
											<div class="tab-content" id="tabs-collapse">

												<c:set var="count" value="5"/>
												<c:forEach items="${topPermissiveUsers}" var="userPreferenceCount" varStatus="i">
													<c:set var="count" value="${count + 1}"/>

												<c:choose>
												<c:when test="${count eq 6}">
												<div role="tabpanel" class="tab-pane fade in active" id="user${count}">
													</c:when>
													<c:otherwise>
													<div role="tabpanel" class="tab-pane fade" id="user${count}">
														</c:otherwise>
														</c:choose>
														<div class="tab-inner">
															<p class="lead">${userPreferenceCount.user.username} likes ${userPreferenceCount.countLikes} characteristics and dislikes only  ${userPreferenceCount.countDislikes} characteristics.</p>
															<hr>
															<p><strong class="text-uppercase">${userPreferenceCount.user.username}</strong></p>
														</div>
													</div>

												</c:forEach>
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
	<script src="<c:url value="/resources/js/main.js" />"></script>

	<script src="<c:url value="/resources/js/empty-check.js" />"></script>
	<%--<script src="<c:url value="/resources/js/live-search.js" />"></script>--%>

  </body>
</html>