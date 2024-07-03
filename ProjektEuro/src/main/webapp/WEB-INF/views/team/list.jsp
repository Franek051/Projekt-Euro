<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Drużyn</title>
</head>
<body>
<h1>Lista Drużyn</h1>
<table border="1">
    <tr>
        <th>Pozycja</th>
        <th>Nazwa</th>
        <th>Punkty</th>
        <th>Akcje</th>
    </tr>
    <c:set var="previousGroup" value="" />
    <c:set var="position" value="0" />
    <c:forEach var="team" items="${teams}">
        <c:choose>
            <c:when test="${empty previousGroup || previousGroup ne team.group.name}">
                <c:set var="position" value="1" />
                <tr>
                    <td colspan="4"><strong>Grupa ${team.group.name}</strong></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:set var="position" value="${position + 1}" />
            </c:otherwise>
        </c:choose>
        <tr>
            <td>${position}</td>
            <td>${team.name}</td>
            <td>${team.points}</td>
            <td>
                <a href="${pageContext.request.contextPath}/api/teams/${team.id}">Szczegóły</a>
                <a href="${pageContext.request.contextPath}/api/teams/edit/${team.id}">Edytuj</a>
                <a href="${pageContext.request.contextPath}/api/teams/delete/${team.id}">Usuń</a>
            </td>
        </tr>
        <c:set var="previousGroup" value="${team.group.name}" />
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/api/teams/third-place">Zobacz tabele drużyn zajmujących 3 miejsce</a><br>
<form action="${pageContext.request.contextPath}/api/teams/reset-points" method="post">
    <button type="submit">Resetuj punkty wszystkich drużyn</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<a href="${pageContext.request.contextPath}/api/teams/new">Dodaj nową drużynę</a>
<form action="${pageContext.request.contextPath}/api/knockout/setup-round-of-16" method="post">
    <button type="submit">Przejdź do 1/8 Finału</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>