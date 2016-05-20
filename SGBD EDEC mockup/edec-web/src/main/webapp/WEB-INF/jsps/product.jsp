<%--
  Created by IntelliJ IDEA.
  User: xRicochet
  Date: 13-May-16
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="<c:url value="/myaccount"/>">MyAccount</a>
<a href="<c:url value="/search"/>">Search</a>
<a href="j_spring_security_logout">Logout!</a>
<br/>
    <h1>${product.productName} details</h1>

    Poduct ID :${product.productId}
    <br/>
    Product Brand:${product.productBrand}
    <br/>
    Product Description:${product.productDescription}
    <br/>
    <c:set var="productName" value="${fn:replace(product.productName,
                               ' ', '_')}" />
    <form action="<c:url value="/products/likeproduct?productName=${productName}"/>" method="POST" style="display: inline">
        <input type="submit" value="Like Product" />
    </form>
    <form action="<c:url value="/products/dislikeproduct?productName=${productName}"/>" method="POST" style="display: inline">
        <input type="submit" value="Dislike Product" />
    </form>
</body>
</html>
