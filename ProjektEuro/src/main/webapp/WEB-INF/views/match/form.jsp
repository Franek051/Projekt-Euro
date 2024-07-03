<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formularz Meczu</title>
</head>
<body>
<h1><c:choose>
    <c:when test="${match.id != null}">Edytuj Mecz</c:when>
    <c:otherwise>Dodaj Nowy Mecz</c:otherwise>
</c:choose></h1>
<form:form method="POST" modelAttribute="match" action="${pageContext.request.contextPath}/api/matches/save">
    <form:hidden path="id"/>
    <div>
        <label for="homeTeam">Drużyna Domowa:</label>
        <form:select path="homeTeam.id" items="${teams}" itemValue="id" itemLabel="name"/>
    </div>
    <div>
        <label for="awayTeam">Drużyna Gości:</label>
        <form:select path="awayTeam.id" items="${teams}" itemValue="id" itemLabel="name"/>
    </div>
    <div>
        <label for="matchDateTime">Data Meczu:</label>
        <form:input path="matchDateTime" type="date"/>
    </div>
    <div>
        <label for="location">Lokalizacja:</label>
        <form:select path="location.id" items="${locations}" itemValue="id" itemLabel="name"/>
    </div>
    <div>
        <button type="submit">Zapisz</button>
    </div>
</form:form>
<a href="${pageContext.request.contextPath}/api/matches">Powrót do Listy</a>
</body>
</html>