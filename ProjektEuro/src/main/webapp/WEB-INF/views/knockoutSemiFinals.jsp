<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>1/2 Finału</title>
</head>
<body>
<h1>1/2 Finału</h1>
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
    <c:forEach var="match" items="${matches}">
        <tr>
            <td>${match.homeTeam.name} vs ${match.awayTeam.name}</td>
            <td>${match.matchDateTime}</td>
            <td>${match.location.name}</td>
            <td>
                <c:choose>
                    <c:when test="${match.homeTeamScore != null && match.awayTeamScore != null}">
                        ${match.homeTeamScore} - ${match.awayTeamScore}
                        <c:if test="${match.extraTimeHomeScore != null && match.extraTimeAwayScore != null}">
                            (${match.extraTimeHomeScore} - ${match.extraTimeAwayScore} po dogrywce)
                        </c:if>
                        <c:if test="${match.penaltyHomeScore != null && match.penaltyAwayScore != null}">
                            (${match.penaltyHomeScore} - ${match.penaltyAwayScore} po rzutach karnych)
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        Nierozegrany
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/api/knockout/simulate/semi-finals/${match.id}" method="post">
                    <button type="submit">Symuluj mecz</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<form action="${pageContext.request.contextPath}/api/knockout/setup-final" method="post">
    <button type="submit">Przejdź do Finału</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>


</body>
</html>