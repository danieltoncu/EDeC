<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    <div class="mainmenu-area" style="height: 61px">
        <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".js-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse js-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="<c:url value="/home"/>"><i class="fa fa-home"></i> Home</a></li>
                        <li><a href="<c:url value="/about"/>"><i class="fa fa-book"></i> About</a></li>
                        <li class="dropdown mega-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Product Categories <span class="caret"></span></a>
                            <ul class="dropdown-menu mega-dropdown-menu">
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Personal care</li>
                                        <li><a href="#">Conditioner and Shampoo</a></li>
                                        <li><a href="#">Skin care</a></li>
                                        <li><a href="#">Body Wash and Cleaner</a></li>
                                        <li><a href="#">Makeup</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Food</li>
                                        <li><a href="#">Breads and Baked Goods</a></li>
                                        <li><a href="#">Candy</a></li>
                                        <li><a href="#">Snacks</a></li>
                                        <li><a href="#">Drinks</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">House hold</li>
                                        <li><a href="#">Laundry</a></li>
                                        <li><a href="#">Pet Food</a></li>
                                        <li><a href="#">Dishwashing</a></li>
                                        <li><a href="#">Household Cleaners</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Babies and Kids</li>
                                        <li><a href="#">Baby Food</a></li>
                                        <li><a href="#">Baby Lotion</a></li>
                                        <li><a href="#">Baby Shampoo and Soap</a></li>
                                        <li><a href="#">Baby Wipes</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>

<sec:authorize access="hasRole('ROLE_USER')">
                        <!--Userul este logat. afisare dropdown MyAccount-->
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user"></i> ${username}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="fa fa-user"></i> My account</a></li>
                                <c:url value="/j_spring_security_logout" var="logoutUrl" />
                                <li><a href="${logoutUrl}"><i class="fa fa-user"></i> Log Out</a></li>
                            </ul>
                        </li>
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_USER')">
                        <!--Userul nu e logat. afisare login/register-->
                        <li><a href="<c:url value="/sign"/>"><i class="fa fa-user"></i> Login/Register</a></li>
</sec:authorize>

                    </ul>
                        <c:url value="/search" var="search" />
                    <form:form class="navbar-form navbar-right" method="post" action="${search}" commandName="searchCriteria" role="search">
                        <div class="form-group">
                            <form:input path="searchInput" name="searchCriteria" type="text"  class="form-control" placeholder="Search..." />
                        </div>
                        <button type="submit" class="btn btn-default"><b>Search</b></button>

                    </form:form>
                </div>
        </div>
        </nav>
    </div>
    </div>