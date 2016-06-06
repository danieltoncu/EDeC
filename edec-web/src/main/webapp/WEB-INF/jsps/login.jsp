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

	<%@ include file="citat.jsp" %>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
         <div class="container">
    	  <div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							    
								<form id="login-form" name="f" action="j_spring_security_check" method="post" role="form" style="display: block;">

                                    <c:if test="${not empty errorLogin}">
                                        <div class="alert alert-danger">
                                            Your login was unsuccessful.<br/>
                                            Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                                        </div>
                                    </c:if>
									<div class="form-group">
										<input type="text" name="j_username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="password" name="j_password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form:form id="register-form" action="sign" method="post" commandName="userForm" role="form" style="display: none;">

                                    <c:if test="${not empty errorRegister}">
                                        <div class="alert alert-danger">
                                            Your login was unsuccessful.<br/>
                                            Caused: ${errorMessage}
                                        </div>
                                    </c:if>

									<div class="form-group">
										<form:input path="username" type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username"/>
									</div>
									<div class="form-group">
										<form:input path="email" type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" />
									</div>
									<div class="form-group">
										<form:input path="password" type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" />
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register">
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
        </div>
    <%--</div>--%>

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
	
	<!--Login-->
	<script>
	    $(function() {

    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});
	</script>

  </body>
</html>