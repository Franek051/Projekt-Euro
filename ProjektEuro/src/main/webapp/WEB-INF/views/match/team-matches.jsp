<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mecze Drużyny</title>
</head>
<body>
<h1>Mecze Drużyny</h1>
<table>
    <tr>
        <th>Data</th>
        <th>Gospodarz</th>
        <th>Gość</th>
        <th>Wynik</th>
        <th>Akcje</th>
    </tr>
    <c:forEach var="match" items="${matches}">
        <tr>
            <td>${match.matchDateTime}</td>
            <td>${match.homeTeam.name}</td>
            <td>${match.awayTeam.name}</td>
            <td>
                <c:choose>
                    <c:when test="${match.homeTeamScore != null && match.awayTeamScore != null}">
                        ${match.homeTeamScore} - ${match.awayTeamScore}
                    </c:when>
                    <c:otherwise>
                        <em>Niesymulowany</em>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:if test="${match.homeTeamScore == null && match.awayTeamScore == null}">
                    <a href="${pageContext.request.contextPath}/api/matches/${match.homeTeam.id}/${match.id}/simulate">Symuluj</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/api/teams">Powrót do Listy</a>
</body>
</html>