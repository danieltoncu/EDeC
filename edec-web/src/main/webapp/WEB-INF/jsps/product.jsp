<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                <div class="col-md-4">
				    <div class="single-sidebar">
				      <h3>Stores</h3>
                        <c:set var="amazon" value="http://www.amazon.com/s?field-keywords=${product.name}"/>
                        <c:set var="amazonURL" value="${fn:replace(amazon,' ','%20')}"/>
  					  <h4 class="list-group-item-heading"><a href="<c:url value="${amazonURL}" />"><b>Amazon</b></a></h4>
				    </div>
                    <div class="single-sidebar">
                          <h3>About Product</h3>
                          <div class="list-group">
                             <a class="list-group-item list-group-item-warning">
                               <h1 class="list-group-item-heading">Description</h1>
                             </a>
                             <a class="list-group-item">
                                 <p style="font-size: 1.25em;">${product.description}</p>
                             </a>
                          </div>
                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="product-content-right"> 
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="product-images">
                                    <div class="product-main-img" >
                                            <img STYLE="max-width:100%; max-height:100%;object-fit:contain;" class="img-responsive" id="lala" src="${product.pictureURL}" alt="">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name">${product.name}</h2>
                                    <div class="product-wid-rating">
										<p><b>${product.overallScore}</b></p>
									</div> 
                                    <div role="tabpanel">
                                        <ul class="product-tab" role="tablist">
										    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
                                            <li role="presentation" ><a href="#hom" aria-controls="hom" role="tab" data-toggle="tab">Behind the Ratings</a></li>
                                            
                                        </ul>
                                        <div class="tab-content">
											<div id="home" class="tab-pane fade in active">
                                                <%--<p style="font-size: 1.25em;">${product.description}</p>--%>
                                                <br/><br/>
											   <h3 style="color:#ffb366">Characteristics</h3>
                                                    <c:forEach items="${characteristics}" var="characteristic" varStatus="i">
                                                        <li>
                                                        <b>${characteristic.name}</b>
                                                            <sec:authorize access="hasRole('ROLE_USER')">
                                                                <c:set var="queryParameters" value="name=${characteristic.name}&product=${product.name}"/>
                                                                <c:set var="queryParam" value="${fn:replace(queryParameters,' ','%20')}"/>
                                                                <c:url value="/like?${queryParam}" var="likeChar" />
                                                                <c:url value="/dislike?${queryParam}" var="dislikeChar" />

                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="userLike" items="${userLikes}">
                                                                    <c:if test="${userLike.name eq characteristic.name}">
                                                                        <c:set var="contains" value="true" />
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains eq true}">
                                                                        <a href="#"><button type="button" class="btn btn-info btn-xs active">Like</button></a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a href="${likeChar}"><button type="button" class="btn btn-info btn-xs">Like</button></a>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="userDislike" items="${userDislikes}">
                                                                    <c:if test="${userDislike.name eq characteristic.name}">
                                                                        <c:set var="contains" value="true" />
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains eq true}">
                                                                        <a href="#"><button type="button" class="btn btn-info btn-xs active">Dislike</button></a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a href="${dislikeChar}"><button type="button" class="btn btn-info btn-xs">Dislike</button></a>
                                                                    </c:otherwise>
                                                                </c:choose>


                                                            </sec:authorize>
                                                        </li>
                                                        <br/>
                                                    </c:forEach>
												</ul>
											</div>
											<div id="hom" class="tab-pane fade">
											 <h2 style="color:#ffb366"><i class="fa fa-heartbeat"></i>Health<span class="badge">${product.healthScore}</span></h2>
											 <p>
                                                 <c:choose>
                                                     <c:when test="${product.healthScore > 9}">
                                                         This product has a high nutrition score.
                                                     </c:when>
                                                     <c:when test="${product.healthScore > 8}">
                                                         This product has a high nutrition score.
                                                     </c:when>
                                                     <c:when test="${product.healthScore > 7}">
                                                         This product has a high nutrition score.
                                                     </c:when>
                                                     <c:when test="${product.healthScore > 6}">
                                                         This product has a high nutrition score.
                                                     </c:when>
                                                     <c:when test="${product.healthScore > 5}">
                                                         This product has a high nutrition score.
                                                     </c:when>
                                                     <c:otherwise>
                                                         This product has a high nutrition score.
                                                     </c:otherwise>
                                                 </c:choose>
                                             </p>
											 <h2 style="color:#ffb366"><i class="fa fa-leaf"></i>Environment<span class="badge">${product.environmentScore}</span></h2>
											 <p>
                                                 <c:choose>
                                                     <c:when test="${product.environmentScore > 9}">
                                                         This company's environmental policies, practices and performance place it among the best 22% of companies rated by EDeC.
                                                     </c:when>
                                                     <c:when test="${product.environmentScore > 8}">
                                                         This company's environmental policies, practices and performance place it among the best 36% of companies rated by EDeC.
                                                     </c:when>
                                                     <c:when test="${product.environmentScore > 7}">
                                                         This company's environmental policies, practices and performance place it among the best 45% of companies rated by EDeC.
                                                     </c:when>
                                                     <c:when test="${product.environmentScore > 6}">
                                                         This company's environmental policies, practices and performance place it among the best 50% of companies rated by EDeC.
                                                     </c:when>
                                                     <c:when test="${product.environmentScore > 5}">
                                                         This company's environmental policies, practices and performance place it among the best 67% of companies rated by EDeC.
                                                     </c:when>
                                                     <c:otherwise>
                                                         This company's environmental policies, practices and performance place it among the best 90% of companies rated by EDeC.
                                                     </c:otherwise>
                                                 </c:choose>
                                             </p>
											<h2 style="color:#ffb366"><i class="fa fa-child"></i>Society<span class="badge">${product.societyScore}</span></h2>
											<p> <c:choose>
                                                <c:when test="${product.societyScore > 9}">
                                                    This company's social policies, practices and performance place it among the best 5% of companies rated by EDeC.
                                                </c:when>
                                                <c:when test="${product.societyScore > 8}">
                                                    This company's social policies, practices and performance place it among the best 7% of companies rated by EDeC.
                                                </c:when>
                                                <c:when test="${product.societyScore > 7}">
                                                    This company's social policies, practices and performance place it among the best 25% of companies rated by EDeC.
                                                </c:when>
                                                <c:when test="${product.societyScore > 6}">
                                                    This company's social policies, practices and performance place it among the best 36% of companies rated by EDeC.
                                                </c:when>
                                                <c:when test="${product.societyScore > 5}">
                                                    This company's social policies, practices and performance place it among the best 55% of companies rated by EDeC.
                                                </c:when>
                                                <c:otherwise>
                                                    This company's social policies, practices and performance place it among the best 80% of companies rated by EDeC.
                                                </c:otherwise>
                                            </c:choose></p>
											</div>
											</div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="related-products-wrapper">
                            <h2 class="related-products-title">Related Products</h2>
                            <div class="related-products-carousel">

                                <c:forEach items="${relatedProducts}" var="relatedProduct" varStatus="i">
                                    <c:set var="related" value="/products/${relatedProduct.name}"/>
                                    <c:set var="relatedURL" value="${fn:replace(related,' ','%20')}"/>
                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img STYLE="max-width:100%; max-height:100%;object-fit:contain;" src="${relatedProduct.pictureURL}" alt="">
                                        <div class="product-hover">
                                            <a href="<c:url value="${relatedURL}"/>" class="view-details-link"><i class="fa fa-link"></i>See details</a>
                                        </div>
                                    </div>

                                    <h2><a href="<c:url value="${relatedURL}"/>">${relatedProduct.name}</a></h2>
									<div class="product-wid-rating">
                                        <p><b>${relatedProduct.overallScore}</b></p>
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
	
	<!-- Button -->
	<script>
      $(document).ready(function(){
      $(".btn-info").click(function(){
      $(this).button('toggle');
      });   
    });
    </script>

  </body>
</html>