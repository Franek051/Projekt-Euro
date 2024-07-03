<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Finał</title>
</head>
<body>
<h1>Finale</h1>
<table border="1">
    <thead>
    <tr>
        <th>Mecz</th>
        <th>Data</th>
        <th>Lokalizacja</th>
        <th>Wynik</th>
        <th>Akcje</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${match.homeTeam.name} vs ${match.awayTeam.name}</td>
        <td>${match.matchDateTime}</td>
        <td>${match.location.name}</td>
        <td>
            <c:choose>
                <c:when test="${not empty match.homeTeamScore and not empty match.awayTeamScore}">
                    ${match.homeTeamScore} - ${match.awayTeamScore}
                    <c:if test="${not empty match.extraTimeHomeScore and not empty match.extraTimeAwayScore}">
                        (${match.extraTimeHomeScore} - ${match.extraTimeAwayScore} po dogrywce)
                    </c:if>
                    <c:if test="${not empty match.penaltyHomeScore and not empty match.penaltyAwayScore}">
                        (${match.penaltyHomeScore} - ${match.penaltyAwayScore} po rzutach karnych)
                    </c:if>
                </c:when>
                <c:otherwise>
                    Nierozegrany
                </c:otherwise>
            </c:choose>
        </td>
        <td>
            <form action="${pageContext.request.contextPath}/api/knockout/simulate/final/${match.id}" method="post">
                <button type="submit">Symuluj mecz</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </td>
    </tr>
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/api/knockout/champion">Zwycięzca turnieju</a>


</body>
</html>