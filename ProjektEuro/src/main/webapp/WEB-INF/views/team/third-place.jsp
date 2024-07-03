<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Drużyny na 3. miejscu</title>
</head>
<body>
<h1>Drużyny na 3. miejscu w grupach</h1>
<table border="1">
    <tr>
        <th>Pozycja</th>
        <th>Grupa</th>
        <th>Nazwa</th>
        <th>Punkty</th>
        <th>Akcje</th>
    </tr>
    <c:forEach var="team" items="${teams}" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td>${team.group.name}</td>
            <td>${team.name}</td>
            <td>${team.points}</td>
            <td>
                <a href="${pageContext.request.contextPath}/api/teams/${team.id}">Szczegóły</a>
                <a href="${pageContext.request.contextPath}/api/teams/edit/${team.id}">Edytuj</a>
                <a href="${pageContext.request.contextPath}/api/teams/delete/${team.id}">Usuń</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/api/teams">Wróć do listy drużyn</a>
</body>
</html>