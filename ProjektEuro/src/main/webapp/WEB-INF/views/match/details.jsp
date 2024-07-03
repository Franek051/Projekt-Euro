<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szczegóły Meczu</title>
</head>
<body>
<h1>Szczegóły Meczu</h1>
<p>ID: ${match.id}</p>
<p>Drużyna Domowa: ${match.homeTeam.name}</p>
<p>Drużyna Gości: ${match.awayTeam.name}</p>
<p>Wynik:
    <c:choose>
        <c:when test="${match.homeTeamScore != null && match.awayTeamScore != null}">
            ${match.homeTeamScore} - ${match.awayTeamScore}
        </c:when>
        <c:otherwise>
            <em>Niesymulowany</em>
        </c:otherwise>
    </c:choose>
</p>
<a href="${pageContext.request.contextPath}/api/matches">Powrót do Listy</a>
</body>
</html>