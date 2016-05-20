<%--
  Created by IntelliJ IDEA.
  User: xRicochet
  Date: 13-May-16
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="<c:url value="/myaccount"/>">MyAccount</a>
<a href="<c:url value="/search"/>">Search</a>
<a href="j_spring_security_logout">Logout!</a>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <form action="<c:url value="/myaccount"/>" method="POST" style="display: inline">
        <input type="submit" value="Export DB" />
    </form>
</sec:authorize>
<br/>
    <h1>${username}s personal account page</h1>
    <br/>
    <h3>User Liked Products</h3>
    <c:if test="${not empty userLikedProducts}">
        <table>
            <thead>
            <tr>
                <td>Product name</td>
                <td>Remove Like</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userLikedProducts}" var="product" varStatus="i">
                <tr>
                    <td>
                        <c:set var="productName" value="${fn:replace(product.value.productName,
                               ' ', '_')}" />
                        <a href="<c:url value="/products/${productName}"/>">${product.value.productName}</a>
                    </td>
                    <td>
                        <form action="<c:url value="/products/removelikeproduct?productName=${productName}"/>" method="POST" style="display: inline">
                            <input type="submit" value="Remove ike Product" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <br/>
    <h3>User Disliked Products</h3>
    <c:if test="${not empty userDislikedProducts}">
        <table>
            <thead>
            <tr>
                <td>Product name</td>
                <td>Remove Dislike</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userDislikedProducts}" var="product" varStatus="i">
                <tr>
                    <td>
                        <c:set var="productName" value="${fn:replace(product.value.productName,
                               ' ', '_')}" />
                        <a href="<c:url value="/products/${productName}"/>">${product.value.productName}</a>
                    </td>
                    <td>
                        <form action="<c:url value="/products/removedislikeproduct?productName=${productName}"/>" method="POST" style="display: inline">
                            <input type="submit" value="Remove Dislike Product" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
