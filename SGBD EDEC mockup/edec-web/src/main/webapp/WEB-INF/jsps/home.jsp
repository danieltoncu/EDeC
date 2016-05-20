
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Titlu</title>
</head>
<body>
<a href="<c:url value="/myaccount"/>">MyAccount</a>
<a href="<c:url value="/search"/>">Search</a>
<a href="j_spring_security_logout">Logout!</a>
<br/>
    <h1>Home Page</h1>
    <h3>Hello ${username}</h3>
</body>
</html>
