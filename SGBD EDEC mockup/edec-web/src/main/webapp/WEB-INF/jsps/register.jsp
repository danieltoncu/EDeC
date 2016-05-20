<%--
  Created by IntelliJ IDEA.
  User: xRicochet
  Date: 13-May-16
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration</title>
    <style type="text/css">
        .errorblock{
            color:#ff0000;
            background-color:#ffEEEE;
            border:3px solid #ff0000;
            padding:8px;
            margin:16px;
        }

    </style>
</head>
<body>
<a href="<c:url value="/login"/>">Login</a>
<div align="center">
    <c:if test="${not empty error}">
        <div class="errorblock">
            Your login was unsuccessful.<br/>
            Caused: ${errorMessage}
        </div>
    </c:if>

    <form:form action="register" method="post" commandName="userForm">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Spring MVC Form Demo - Registration</h2></td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td><form:input path="username" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><form:password path="password" /></td>
            </tr>
            <tr>
                <td>E-mail:</td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Register" /></td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>