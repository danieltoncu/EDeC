<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="students" scope="request"
             type="java.util.Map<java.lang.Integer,com.tw.edec.web.models.Student>"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>List Students</h1>
<p>
    <a href="http://www.google.ro">Create new Student</a>
</p>
<table border="1">
    <thead>
    <tr>
        <td>Nume</td>
        <td>Prenume</td>
        <td>An</td>
        <td>Grupa</td>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${students}" var="student" varStatus="i">
        <tr>
            <td>${student.value.nume}</td>
            <td>${student.value.prenume}</td>
            <td>${student.value.an}</td>
            <td>${student.value.grupa}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
