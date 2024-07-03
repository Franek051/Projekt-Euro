<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formularz drużyny</title>
</head>
<body>
<h1><c:choose>
    <c:when test="${team.id != null}">Edytuj drużynę</c:when>
    <c:otherwise>Dodaj nową drużynę</c:otherwise>
</c:choose></h1>
<form action="${pageContext.request.contextPath}/api/teams/save" method="post">
    <input type="hidden" name="id" value="${team.id}">
    <div>
        <label for="name">Nazwa drużyny:</label>
        <input type="text" id="name" name="name" value="${team.name}">
    </div>
    <div>
        <button type="submit">Zapisz</button>
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<a href="${pageContext.request.contextPath}/api/teams">Powrót do listy</a>
</body>
</html>