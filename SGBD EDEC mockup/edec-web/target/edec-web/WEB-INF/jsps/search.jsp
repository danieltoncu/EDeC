<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:useBean
        id="products"
        scope="request"
        type="java.util.Map<java.lang.Integer,com.tw.edec.web.models.Product>"/>--%>
<html>
<head>
    <title>Search</title>
</head>
<body>
<a href="<c:url value="/myaccount"/>">MyAccount</a>
<a href="<c:url value="/search"/>">Search</a>
<a href="j_spring_security_logout">Logout!</a>
<br/>
<h1>Search Page</h1>

<form:form method="post" action="search" commandName="searchCriteria">
    <table>
        <tr>
            <td>Search input:</td>
            <td><form:input path="searchInput" type="text" name="searchCriteria" size="15" /></td>
            <td><input type="submit" value="Search Product" /></td>
        </tr>
    </table>
</form:form>

<a href="<c:url value="/search?pag=1&search_query=&category_id=1"/>">Food</a>

<c:if test="${not empty products}">
    <h1>Pagina ${nrPagina}</h1>
    <table>
        <thead>
            <tr>
                <td>Product name</td>
                <td>Product brand</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${products}" var="product" varStatus="i">
                <tr>
                    <td>
                        <c:set var="productName" value="${fn:replace(product.value.productName,
                               ' ', '_')}" />
                        <a href="<c:url value="/products/${productName}"/>">${product.value.productName}</a>
                    </td>
                    <td>
                    ${product.value.productBrand}
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${nrPagina>1}">
        <a href="<c:url value="/search?pag=${nrPagina-1}&search_query=${search_query}&category_id=${category_id}"/>">Prev Page</a>
    </c:if>
    <a href="<c:url value="/search?pag=${nrPagina+1}&search_query=${search_query}&category_id=${category_id}"/>">Next Page</a>
</c:if>

</body>
</html>
