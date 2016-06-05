<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                                        <li><a href="<c:url value="/search?pag=1&category=ConditionerAndShampoo"/>">Conditioner and Shampoo</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=SkinCare"/>">Skin care</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=BodyWashAndCleaner"/>">Body Wash and Cleaner</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=Makeup"/>">Makeup</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Food</li>
                                        <li><a href="<c:url value="/search?pag=1&category=BreaksAndBakesGoods"/>">Breads and Baked Goods</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=Candy"/>">Candy</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=Snacks"/>">Snacks</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=Drinks"/>">Drinks</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">House hold</li>
                                        <li><a href="<c:url value="/search?pag=1&category=Laundry"/>">Laundry</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=PetFood"/>">Pet Food</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=Dishwashing"/>">Dishwashing</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=HouseholdCleaners"/>">Household Cleaners</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Babies and Kids</li>
                                        <li><a href="<c:url value="/search?pag=1&category=BabyFood"/>">Baby Food</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=BabyLotion"/>">Baby Lotion</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=BabyShampooAndSoap"/>">Baby Shampoo and Soap</a></li>
                                        <li><a href="<c:url value="/search?pag=1&category=BabyWipes"/>">Baby Wipes</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>

<sec:authorize access="hasRole('ROLE_USER')">
                        <!--Userul este logat. afisare dropdown MyAccount-->
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user"></i> ${username}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<c:url value="/myaccount"/>"><i class="fa fa-user"></i> My account</a></li>
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
                            <form:input path="searchInput"  type="text"  class="form-control" placeholder="Search..." />
                        </div>
                        <button type="submit" class="btn btn-default"><b>Search</b></button>

                    </form:form>
                </div>
        </div>
        </nav>
    </div>
    </div>