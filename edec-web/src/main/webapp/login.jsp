<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EDeC</title>
      <style type="text/css">
          .errorblock{
              color:#ff0000;
              background-color:#ffEEEE;
              border:3px solid #ff0000;
              padding:8px;
              margin:16px;
          }
      </style>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/responsive.css" />">

  </head>
  <body onload='document.f.j_username.focus();'>

  <c:if test="${not empty error}">
      <div class="errorblock">
          Your login was unsuccessful.<br/>
          Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
      </div>
  </c:if>

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

    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
					    <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
						<li><a href="#"><i class="fa fa-book"></i> About</a></li>
						<li class="dropdown">
                         <a class="dropdown-toggle" data-toggle="dropdown" href="#">Products Categories <span class="caret"></span></a>
                         <ul class="dropdown-menu">
                         <li><a href="#">Personal care</a></li>
                         <li><a href="#">Food</a></li>
                         <li><a href="#">Household</a></li>
                         <li><a href="#">Babies & Kids</a></li>
                         </ul>
                         </li>
						<li class="active"><a href="#"><i class="fa fa-user"></i> Login</a></li>
						<li><a href="#"><i class="fa fa-user"></i> My Account</a></li>
                    </ul>

						<form class="navbar-form navbar-right" role="search">
                          <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search...">
                           </div>
                           <button type="submit" class="btn btn-default">Search</button>
                        </form>
                </div>
            </div>
        </div>
    </div>

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
                <div class="col-xs-6">

                   <form action="j_spring_security_check" class="checkout" method="post" name="f">

                                <div id="customer_details" class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">
                                            <h3>Log In</h3>
											 <p>Please enter your details in the boxes below. If you are a new customer please proceed to the Sign Up section.</p>

                                <p class="form-row form-row-first">
                                    <label for="username">Username or email <span class="required">*</span>
                                    </label>
                                    <input type="text" id="username" name="j_username" class="input-text">
                                </p>
                                <p class="form-row form-row-last">
                                    <label for="password">Password <span class="required">*</span>
                                    </label>
                                    <input type="password" id="password" name="j_password" class="input-text">
                                </p>
                                <div class="clear"></div>


                                <p class="form-row">
                                    <input type="submit" value="Login" name="login" class="button">
                                    <label class="inline" for="rememberme"><input type="checkbox" value="forever" id="rememberme" name="rememberme"> Remember me </label>
                                </p>
                                <p class="lost_password">
                                    <a href="#">Lost your password?</a>
                                </p>

                                <div class="clear"></div>

                                        </div>
                                    </div>
                                </div>
                            </form>

                </div>

                 <div class="col-xs-6">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">

                                <div id="customer_details" class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">
                                            <h3>Sign Up</h3>
											<p>Please enter your details in the boxes below.</p>
                                             <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">Username <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
                                            </p>
                                            <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                <label class="" for="billing_email">Email Address <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_email" name="billing_email" class="input-text ">
                                            </p>
											<p class="form-row form-row-last">
                                                 <label for="password">Password <span class="required">*</span>
                                                 </label>
                                                 <input type="password" id="password" name="password" class="input-text">
                                            </p>
                                             <div class="clear"></div>
                                            <p class="form-row">
                                              <input type="submit" value="Sign Up" name="login" class="button">
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2><span>EDeC</span></h2>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">User Navigation </h2>
                        <ul>
                             <li><a href="#">Ratings</a></li>
                            <li><a href="#">My account</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Front page</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="">Personal Care</a></li>
                            <li><a href="">Food</a></li>
                            <li><a href="">Household</a></li>
                            <li><a href="">Babies & Kids</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2016 EDeC. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <!-- Latest jQuery form server -->
  <script src="https://code.jquery.com/jquery.min.js"></script>

  <!-- Bootstrap JS form CDN -->
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
  <script src="<c:url value="/resources/js/jquery.sticky.js" />"></script>
  <script src="<c:url value="/resources/js/jquery.easing.1.3.min.js" />"></script>
  <script src="<c:url value="/resources/js/main.js" />"></script>

  </body>
</html>