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
                <div class="col-md-3">
                    
                     <div class="single-sidebar">
                        <h2 class="sidebar-title">Latest Products</h2>
                         <c:forEach items="${latestProducts}" var="latestProduct" varStatus="i">
                             <c:set var="url" value="/products/${latestProduct.name}"/>
                             <c:set var="productURL" value="${fn:replace(url,' ','%20')}"/>
                             <div class="thubmnail-recent">
                                 <img STYLE="max-width:100%; max-height:100%;object-fit:contain;" src="${latestProduct.pictureURL}" class="recent-thumb" alt="">
                                 <h2><a href="<c:url value="${productURL}"/>">${latestProduct.name}</a></h2>
                                 <div class="product-wid-rating">
                                     <p><b>${latestProduct.overallScore}</b></p>
                                 </div>
                             </div>
                         </c:forEach>
                    </div>
                </div>
				    <div class="col-sm-9">
                    <div class="single-sidebar">
                    <div class="info-tile-header" >
                        <div class="centerr">
						<h1>Ratings</h1>
						<p>EDeC ratings range from 0 to 10 &mdash; the higher the score, the better the product. Our scores are based on evaluations of a comprehensive set of health, environmental and social issues. If you are looking to switch to a better product, EDeC&#39;s summary rating can be used to easily identify the best products in a category. If you are looking for more detail, you can drill down from our summary rating to learn more about a product or company’s performance.</p>
				        
						<p><strong>EDeC&#39;s summary rating combines product- and company-level information to characterize a product&#39;s health, environmental and social impacts. The best products rate 8 or above; the worst rate 4 or below.</strong>  We provide a summary score because consumers want simple, actionable information that makes it easy to select better products.  See the Scoring section below to learn how to interpret EDeC&#39;s numerical 0-10 scale.</p>

                        <p><strong>EDeC&#39;s summary rating is compiled from three sub-scores addressing Health, Environment and Society.</strong>   In each of these broad areas of concern, EDeC identifies the critical issues that need to be evaluated and collects data on a set of indicators that are the best-available measures for assessing performance on that issue.  See the Health, Environmental and Society sections below to learn more about the issues that EDeC covers.</p>

                        <p><strong>EDeC makes it easy to unpack any summary rating and see how a product or company performs on every issue and indicator we track.</strong>  To view the complete set of indicators used to derive any rating, select the drop-down arrow on any Health, Environment or Society score on the EDeC website or follow the &ldquo;Behind the Ratings&rdquo; link in our mobile applications.</p>

                        <h2>What&#39;s Covered in our Ratings: Health</h2>

                        <p><strong>Our Health score characterizes the potential health impacts associated with use of a product.</strong>  GoodGuide uses a common assessment framework, pictured here, to organize the various indicators that are available to score products on Health.  There are four broad classes of indicators:</p>
                        <ol><li><strong>Human health impact</strong> indicators provide information about the potential health effects of a product category: What degree of health concern do product ingredients pose? What is the overall nutritional value of a food product?</li><li><strong>Data adequacy</strong> indicators track whether the information needed to assess health risks is available for a product.</li><li><strong>Other negative aspect</strong> indicators provide information about how a product is produced and regulated: Are any of its ingredients banned or restricted? Does its production involve the use of &ldquo;bad-actor&rdquo; chemicals targeted for phase-out? Does it contain contaminants from its production process?</li><li><strong>Product management</strong> indicators identify whether a company or its products are managed sustainably, based on third-party certifications that verify health or environmental performance.</li></ol>
                        <p>The availability and type of health scores vary across different product categories:</p>
                        <ul><li>For personal care and household chemical products, health scores are driven by the number of ingredients in a product that are of health or regulatory concern.</li><li>For food and beverage products, health scores are driven by our assessment of the nutritional value of the product, based on its ratio of recommended to restricted nutrients.</li><li>For other product categories like paper, lighting or appliances, no health scores are assigned because typical product use is not associated with any human health issues.</li></ul>
                        <h2>What&#39;s Covered in our Ratings: Environment</h2>

                        <p><strong>Our Environment score characterizes the potential environmental impacts associated with the manufacture, sale, use and disposal of a product.</strong>  GoodGuide uses a common assessment framework to organize the various indicators that are available to score products or companies on environmental performance.  There are four broad classes of indicators:</p>
                        <ol><li><strong>Environmental management</strong> indicators characterize overall corporate governance, the policies and practices a company has adopted (including their applicability to its supply chain), a company&#39;s compliance record and involvement in controversies, and whether a company is engaged in any exemplary practices.</li><li><strong>Transparency</strong> indicators track whether the information needed to assess environmental issues is made available by a company.  Resource use indicators track natural resource inputs used by a company to manufacture products, including materials, water, and energy.</li><li><strong>Environmental impact</strong> indicators track the outputs of a company&#39;s manufacturing processes, including whether a company&#39;s emissions or production practices are contributing to global warming, creating air or water pollution, generating waste, or adversely affecting ecosystems or biodiversity.</li></ol>
                        <p>Whenever possible, EDeC evaluates both the environmental characteristics of a specific product and the environmental policies and performance of the product&#39;s manufacturer.  However, because the availability of product-level environmental data is limited and varies by product category, EDeC&#39;s Environment scores are primarily based on company-level data.  The relative contribution of product- vs company-level data to Environment scores varies by product category:</p>
                        <ul><li>Environment scores are solely based on company-level data for personal care products, household chemicals, food, pet food, and apparel.</li><li>Product-level data contributes 25% of Environment scores for tampons, diapers and drinks.</li><li>Product-level data contributes 50% of Environment scores for cell phones.</li><li>Product-level data contributes 75% of Environment scores for bulk coffees and teas, chocolate, paper, lighting products, and appliances.</li></ul>
                        <h2>What&#39;s Covered in our Ratings: Society</h2>

                        <p><strong>Our Social score characterizes the social impacts associated with the manufacture and sale of a product.</strong> GoodGuide uses a common assessment framework to organize the various indicators that are available to score products or companies on social performance.  There are five broad classes of indicators:</p>
                        <ol><li><strong>Management</strong> indicators characterize overall corporate governance, the policies and practices a company has adopted (including their applicability to its supply chain), a  company&#39;s compliance record and involvement in controversies, and whether a company is engaged in any exemplary practices.</li><li><strong>Transparency</strong> indicators track whether the information needed to assess social issues is made available by a company.</li><li><strong>Consumer</strong> indicators include customer health and safety policies and controversies and product recalls, as well as information about labeling and marketing practices.</li><li><strong>Community</strong> indicators track a company&#39;s community relationships, stakeholder engagement initiatives, and public policy positions.</li><li><strong>Worker</strong> indicators track company performance on occupational safety and health, diversity and equal opportunity, and human and labor rights.</li></ol>
                        <p>Because the availability of product-level social data is limited and varies by product category, EDeC&#39;s Social scores are primarily based on company-level data.  The relative contribution of product- vs company-level data to Social scores varies by product category:</p>
                        <ul><li>Social scores are based solely on company-level data for personal care, household chemicals, food, pet food, paper products, apparel, cell phones, lighting products, and appliances.</li><li>Product-level data contributes 50% of Social scores for bulk coffees and teas and chocolate.</li></ul></div>
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