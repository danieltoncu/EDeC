<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                <div class="col-md-4">
				    <div class="single-sidebar">
				      <h3>Stores</h3>
  					  <h4 class="list-group-item-heading"><a href="http://www.amazon.com/Apple-iPhone-16GB-Space-Gray/dp/B00YD5400Y/ref=sr_1_1?s=wireless&ie=UTF8&qid=1463524014&sr=1-1&refinements=p_n_feature_keywords_four_browse-bin%3A6787348011%2Cp_36%3A2491159011"><b>Amazon</b>:$10.10</a></h4>         
				    </div>
                    <div class="single-sidebar">
                          <h3>About Brand</h3>
                          <div class="list-group">
                             <a class="list-group-item list-group-item-warning">
                               <h1 class="list-group-item-heading">Aveeno.</h1>
                             </a>
                             <a class="list-group-item">
                               <h4 class="list-group-item-heading"><b>Company Score</b></h4>
                               <p class="list-group-item-text"><b>Overall Company Score</b>: 5,8</p>
							   <p class="list-group-item-text"><b>Environment</b>: 6,6</p>
							   <p class="list-group-item-text"><b>Society</b>: 6,2</p>
                             </a>
                             <a class="list-group-item">
                                <h4 class="list-group-item-heading"><b>More Info</b></h4>
                                <p class="list-group-item-text"><b>Brand: </b>Aveeno</p>
								<p class="list-group-item-text"><b>Parent: </b>Johnson Consumer</p>
								<p class="list-group-item-text"><b>Company: </b>Products Company</p>
								<p class="list-group-item-text"><b>Parent Company: </b>Medicine Cabinet</p>
                             </a>
                          </div>
                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="product-content-right"> 
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="product-images">
                                    <div class="product-main-img" <%--style="display:inline-block; height:159px; overflow:hidden; width:153px;"--%>>
                                            <img id="lala" <%--style="height:159px; border:10px darkviolet"--%> src="${product.pictureURL}" alt="">
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
											   <h3 style="color:#ffb366">Characteristics</h3>
											    <ul>
                                                    <c:forEach items="${characteristics}" var="characteristic" varStatus="i">
                                                        <li>
                                                        <b>${characteristic.name}</b>
                                                            <sec:authorize access="hasRole('ROLE_USER')">
                                                                <button type="button" class="btn btn-info btn-xs ">Like</button>
                                                                <button type="button" class="btn btn-info btn-xs">Dislike</button>
                                                            </sec:authorize>
                                                        </li>

                                                    </c:forEach>
												</ul>
											</div>
											<div id="hom" class="tab-pane fade">
											 <h2 style="color:#ffb366"><i class="fa fa-heartbeat"></i>Health<span class="badge">${product.healthScore}</span></h2>
											 <p>This product has a high nutrition score.</p>
											 <h2 style="color:#ffb366"><i class="fa fa-leaf"></i>Environment<span class="badge">${product.environmentScore}</span></h2>
											 <p>This company's environmental policies, practices and performance place it among the best 5% of companies rated by EDeC.</p>
											<h2 style="color:#ffb366"><i class="fa fa-child"></i>Society<span class="badge">${product.societyScore}</span></h2>
											<p> This company's social policies, practices and performance place it among the best 5% of companies rated by EDeC.</p>
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
                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img src="${relatedProduct.pictureURL}" alt="">
                                        <div class="product-hover">
                                            <a href="<c:url value="/products/${relatedProduct.name}"/>" class="view-details-link"><i class="fa fa-link"></i>See details</a>
                                        </div>
                                    </div>

                                    <h2><a href="<c:url value="/products/${relatedProduct.name}"/>">${relatedProduct.name}</a></h2>
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