<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Meczów</title>
</head>
<body>
<h1>Lista Meczów</h1>
<table border="1">
    <thead>
    <tr>

        <th>Drużyna Domowa</th>
        <th>Drużyna Gości</th>
        <th>Akcje</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="match" items="${matches}">
        <tr>

            <td>${match.homeTeam.name}</td>
            <td>${match.awayTeam.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/api/matches/${match.id}">Szczegóły</a>
                <a href="${pageContext.request.contextPath}/api/matches/edit/${match.id}">Edytuj</a>
                <a href="${pageContext.request.contextPath}/api/matches/delete/${match.id}">Usuń</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="${pageContext.request.contextPath}/api/matches/new">Dodaj Nowy Mecz</a>
</body>
</html>
